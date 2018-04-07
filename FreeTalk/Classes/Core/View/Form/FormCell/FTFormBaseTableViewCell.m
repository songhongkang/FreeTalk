//
//  FTFormBaseTableViewCell.m
//  FreeTalk
//
//  Created by wsong on 2018/4/4.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTFormBaseTableViewCell.h"
#import "FTFormTableView.h"

@interface FTFormBaseTableViewCell ()

@end

@implementation FTFormBaseTableViewCell

// 默认从xib中加载
+ (instancetype)cell {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self)
                                         owner:nil
                                       options:nil].lastObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setOnClick:(void (^)(void))onClick {
    _onClick = onClick;
    
    self.selectionStyle = onClick? UITableViewCellSelectionStyleDefault : UITableViewCellSelectionStyleNone;
}

@end
