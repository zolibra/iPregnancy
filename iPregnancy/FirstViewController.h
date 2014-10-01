//
//  FirstViewController.h
//  iPregnancy
//
//  Created by Ray on 1/10/14.
//
//

#import <UIKit/UIKit.h>
#import "MZTimerLabel.h"
#import "CoreData+MagicalRecord.h"

@interface FirstViewController : UIViewController <MZTimerLabelDelegate, NSFetchedResultsControllerDelegate,UITableViewDataSource, UITableViewDelegate>{
    MZTimerLabel *timerlable;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *timerLable;
@property (weak, nonatomic) IBOutlet UILabel *kickLable;
@property (weak, nonatomic) IBOutlet UIButton *btnStart;
@property (weak, nonatomic) IBOutlet UIButton *btnKick;


@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UIButton *startOrStopStopwatch;

@end
