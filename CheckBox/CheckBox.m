//
//  CheckBox.m
//  CheckBox
//
//  Created by hdf on 15/6/17.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "CheckBox.h"
@interface CheckBox ()
{
    NSMutableArray *_buttonArray;
}
@end
@implementation CheckBox
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        _buttonArray = [[NSMutableArray alloc]init];
        self.textColor = [UIColor blackColor];
        self.textFont = [UIFont systemFontOfSize:16];
    }

    return self;
}

- (instancetype)initWithItemTitleArray:(NSArray *)titleArray columns:(NSUInteger)columnCount
{
    self = [self init];

    if (self) {
        _buttonArray = [[NSMutableArray alloc]init];
        self.textColor = [UIColor blackColor];
        self.textFont = [UIFont systemFontOfSize:16];
        [self setColumnCount:columnCount];
        [self setItemTitleWithArray:titleArray];
    }

    return self;
}

- (void)setItemTitleWithArray:(NSArray *)titleArray
{
    if (titleArray.count == 0) {
        return;
    }

    for (NSString *string in titleArray) {
        NSAssert([string isKindOfClass:[NSString class]], @"titleArray should only contain string");
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

        [button setTitle:[NSString stringWithFormat:@" %@", string] forState:UIControlStateNormal];
        [button setTitle:[NSString stringWithFormat:@" %@", string] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [_buttonArray addObject:button];
    }

    [self setTextFont:self.textFont];
    [self setTextColor:self.textColor];
    [self setItemSelected:YES index:0];
    [self refreshButtonFrame];
}

- (void)setItemSelected:(BOOL)isSelected index:(NSUInteger)index
{
    ((UIButton *)_buttonArray[index]).selected = isSelected;
}

- (BOOL)getItemSelectedAtIndex:(NSUInteger)index
{
    return ((UIButton *)_buttonArray[index]).selected;
}

- (NSArray *)getSelectedItemIndexs
{
    NSMutableArray *array = [[NSMutableArray alloc]init];

    for (UIButton *button in _buttonArray) {
        if (button.selected) {
            NSNumber *index = [NSNumber numberWithInteger:[_buttonArray indexOfObject:button]];
            [array addObject:index];
        }
    }

    return array;
}

#pragma mark - buttonclick
- (void)buttonClick:(UIButton *)button
{
    if (self.isMulti) {
        button.selected = !button.selected;
    } else {
        for (UIButton *button in _buttonArray) {
            [button setSelected:NO];
        }

        button.selected = YES;
    }
}

#pragma mark -
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self refreshButtonFrame];
}

- (void)setColumnCount:(NSUInteger)columnCount
{
    _columnCount = columnCount;
    [self refreshButtonFrame];
}

- (void)setNormalImage:(UIImage *)normalImage
{
    _normalImage = normalImage;

    for (UIButton *button in _buttonArray) {
        [button setImage:normalImage forState:UIControlStateNormal];
    }
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
    _selectedImage = selectedImage;

    for (UIButton *button in _buttonArray) {
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;

    for (UIButton *button in _buttonArray) {
        [button setTitleColor:textColor forState:UIControlStateNormal];
        [button setTitleColor:textColor forState:UIControlStateSelected];
    }
}

- (void)setTextFont:(UIFont *)textFont
{
    _textFont = textFont;

    for (UIButton *button in _buttonArray) {
        [button.titleLabel setFont:textFont];
    }
}

- (void)refreshButtonFrame
{
    if (_buttonArray.count == 0) {
        return;
    }

    NSUInteger columnCount;

    if (self.columnCount == 0) {
        columnCount = _buttonArray.count;
    } else {
        columnCount = self.columnCount;
    }

    float   width = self.frame.size.width / columnCount;
    float   height = self.frame.size.height / ceilf((float)_buttonArray.count / columnCount);

    for (UIButton *button in _buttonArray) {
        NSUInteger index = [_buttonArray indexOfObject:button];
        [button setFrame:CGRectMake((index % columnCount) * width, (index / columnCount) * height, width, height)];
    }
}

/*
 *   // Only override drawRect: if you perform custom drawing.
 *   // An empty implementation adversely affects performance during animation.
 *   - (void)drawRect:(CGRect)rect {
 *    // Drawing code
 *   }
 */

@end