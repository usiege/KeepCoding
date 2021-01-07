//
//  CornerView.m
//  UITest
//
//  Created by charles on 2021/1/5.
//  Copyright © 2021 charles. All rights reserved.
//

#import "CornerView.h"
#define PI 3.141592653589798

@implementation CornerView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 1.获取上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    /**********2.设置画图相关样式参数*********/
    
    // 设置笔触的颜色
    CGContextSetStrokeColorWithColor(contextRef, [UIColor blueColor].CGColor); // 设置颜色有很多方法,推荐这个
    
    // 设置笔触的宽度
    CGContextSetLineWidth(contextRef, 2);
    
    // 设置填充色
    CGContextSetFillColorWithColor(contextRef, [UIColor purpleColor].CGColor);
    
    // 设置拐点样式
    /**
     *  enum CGLineJoin {
     *      kCGLineJoinMiter, //尖的，斜接
     *      kCGLineJoinRound, //圆
     *      kCGLineJoinBevel //斜面
     *  }
     */
    CGContextSetLineJoin(contextRef, kCGLineJoinRound);
    
    // 设置线两端的样式
    /**
     *  enum CGLineCap {
     *      kCGLineCapButt,
     *      kCGLineCapRound,
     *      kCGLineCapSquare
     *  };
     */
    CGContextSetLineCap(contextRef, kCGLineCapRound);
    
    // 设置虚线线条的样式
//    CGFloat lengths[] = {10, 10};
//    CGContextSetLineDash(contextRef, 0, lengths, 2);
    
    /**********设置画图相关样式参数*********/
    /**********3.开始画图*********/
    
    
    // 画线
//    [self drawline:contextRef];

    // 画圆,圆弧,贝塞尔曲线
//    [self drawCircle:contextRef];

    // 画矩形,画椭圆,多边形
    [self drawShape:contextRef];

    // 画文字
//    [self drawText:contextRef];

    // 画图片
//    [self drawPicture:contextRef];
    
    /**********结束画图*********/
    [self drawCorner];
}

- (void)drawCorner {
    /*画圆角矩形*/
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx,0,1,0,1);//设置线的颜色
    CGContextSetRGBFillColor(ctx,1,0.5,1,1);//设置填充颜色

    CGFloat width = 1;
    CGFloat height = 40;
    CGFloat radius = 20;
    
    CGContextSetLineWidth(ctx, width);//设置线的宽度
    CGContextRef context = UIGraphicsGetCurrentContext();
    width = width/2;
    CGContextMoveToPoint(context, 100, 200);  // 开始坐标右边开始
    CGContextAddLineToPoint(context, 100, 200+40);
    CGContextAddLineToPoint(context, 100-30, 200+40);
    CGContextAddArc(context, 100-30, 200+20, 20, M_PI/2*3.0, M_PI / 2.0, 1);
    CGContextAddLineToPoint(context, 100-30, 200);
    
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
}



