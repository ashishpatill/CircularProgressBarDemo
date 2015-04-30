//
//  ViewController.m
//  CircularProgressBarDemo
//
//  Created by Ashish Pisey on 17/04/15.
//  Copyright (c) 2015 Ashish Pisey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIColor *strokeColor;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self setProgressView];
    
    strokeColor = UIColorFromRGB(0x00BCD4);
    [self drawRect:self.view.frame];
}

- (void)drawRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];//WithOvalInRect:CGRectMake(50, 100, 200, 200)];
    
    CGFloat startAngle = 2 * M_PI/3 ;
    
    CGFloat endAngle = M_PI/3;
    
    [bezierPath addArcWithCenter:CGPointMake(self.view.center.x,self.view.center.y) radius:90 startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    CAShapeLayer *progressLayer = [[CAShapeLayer alloc] init];
    [progressLayer setPath:bezierPath.CGPath];
    [progressLayer setFillColor:[UIColor clearColor].CGColor];
//    [progressLayer setBorderColor:[UIColor redColor].CGColor];
    [progressLayer setStrokeColor:strokeColor.CGColor];
    [progressLayer setLineWidth:50.0];
    [progressLayer setStrokeStart:0.0];
    [progressLayer setStrokeEnd:1.0];

    [self.view.layer addSublayer:progressLayer];
    
    [self animateProgressLayer:progressLayer];
    
   // [self add3DTransformToLayer:progressLayer];
    
    UIGraphicsEndImageContext();
    
    
}


-(void)animateProgressLayer:(CAShapeLayer *)layer
{
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
    colorAnim.fromValue         = (id) [UIColor redColor].CGColor;
    colorAnim.toValue           = (id) strokeColor.CGColor;
    colorAnim.duration          = 3.0;
    colorAnim.repeatCount       = 0;
    colorAnim.autoreverses      = NO;
    [layer addAnimation:colorAnim forKey:@"animateStrokeColor"];
    
    CABasicAnimation *strokeAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnim.fromValue         = (id) [NSNumber numberWithFloat:0.0];
    strokeAnim.toValue           = (id) [NSNumber numberWithFloat:1.0];
    strokeAnim.duration          = 3.0;
    strokeAnim.repeatCount       = 0;
    strokeAnim.autoreverses      = NO;
    [layer addAnimation:strokeAnim forKey:@"animateStrokeEnd"];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setDuration:3.0];
    [group setAnimations:[NSArray arrayWithObjects:colorAnim, strokeAnim, nil]];
    
    [layer addAnimation:group forKey:nil];
    
}

// 3D Transform

-(void)add3DTransformToLayer:(CAShapeLayer *)progressLayer
{
    
    //  In this case the custom eyePosition variable specifies the relative distance along the z axis from which to view the layers. Usually you specify a positive value for eyePosition to keep the layers oriented in the expected way. Larger values result in a flatter scene while smaller values cause more dramatic visual differences between the layers
    
    CATransform3D perspective = CATransform3DIdentity;
//    CGFloat eyePosition = 10000000.0;
//    perspective.m34 = -1.0/eyePosition;
    
    // Apply the transform to a parent layer.
//    progressLayer.sublayerTransform = perspective;
    
     perspective = CATransform3DRotate(perspective, M_PI_4, 1.0f, 0.0f, 0.0f);
    
    //perspective = CATransform3DScale(CATransform3DMakeRotation(M_PI_2, 0, 0, 1),-1, 1, 1);
    
    [progressLayer setTransform: perspective];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
