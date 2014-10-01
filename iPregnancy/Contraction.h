//
//  Contraction.h
//  iPregnancy
//
//  Created by Ray on 1/10/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contraction : NSManagedObject

@property (nonatomic, retain) NSDate * starttime;
@property (nonatomic, retain) NSDate * endtime;
@property (nonatomic, retain) NSString * duration;
@property (nonatomic, retain) NSString * frequency;

@end