- (void)drawCircle:(CGContextRef)contextRef
{
    // 画笔改成紫色,便于区别
    CGContextSetStrokeColorWithColor(contextRef, [UIColor greenColor].CGColor);
    
    /** 绘制路径 方法一
     *  void CGContextAddArc (
     *      CGContextRef c,
     *      CGFloat x,             //圆心的x坐标
     *      CGFloat y,    //圆心的x坐标
     *      CGFloat radius,   //圆的半径
     *      CGFloat startAngle,    //开始弧度
     *      CGFloat endAngle,   //结束弧度
     *      int clockwise          //0表示顺时针，1表示逆时针
     *  );
     */
    
    // 圆
    CGContextAddArc(contextRef, 100, 100, 50, 0, M_PI*2, 0);
    CGContextStrokePath(contextRef);
    
    // 半圆
    CGContextAddArc(contextRef, 100, 200, 50, M_PI, M_PI*2, 0);
    CGContextStrokePath(contextRef);
    
    /**
     *  绘制路径 方法二,这个方法适合绘制弧度,端点p1和p2是弧线的控制点,类似photoshop中的钢笔工具控制曲线,还不明白请去了解贝塞尔曲线
     *  void CGContextAddArcToPoint(
     *      CGContextRef c,
     *      CGFloat x1,  //端点1的x坐标
     *      CGFloat y1,  //端点1的y坐标
     *      CGFloat x2,  //端点2的x坐标
     *      CGFloat y2,  //端点2的y坐标
     *      CGFloat radius //半径
     *  )
     */
    
    
    // 1/4 弧度*4 划出一个圆形
    CGContextMoveToPoint(contextRef, 100, 100);
    CGContextAddArcToPoint(contextRef, 100, 50, 150, 50, 50);
    CGContextAddArcToPoint(contextRef, 200, 50, 200, 100, 50);
    CGContextAddArcToPoint(contextRef, 200, 150, 150, 150, 50);
    CGContextAddArcToPoint(contextRef, 100, 150, 100, 100, 50);
    CGContextStrokePath(contextRef);
    
    
    // 贝塞尔曲线
    CGContextSetStrokeColorWithColor(contextRef, [UIColor orangeColor].CGColor); // 画笔颜色
    /** 三次曲线函数
     *  void CGContextAddCurveToPoint (
     *      CGContextRef c,
     *      CGFloat cp1x, //控制点1 x坐标
     *      CGFloat cp1y, //控制点1 y坐标
     *      CGFloat cp2x, //控制点2 x坐标
     *      CGFloat cp2y, //控制点2 y坐标
     *      CGFloat x,  //直线的终点 x坐标
     *      CGFloat y  //直线的终点 y坐标
     *  );
     */
    
    CGContextMoveToPoint(contextRef, 100, 300);
    CGContextAddCurveToPoint(contextRef, 100, 300, 200, 0, 200, 300);
    CGContextStrokePath(contextRef);
    
    //三次曲线可以画圆弧
    CGContextMoveToPoint(contextRef, 200, 200);
    CGContextAddCurveToPoint(contextRef, 200, 100, 300, 100, 300 ,100);
    CGContextStrokePath(contextRef);
    
    /** 二次曲线
     *  void CGContextAddQuadCurveToPoint (
     *  CGContextRef c,
     *  CGFloat cpx,  //控制点 x坐标
     *  CGFloat cpy,  //控制点 y坐标
     *  CGFloat x,  //直线的终点 x坐标
     *  CGFloat y  //直线的终点 y坐标
     *  );
     */
    
    CGContextMoveToPoint(contextRef, 100, 100);
    CGContextAddQuadCurveToPoint(contextRef, 200, 0, 300, 150);
    CGContextStrokePath(contextRef);
}

- (void)drawline:(CGContextRef)contextRef
{
    // 画一条简单的线
    CGPoint points1[] = {CGPointMake(10, 30), CGPointMake(300, 30)};
    CGContextAddLines(contextRef, points1, 2);
    
    
    // 画线方法1, 使用CGContextAddLineToPoint添加点画线,需要先设置一个起始点
    // 设置起始点
    CGContextMoveToPoint(contextRef, 50, 50);
    // 添加一个点
    CGContextAddLineToPoint(contextRef, 100, 50);
    // 在添加一个点,变成折现
    CGContextAddLineToPoint(contextRef, 150, 100);
    // 在添加一个点,再折一下
    CGContextAddLineToPoint(contextRef, 280, 100);
    
    
    // 画线方法2
    // 构造线路的点数组
    CGPoint points2[] = {CGPointMake(50, 120), CGPointMake(100, 150), CGPointMake(150, 120), CGPointMake(200, 150), CGPointMake(250, 120)};
    CGContextAddLines(contextRef, points2, 5); // 最后一个参数为要绘制点的个数
    
    
    // 画线方法3
    // 利用路径去画一组点(推荐使用路径的方式,虽然多了几行代码,带上逻辑更加清晰了)
    // 路径1
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGPathMoveToPoint(path1, &CGAffineTransformIdentity, 30, 180); // 起始点, CGAffineTransformIdentity 类似于初始化一些参数
    CGPathAddLineToPoint(path1, &CGAffineTransformIdentity, 30, 220); // 添加一个点
    CGPathAddLineToPoint(path1, &CGAffineTransformIdentity, 80, 220); // 添加一个点
    // 将路径1加入contextRef
    CGContextAddPath(contextRef, path1);
    // path同样有方法CGPathAddLines()添加一组路径,和CGContextAddLines()差不多
    
    /******** 上面的方法都要写下面这两句代码 ********/
    // 描出笔触
    CGContextStrokePath(contextRef);
    // 填充
    CGContextFillPath(contextRef);
}

