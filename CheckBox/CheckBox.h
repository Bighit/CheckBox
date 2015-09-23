//
//  CheckBox.h
//  CheckBox
//
//  Created by hdf on 15/6/17.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckBox : UIView
@property(nonatomic, assign) BOOL       isMulti;        // 是否是复选 默认NO
@property(nonatomic, strong) UIImage    *normalImage;   // 正常显示的图片
@property(nonatomic, strong) UIImage    *selectedImage; //选中时候的图片
@property(nonatomic, assign) NSUInteger columnCount;    // 列数 默认一行 即N列
@property(nonatomic, strong) UIColor    *textColor;     // 文字颜色 默认黑色
@property(nonatomic, strong) UIFont     *textFont;      // 字体 默认 16号系统

/**
 *  通过一个title数组和列数初始化控件，item个数是数组的长度
 *
 *  @param titleArray  该数组只能存放string
 *  @param columnCount 一行可以放几个item
 *
 *  @return self
 */
- (instancetype)initWithItemTitleArray:(NSArray *)titleArray columns:(NSUInteger)columnCount;

/**
 *  设置item的文字提示
 *
 *  @param titleArray 文字构成的数组 只能存放string
 */
- (void)setItemTitleWithArray:(NSArray *)titleArray;

/**
 *  通过下标 设置item的选中状态
 *
 *  @param isSelected YES or NO
 *  @param index      下标  0开始
 */
- (void)setItemSelected:(BOOL)isSelected index:(NSUInteger)index;

/**
 *  通过下标 得到item的选中状态
 *
 *  @param index 下标
 *
 *  @return YES or NO
 */
- (BOOL)getItemSelectedAtIndex:(NSUInteger)index;

/**
 *  返回一组下标，NSNumber类型 ，由选中的Item下标构成
 *
 *  @return 由下标构成的数组
 */
- (NSArray *)getSelectedItemIndexs;
@end