//
//  ContractionTableViewCell.m
//  iPregnancy
//
//  Created by Ray on 1/10/14.
//
//

#import "ContractionTableViewCell.h"

@interface ContractionTableViewCell(SubviewFrames)
- (CGRect)_stLableFrame;
- (CGRect)_etLableFrame;
- (CGRect)_durationLableFrame;
- (CGRect)_freqLableFrame;

@end

@implementation ContractionTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _stLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_stLable setFont:[UIFont fontWithName:@"Helvetia" size:12.0]];
        [_stLable setTextColor: [UIColor colorWithRed:66/255.0 green:139/255.0 blue:202/255.0 alpha:1]];
        [_stLable setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_stLable];
        
        
        _etLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_etLable setFont:[UIFont fontWithName:@"Helvetia" size:12.0]];
        [_etLable setTextColor: [UIColor colorWithRed:66/255.0 green:139/255.0 blue:202/255.0 alpha:1]];
        [_etLable setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_etLable];

        _durationLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_durationLable setFont:[UIFont fontWithName:@"Helvetia" size:12.0]];
        [_durationLable setTextColor: [UIColor colorWithRed:66/255.0 green:139/255.0 blue:202/255.0 alpha:1]];
        [_durationLable setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_durationLable];

        _freqLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_freqLable setFont:[UIFont fontWithName:@"Helvetia" size:12.0]];
        [_freqLable setTextColor: [UIColor colorWithRed:66/255.0 green:139/255.0 blue:202/255.0 alpha:1]];
        [_freqLable setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_freqLable];

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
	
    [_stLable setFrame:[self _stLableFrame]];
    [_etLable setFrame:[self _etLableFrame]];
    [_durationLable setFrame:[self _durationLableFrame]];
    [_freqLable setFrame:[self _freqLableFrame]];

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

- (CGRect)_freqLableFrame{
    return CGRectMake(LABLE_SIZE + TEXT_LEFT_MARGIN + LABLE_DISTANCE*6, 4.0 + NAME_LABLE_HIGHT_OFFSET, self.contentView.bounds.size.width - LABLE_SIZE - TEXT_RIGHT_MARGIN * 2 - PREP_TIME_WIDTH, 18.0 + NAME_LABLE_HIGHT_OFFSET);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setContraction:(Contraction *)contraction{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm"];
    
    _contraction = contraction;
    NSString *starttime = [dateFormat stringFromDate:[contraction starttime]];
    _stLable.text = starttime;
    
    NSString *endtime = [dateFormat stringFromDate:[contraction endtime]];
    _etLable.text = endtime;
    _durationLable.text = [contraction duration];
    _freqLable.text = [contraction frequency];
    
}
@end