- (void)drawShape:(CGContextRef)contextRef
{
//    CGContextSetFillColorWithColor(contextRef, [UIColor blackColor].CGColor);
//
//    // 画椭圆,如果长宽相等就是圆
//    CGContextAddEllipseInRect(contextRef, CGRectMake(50, 250, 50, 100));
//
//    // 画矩形,长宽相等就是正方形
//    CGContextAddRect(contextRef, CGRectMake(150, 250, 50, 100));
//
//    // 画多边形,多边形是通过path完成的
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, &CGAffineTransformIdentity, 50, 350);
//    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 100, 350);
//    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 80, 400);
//    CGPathCloseSubpath(path);
//    CGContextAddPath(contextRef, path);
//
//    // 填充
//    CGContextFillPath(contextRef);
    
    /*画圆角矩形*/
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx,1,0,0,1);//设置线的颜色
    CGContextSetRGBFillColor(ctx,0,0,1,1);//设置填充颜色
    
    CGFloat width = 20;
    CGContextSetLineWidth(ctx, width);//设置线的宽度

    float fw = self.bounds.size.width;
    float fh = self.bounds.size.height;
    CGContextRef context = UIGraphicsGetCurrentContext();
    width = width/2;
    CGContextMoveToPoint(context, fw-width, fh-width*5);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, fw-width, fh-width, fw-width*2, fh-width, width*2);     // 右下角角度
    CGContextAddArcToPoint(context, width, fh-width, width, fh-width*2, width*2);       // 左下角角度
    CGContextAddArcToPoint(context, width, width, fw-width*2, width, width*2);        // 左上角
    CGContextAddArcToPoint(context, fw-width, width, fw-width, fh-width*2, width*2);    // 右上角
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
}

- (void)drawText:(CGContextRef)contextRef
{
    // 文字样式
    UIFont *font = [UIFont systemFontOfSize:18];
    NSDictionary *dict = @{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor colorWithRed:0.167 green:0.752 blue:1.000 alpha:1.000]};
    [@"荣耀归来" drawInRect:CGRectMake(100, 450, 100, 50) withAttributes:dict];
}

// 画图片
- (void)drawPicture:(CGContextRef)contextRef
{
    UIImage *image = [UIImage imageNamed:@"17.png"];
    [image drawInRect:CGRectMake(100, 500, 100, 150)]; // 在坐标系中画出图片
}


