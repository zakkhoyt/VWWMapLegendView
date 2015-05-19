//
//  ViewController.m
//  VWWMapLegendViewDemo
//
//  Created by Zakk Hoyt on 5/18/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "ViewController.h"
@import MapKit;
#import "VWWMapLegendView.h"

@interface ViewController (VWWMapLegendView) <VWWMapLegendViewDelegate, VWWMapLegendViewDataSource>
@end
@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet VWWMapLegendView *mapLegendView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapLegendView.dataSource = self;
    self.mapLegendView.delegate = self;
}


- (IBAction)longPress:(UILongPressGestureRecognizer *)sender {
    [self.mapLegendView show];
}

@end

@implementation ViewController (VWWMapLegendView)

-(NSUInteger)numberOfItemsInLegendView{
    return 3;
}
-(NSDictionary*)legendView:(VWWMapLegendView*)legendView itemForItemAtIndex:(NSUInteger)index{
    switch (index) {
        case 0:
            return @{@"title": @"All",
                     @"image": [UIImage imageNamed:@"ball"]};
            break;
        case 1:
            return @{@"title": @"Orange",
                     @"image": [UIImage imageNamed:@"ball"]};
            break;
        case 2:
            return @{@"title": @"Purple",
                     @"image": [UIImage imageNamed:@"ball"]};
            break;
        default:
            return nil;
            break;
    }
}


@end