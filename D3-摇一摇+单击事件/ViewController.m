//
//  ViewController.m
//  D3-摇一摇+单击事件
//
//  Created by 周述坚 on 16/9/26.
//  Copyright © 2016年 周述坚. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation ViewController


/**
 分析摇一摇的业务逻辑 (附近)
 1. 定位用户的位置 (CoreLocation)
 2. 开始摇一摇 (Motion事件)
 * 将用户的位置上传到服务器 (网络请求)
 * 服务端会做一些事情
 * 收集同一时间内都在摇一摇的用户的位置
 * 计算离你最近的N个人
 * 将这N个人的数据返回给应用
 3. 包含附近的人的信息  (网络请求的响应结果)
 * 将这些信息展示出来 (TalbeView展示)
 * 选择某个人, 开始聊天! (......)
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"开始摇一摇");


}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"摇一摇被取消");

}

//  ====================================



/** 集合类型 (保存一系列的多个对象)
 NSArray, 数组,
 * 有序的, 可以重复的, 依据下标来查找对象, 保存的是同一种类型的对象
 NSDictionary, 字典
 * 无序的, value是可以重复的, 依据Key来获取对象(不能重复), 保存的多种类型的对象
 NSSet, 集合,
 * 无序的, 不可以重复的, 保存的是同一种类型的对象, 随便找一个 (大白兔糖)
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //任意一个点击
    UITouch *touch = [touches anyObject];
    
    //获取点击位置
    CGPoint point = [touch locationInView:self.view];
    
    //打印位置
    NSLog(@"%@",NSStringFromCGPoint(point));
    


}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1 获取当前的触摸点
    UITouch *touch = [touches anyObject];
    //2  获取该点在self.view 上的位置
    CGPoint point = [touch locationInView:self.view];
    
    //计算偏移量,来调整blueView的位置
    CGPoint prePoint = [touch previousLocationInView:self.view];
    
    CGFloat xdetail = point.x - prePoint.x;
    
    CGFloat ydetail = point.y - prePoint.y;
    
    self.blueView.center = CGPointMake(self.blueView.center.x + xdetail, self.blueView.center.y + ydetail);


}
//离开屏幕
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    


}

//触摸取消,如来电

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


}





@end
