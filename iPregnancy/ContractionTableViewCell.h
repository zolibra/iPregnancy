//
//  ContractionTableViewCell.h
//  iPregnancy
//
//  Created by Ray on 1/10/14.
//
//

#import <UIKit/UIKit.h>
#import "Contraction.h"

@interface ContractionTableViewCell : UITableViewCell
@property (nonatomic,retain) Contraction *contraction;

@property (retain, nonatomic) UILabel *stLable;
@property (retain, nonatomic) UILabel *etLable;
@property (retain, nonatomic) UILabel *durationLable;
@property (retain, nonatomic) UILabel *freqLable;

@end
