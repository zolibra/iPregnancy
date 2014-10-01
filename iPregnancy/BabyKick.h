//
//  BabyKick.h
//  iPregnancy
//
//  Created by Ray on 1/12/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BabyKick : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSDate * starttime;
@property (nonatomic, retain) NSString * duration;
@property (nonatomic, retain) NSNumber * kicks;

@end
