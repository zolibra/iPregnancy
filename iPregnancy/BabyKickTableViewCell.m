//
//  BabyKickTableViewCell.m
//  iPregnancy
//
//  Created by Ray on 1/13/14.
//
//

#import "BabyKickTableViewCell.h"
@interface BabyKickTableViewCell(SubviewFrames)
- (CGRect)_stLableFrame;
- (CGRect)_etLableFrame;
- (CGRect)_durationLableFrame;
- (CGRect)_countLableFrame;
@end

@implementation BabyKickTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _dateLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_dateLable setFont:[UIFont fontWithName:@"Helvetia" size:12.0]];
        [_dateLable setTextColor: [UIColor colorWithRed:66/255.0 green:139/255.0 blue:202/255.0 alpha:1]];
        [_dateLable setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_dateLable];
        
        
        _stLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_stLable setFont:[UIFont fontWithName:@"Helvetia" size:12.0]];
        [_stLable setTextColor: [UIColor colorWithRed:66/255.0 green:139/255.0 blue:202/255.0 alpha:1]];
        [_stLable setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_stLable];
        
        _durationLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_durationLable setFont:[UIFont fontWithName:@"Helvetia" size:12.0]];
        [_durationLable setTextColor: [UIColor colorWithRed:66/255.0 green:139/255.0 blue:202/255.0 alpha:1]];
        [_durationLable setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_durationLable];
        
        _countLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_countLable setFont:[UIFont fontWithName:@"Helvetia" size:12.0]];
        [_countLable setTextColor: [UIColor colorWithRed:66/255.0 green:139/255.0 blue:202/255.0 alpha:1]];
        [_countLable setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_countLable];
        
    }
    
    return self;
}

#define LABLE_SIZE          10.0
#define EDITING_INSET       10.0
#define TEXT_LEFT_MARGIN    8.0
#define TEXT_RIGHT_MARGIN   5.0
#define PREP_TIME_WIDTH     80.0
#define LABLE_DISTANCE     40.0


#define NAME_LABLE_HIGHT_OFFSET 4.0



- (void)layoutSubviews {
    [super layoutSubviews];
	
    [_dateLable setFrame:[self _stLableFrame]];
    [_stLable setFrame:[self _etLableFrame]];
    [_durationLable setFrame:[self _durationLableFrame]];
    [_countLable setFrame:[self _countLableFrame]];
    
}

- (CGRect)_stLableFrame {
    return CGRectMake(LABLE_SIZE + TEXT_LEFT_MARGIN, 4.0 + NAME_LABLE_HIGHT_OFFSET, self.contentView.bounds.size.width - LABLE_SIZE - TEXT_RIGHT_MARGIN * 2 - PREP_TIME_WIDTH, 18.0 + NAME_LABLE_HIGHT_OFFSET);
}

- (CGRect)_etLableFrame{
    return CGRectMake(LABLE_SIZE + TEXT_LEFT_MARGIN + LABLE_DISTANCE*2, 4.0 + NAME_LABLE_HIGHT_OFFSET, self.contentView.bounds.size.width - LABLE_SIZE - TEXT_RIGHT_MARGIN * 2 - PREP_TIME_WIDTH, 18.0 + NAME_LABLE_HIGHT_OFFSET);
}

- (CGRect)_durationLableFrame{
    
    return CGRectMake(LABLE_SIZE + TEXT_LEFT_MARGIN+ LABLE_DISTANCE*4, 4.0 + NAME_LABLE_HIGHT_OFFSET, self.contentView.bounds.size.width - LABLE_SIZE - TEXT_RIGHT_MARGIN * 2 - PREP_TIME_WIDTH, 18.0 + NAME_LABLE_HIGHT_OFFSET);
}

- (CGRect)_countLableFrame{
    return CGRectMake(LABLE_SIZE + TEXT_LEFT_MARGIN + LABLE_DISTANCE*6, 4.0 + NAME_LABLE_HIGHT_OFFSET, self.contentView.bounds.size.width - LABLE_SIZE - TEXT_RIGHT_MARGIN * 2 - PREP_TIME_WIDTH, 18.0 + NAME_LABLE_HIGHT_OFFSET);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setBabyKick:(BabyKick *)babykick{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"YY/MM/DD"];
    
    _babyKick = babykick;
    NSString *date = [dateFormat stringFromDate:[babykick date]];
    _dateLable.text = date;
    
    [dateFormat setDateFormat:@"HH:mm"];

    NSString *starttime = [dateFormat stringFromDate:[babykick starttime]];
    _stLable.text = starttime;
    _durationLable.text = [babykick duration];
    _countLable.text =  [NSString stringWithFormat:@"%@",babykick.kicks];
    
}

@end
