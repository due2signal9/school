//
//  SFMineHeadView.m
//  school
//
//  Created by Oliver Mac on 2018/7/30.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFMineHeadView.h"

@implementation SFMineHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    
    CGRect f = CGRectMake(0, 0, SF_RELATIVE_SCREEN_WIDTH, 175.0);
    self = [super initWithFrame:f];
    
    if (self)
    {
        
        [self initSubviews];
        [self setupSubviews];
    }
    
    return self;
}

- (void)initSubviews {
    
    [self setAvatar:[[UIImageView alloc] init]];
    [self addSubview:[self avatar]];
    [self setNameLabel:[[UILabel alloc] init]];
    [self addSubview:[self nameLabel]];
    [[self nameLabel] setTextColor:[UIColor grayColor]];
    [[self nameLabel] setTextAlignment:NSTextAlignmentCenter];
    
    [[self nameLabel] setText:@"i am test"];
}

- (void)setupSubviews {
    
    [[self avatar] mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.height.mas_equalTo(49.0);
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [[self nameLabel] mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.avatar.mas_bottom).offset(20.0);
        make.left.equalTo(self.mas_left).offset(15.0);
        make.right.equalTo(self.mas_right).offset(-15.0);
    }];
}

@end
