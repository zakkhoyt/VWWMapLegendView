//
//  VWWMapLegendView.h
//  VWWMapLegendViewDemo
//
//  Created by Zakk Hoyt on 5/18/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VWWMapLegendView;

@protocol  VWWMapLegendViewDataSource <NSObject>
@required
-(NSUInteger)numberOfItemsInLegendView;

// dictonary can contain keys (all optional)
// "title"
// "image"
// "selected"

-(NSDictionary*)legendView:(VWWMapLegendView*)legendView itemForItemAtIndex:(NSUInteger)index;
@end

@protocol  VWWMapLegendViewDelegate <NSObject>
@optional
-(void)legendItemAtIndex:(NSUInteger)index selected:(BOOL)selected;
@end



@interface VWWMapLegendView : UIView

@property (nonatomic, weak) id <VWWMapLegendViewDataSource> dataSource;
@property (nonatomic, weak) id <VWWMapLegendViewDelegate> delegate;

-(void)show;


@end
