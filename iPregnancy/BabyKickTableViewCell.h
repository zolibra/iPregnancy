//
//  BabyKickTableViewCell.h
//  iPregnancy
//
//  Created by Ray on 1/13/14.
//
//

#import <UIKit/UIKit.h>
#import "BabyKick.h"

@interface BabyKickTableViewCell : UITableViewCell
@property (nonatomic,retain) BabyKick *babyKick;

@property (retain, nonatomic) UILabel *dateLable;
@property (retain, nonatomic) UILabel *stLable;
@property (retain, nonatomic) UILabel *durationLable;
@property (retain, nonatomic) UILabel *countLable;
@end