- (void)drawRect {
    //An opaque type that represents a Quartz 2D drawing environment.
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();

    /*写文字*/
    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色
    UIFont  *font = [UIFont boldSystemFontOfSize:15.0];//设置
    NSDictionary* dic = @{ NSFontAttributeName: font};
    [@"测试" drawInRect:CGRectMake(10, 20, 80, 20) withAttributes:dic];
    
//    /*画圆角矩形*/
//    float fw = 180;
//    float fh = 280;
//
//    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右边开始
//    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10);  // 右下角角度
//    CGContextAddArcToPoint(context, 120, fh, 120, fh-20, 10); // 左下角角度
//    CGContextAddArcToPoint(context, 120, 250, fw-20, 250, 10); // 左上角
//    CGContextAddArcToPoint(context, fw, 250, fw, fh-20, 10); // 右上角
//    CGContextClosePath(context);
//    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    
    /*画圆*/
    //边框圆
    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    CGContextAddArc(context, 100, 20, 15, 0, 2*PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathStroke); //绘制路径

    //填充圆，无边框
    CGContextAddArc(context, 150, 30, 30, 0, 2*PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathFill);//绘制填充

    //画大圆并填充颜
    UIColor*aColor = [UIColor colorWithRed:1 green:0.0 blue:0 alpha:1];
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    CGContextSetLineWidth(context, 3.0);//线的宽度
    CGContextAddArc(context, 250, 40, 40, 0, 2*PI, 0); //添加一个圆
    //kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充

    /*画线及孤线*/
    //画线
    CGPoint aPoints[2];//坐标点
    aPoints[0] =CGPointMake(100, 80);//坐标1
    aPoints[1] =CGPointMake(130, 80);//坐标2
    //CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
    //points[]坐标数组，和count大小
    CGContextAddLines(context, aPoints, 2);//添加线
    CGContextDrawPath(context, kCGPathStroke); //根据坐标绘制路径

    //画笑脸弧线
    //左
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);//改变画笔颜色
    CGContextMoveToPoint(context, 140, 80);//开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
    CGContextAddArcToPoint(context, 148, 68, 156, 80, 10);
    CGContextStrokePath(context);//绘画路径

    //右
    CGContextMoveToPoint(context, 160, 80);//开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
    CGContextAddArcToPoint(context, 168, 68, 176, 80, 10);
    CGContextStrokePath(context);//绘画路径

    //右
    CGContextMoveToPoint(context, 150, 90);//开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
    CGContextAddArcToPoint(context, 158, 102, 166, 90, 10);
    CGContextStrokePath(context);//绘画路径
    //注，如果还是没弄明白怎么回事，请参考：http://donbe.blog.163.com/blog/static/138048021201052093633776/

    /*画矩形*/
    CGContextStrokeRect(context,CGRectMake(100, 120, 10, 10));//画方框
    CGContextFillRect(context,CGRectMake(120, 120, 10, 10));//填充框
    //矩形，并填弃颜色
    CGContextSetLineWidth(context, 2.0);//线的宽度
    aColor = [UIColor blueColor];//blue蓝色
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    aColor = [UIColor yellowColor];
    CGContextSetStrokeColorWithColor(context, aColor.CGColor);//线框颜色
    CGContextAddRect(context,CGRectMake(140, 120, 60, 30));//画方框
    CGContextDrawPath(context, kCGPathFillStroke);//绘画路径

    //矩形，并填弃渐变颜色
    //关于颜色参考http://blog.sina.com.cn/s/blog_6ec3c9ce01015v3c.html
    //http://blog.csdn.net/reylen/article/details/8622932
    //第一种填充方式，第一种方式必须导入类库quartcore并#import <QuartzCore/QuartzCore.h>，这个就不属于在context上画，而是将层插入到view层上面。那么这里就设计到Quartz Core 图层编程了。
    CAGradientLayer *gradient1 = [CAGradientLayer layer];
    gradient1.frame = CGRectMake(240, 120, 60, 30);
    gradient1.colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor,
                        (id)[UIColor grayColor].CGColor,
                        (id)[UIColor blackColor].CGColor,
                        (id)[UIColor yellowColor].CGColor,
                        (id)[UIColor blueColor].CGColor,
                        (id)[UIColor redColor].CGColor,
                        (id)[UIColor greenColor].CGColor,
                        (id)[UIColor orangeColor].CGColor,
                        (id)[UIColor brownColor].CGColor,nil];
    [self.layer insertSublayer:gradient1 atIndex:0];
    //第二种填充方式
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        1,1,1, 1.00,
        1,1,0, 1.00,
        1,0,0, 1.00,
        1,0,1, 1.00,
        0,1,1, 1.00,
        0,1,0, 1.00,
        0,0,1, 1.00,
        0,0,0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
    CGColorSpaceRelease(rgb);
    //画线形成一个矩形
    //CGContextSaveGState与CGContextRestoreGState的作用
    /*
     CGContextSaveGState函数的作用是将当前图形状态推入堆栈。之后，您对图形状态所做的修改会影响随后的描画操作，但不影响存储在堆栈中的拷贝。在修改完成后，您可以通过CGContextRestoreGState函数把堆栈顶部的状态弹出，返回到之前的图形状态。这种推入和弹出的方式是回到之前图形状态的快速方法，避免逐个撤消所有的状态修改；这也是将某些状态（比如裁剪路径）恢复到原有设置的唯一方式。
     */
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 220, 90);
    CGContextAddLineToPoint(context, 240, 90);
    CGContextAddLineToPoint(context, 240, 110);
    CGContextAddLineToPoint(context, 220, 110);
    CGContextClip(context);//context裁剪路径,后续操作的路径
    //CGContextDrawLinearGradient(CGContextRef context,CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint,CGGradientDrawingOptions options)
    //gradient渐变颜色,startPoint开始渐变的起始位置,endPoint结束坐标,options开始坐标之前or开始之后开始渐变
    CGContextDrawLinearGradient(context, gradient,CGPointMake
                                (220,90) ,CGPointMake(240,110),
                                kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);// 恢复到之前的context

    //再写一个看看效果
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 260, 90);
    CGContextAddLineToPoint(context, 280, 90);
    CGContextAddLineToPoint(context, 280, 100);
    CGContextAddLineToPoint(context, 260, 100);
    CGContextClip(context);//裁剪路径
    //说白了，开始坐标和结束坐标是控制渐变的方向和形状
    CGContextDrawLinearGradient(context, gradient,CGPointMake
                                (260, 90) ,CGPointMake(260, 100),
                                kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);// 恢复到之前的context

    //下面再看一个颜色渐变的圆
    CGContextDrawRadialGradient(context, gradient, CGPointMake(300, 100), 0.0, CGPointMake(300, 100), 10, kCGGradientDrawsBeforeStartLocation);

    /*画扇形和椭圆*/
    //画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
    aColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    //以10为半径围绕圆心画指定角度扇形
    CGContextMoveToPoint(context, 160, 180);
    CGContextAddArc(context, 160, 180, 30,  -60 * PI / 180, -120 * PI / 180, 1);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径

    //画椭圆
    CGContextAddEllipseInRect(context, CGRectMake(160, 180, 20, 8)); //椭圆
    CGContextDrawPath(context, kCGPathFillStroke);

    /*画三角形*/
    //只要三个点就行跟画一条线方式一样，把三点连接起来
    CGPoint sPoints[3];//坐标点
    sPoints[0] =CGPointMake(100, 220);//坐标1
    sPoints[1] =CGPointMake(130, 220);//坐标2
    sPoints[2] =CGPointMake(130, 160);//坐标3
    CGContextAddLines(context, sPoints, 3);//添加线
    CGContextClosePath(context);//封起来
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径

    /*画圆角矩形*/
    float fw = 180;
    float fh = 280;

    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10);  // 右下角角度
    CGContextAddArcToPoint(context, 120, fh, 120, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 120, 250, fw-20, 250, 10); // 左上角
    CGContextAddArcToPoint(context, fw, 250, fw, fh-20, 10); // 右上角
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径

    /*画贝塞尔曲线*/
    //二次曲线
    CGContextMoveToPoint(context, 120, 300);//设置Path的起点
    CGContextAddQuadCurveToPoint(context,190, 310, 120, 390);//设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextStrokePath(context);
    //三次曲线函数
    CGContextMoveToPoint(context, 200, 300);//设置Path的起点
    CGContextAddCurveToPoint(context,250, 280, 250, 400, 280, 300);//设置贝塞尔曲线的控制点坐标和控制点坐标终点坐标
    CGContextStrokePath(context);


    /*图片*/
    UIImage *image = [UIImage imageNamed:@"apple.jpg"];
    [image drawInRect:CGRectMake(60, 340, 20, 20)];//在坐标中画出图片
    //    [image drawAtPoint:CGPointMake(100, 340)];//保持图片大小在point点开始画图片，可以把注释去掉看看
    CGContextDrawImage(context, CGRectMake(100, 340, 20, 20), image.CGImage);//使用这个使图片上下颠倒了，参考http://blog.csdn.net/koupoo/article/details/8670024

}
@end
