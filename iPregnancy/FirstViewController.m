//
//  FirstViewController.m
//  iPregnancy
//
//  Created by Ray on 1/10/14.
//
//

#import "FirstViewController.h"
#import "UIButton+Bootstrap.h"
#import "BabyKick.h"
#import "BabyKickTableViewCell.h"

@interface FirstViewController ()
@property (nonatomic, strong) NSDate *startdate;
@property (nonatomic, strong) NSDate *enddate;
@property  (nonatomic) NSInteger count;
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    timerlable = [[MZTimerLabel alloc] initWithLabel:_timerLable andTimerType:MZTimerLabelTypeStopWatch];
    [timerlable setStopWatchTime:0];
    [_btnStart primaryStyle];
    [_btnKick successStyle];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)startOrStopStopwatch:(id)sender {
    
    if([timerlable counting]){
        [timerlable pause];
        [timerlable reset];
        [_btnStart setTitle:@"Start" forState:UIControlStateNormal];
        BabyKick  *kik = [BabyKick MR_createEntity];
        NSDate *now = [NSDate date];
        kik.date = _startdate;
        kik.starttime = _startdate;
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSUInteger unitFlags = NSCalendarUnitMinute | NSCalendarUnitSecond;
        
        NSDateComponents *components = [gregorian components:unitFlags fromDate:_startdate toDate:now options:0];
        
        NSInteger min = [components minute];
        NSInteger second = [components second];
        NSLog(@"duration: %ld min %ld second", min, second);
        NSString *duration;
        if (min == 0) {
            duration = [NSString stringWithFormat:@"%lds",second];
        }else{
            duration = [NSString stringWithFormat:@"%ldm%lds",min,second];
        }
        kik.duration = duration;
        kik.kicks =  [NSNumber numberWithInt:_count];
        NSManagedObjectContext* context = kik.managedObjectContext;
        [context MR_saveToPersistentStoreAndWait];
    }else{
        [timerlable start];
        _count = 0;
        _kickLable.text = @"0";
        _startdate = [NSDate date];
        [_btnStart setTitle:@"Stop" forState:UIControlStateNormal];
    }
}
- (IBAction)kickIncrement:(id)sender {
    _count++;
    _kickLable.text = [NSString stringWithFormat:@"%ld",_count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark TableViewController Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger count = [[self.fetchedResultsController sections] count];
    
	if (count == 0) {
		count = 1;
	}
	
    return count;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = 0;
	
    if ([[self.fetchedResultsController sections] count] > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
        numberOfRows = [sectionInfo numberOfObjects];
    }
    
    return numberOfRows;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        id managedObject = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [managedObject MR_deleteEntity];
        [[managedObject managedObjectContext] MR_saveToPersistentStoreAndWait];
	}
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue or if necessary create a RecipeTableViewCell, then set its recipe to the recipe for the current row.
    static NSString *BabyKicksCellIdentifier = @"KickCell";
    
    BabyKickTableViewCell *cell = (BabyKickTableViewCell *)[tableView dequeueReusableCellWithIdentifier:BabyKicksCellIdentifier ];
    if ( ! cell) {
        cell = [[BabyKickTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BabyKicksCellIdentifier];
        //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //        [cell.layer setCornerRadius:7.0f];
        //        [cell.layer setMasksToBounds:NO];
        //        [cell.layer setBorderWidth:1.0f];
        //        UIColor *mycolor =  [UIColor grayColor];
        //        [cell.layer setBorderColor:mycolor.CGColor];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
    
}


- (void)configureCell:(BabyKickTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell
	BabyKick *kik = (BabyKick *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.babyKick = kik;
}

#pragma mark -
#pragma mark Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController {
    // Set up the fetched results controller if needed.
    if (_fetchedResultsController == nil) {
        self.fetchedResultsController = [BabyKick MR_fetchAllSortedBy:@"date" ascending:YES withPredicate:nil groupBy:nil delegate:self];
    }
    
	return _fetchedResultsController;
}

- (void)reloadFetchedResults:(NSNotification*)note {
    
    NSError *error = nil;
	if (![[self fetchedResultsController] performFetch:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		abort();
	}
    
    if (note) {
        [self.tableView reloadData];
    }
}

/**
 Delegate methods of NSFetchedResultsController to respond to additions, removals and so on.
 */

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
	// The fetch controller is about to start sending change notifications, so prepare the table view for updates.
	[self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
	UITableView *tableView = self.tableView;
	
	switch(type) {
		case NSFetchedResultsChangeInsert:
			[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeDelete:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeUpdate:
			[self configureCell:(BabyKickTableViewCell *)[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
			break;
			
		case NSFetchedResultsChangeMove:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
	}
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
	switch(type) {
		case NSFetchedResultsChangeInsert:
			[self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeDelete:
			[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
	}
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	// The fetch controller has sent all current change notifications, so tell the table view to process all updates.
	[self.tableView endUpdates];
}


@end
