//
//  ViewController.m
//  圆圈进度条的转动
//
//  Created by 王志盼 on 16/2/16.
//  Copyright © 2016年 王志盼. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupReplicatorLayerAndAnimation];
}

- (void)setupReplicatorLayerAndAnimation
{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = self.containView.layer.bounds;
    [self.containView.layer addSublayer:replicatorLayer];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(self.containView.frame.size.width * 0.5, 20, 16, 16);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.cornerRadius = layer.frame.size.width / 2;
    
    //这一句可以将初始过程移除掉
    layer.transform = CATransform3DMakeScale(0, 0, 0);
    
    [replicatorLayer addSublayer:layer];
    
    replicatorLayer.instanceCount = 22;
    
    CABasicAnimation *basicAn = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    basicAn.fromValue = @1;
    basicAn.toValue = @0;
    
    basicAn.duration = 1;
    
    basicAn.repeatCount = MAXFLOAT;
    
    [layer addAnimation:basicAn forKey:nil];
    
    replicatorLayer.instanceDelay = basicAn.duration / (double)replicatorLayer.instanceCount;
    
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(2 * M_PI / replicatorLayer.instanceCount, 0, 0, 1);
}

@end
