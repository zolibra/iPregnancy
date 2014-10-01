//
//  SecondViewController.h
//  iPregnancy
//
//  Created by Ray on 1/10/14.
//
//

#import <UIKit/UIKit.h>
#import "MZTimerLabel.h"
#import "CoreData+MagicalRecord.h"
#import "UIButton+Bootstrap.h"


@interface SecondViewController : UIViewController <MZTimerLabelDelegate, NSFetchedResultsControllerDelegate,UITableViewDataSource, UITableViewDelegate>{
    MZTimerLabel *timerlable;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *timerLable;


@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UIButton *btnStartPause;
- (IBAction)startOrStopStopwatch:(id)sender;


@end
