//
//  TExColorSwifty.swift
//  ETxExtensionTool
//
//  Created by xxxx on 2023/x/xx.
//

import Foundation
import UIKit
extension UIColor {
   
    //颜色样式
    public enum LYColorStyle: Int {
        
        ///默认文字颜色#000000
        case defaulted = 0x000000
        ///用于标题文字 #1F1F1F
        case title = 0x1F1F1F
        ///用于普通级文字信息 #333333
        case content = 0x333333
        ///用于次级文字信息 #666666
        case secondary = 0x666666
        ///用于提示性文字，未编辑状态时的文字颜色 #999999
        case placeholder = 0x999999
        ///用于文字选中、可点击状态 #157EFB
        case click = 0x157EFB
        ///用于特别强调和突出文字 #FF2600
        case emphasize = 0xFF2600
        ///用于导航栏底部的分割线颜色，部分按钮描边色 #DADADA
        case navigationLine = 0xDADADA
        ///用于分割线颜色，以及框的描边，按钮点击色 #E5E5E5
        case partingLine = 0xE5E5E5
        ///用于内容区域的背景底色 #F5F5F5
        case backgroundView = 0xF5F5F5

    }
    
    ///16进制颜色，如：黑色  ly_rgb = 0x000000
    public convenience init(_ ly_rgb:Int,alpha:CGFloat=1) {
        self.init(red: (CGFloat((ly_rgb & 0xFF0000) >> 16))/255.0, green: (CGFloat((ly_rgb & 0xFF00) >> 8))/255.0, blue: (CGFloat(ly_rgb & 0xFF))/255.0, alpha: alpha);
    }
    ///设置颜色样式
    public convenience init(_ ly_Style:LYColorStyle,alpha:CGFloat=1) {
        self.init(ly_Style.rawValue,alpha:alpha)
    }
    
    ///随机颜色
    public class var ly_randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%255)/255.0
            let green = CGFloat(arc4random()%255)/255.0
            let blue = CGFloat(arc4random()%255)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }

    //渐变颜色的方向
    public enum LYGradientColorDirection {
        case topToBottom           //从上到小
        case letfToRight           //从左到右
        case leftTopToRightBottom  //左上到右下
        case rightTopToleftBottom  //右上到左下
    }
    
    /// 颜色的渐变图片，默认方向从左到右
    /// - parameter colors: 颜色的数组
    /// - parameter gradientDirection
    public class func ly_gradualImageFromColors(
        colors : [UIColor],
        gradientDirection:LYGradientColorDirection = .letfToRight,
        gradientSize:CGSize = CGSize(width: 300, height: 120)) -> UIImage? {
        
        let colorCGs = colors.map{$0.cgColor}
        UIGraphicsBeginImageContextWithOptions(gradientSize, true, 1)
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        let colorSpace =  CGColorSpaceCreateDeviceRGB()
        
        let gradient = CGGradient.init(colorsSpace: colorSpace, colors: colorCGs as CFArray , locations: nil)
        var start = CGPoint.zero
        var end = CGPoint.zero
        switch gradientDirection {
        case .topToBottom:
            start = CGPoint(x: 0.0, y: 0.0)
            end = CGPoint(x: 0.0, y: gradientSize.height)
        case .letfToRight:
            start = CGPoint(x: 0.0, y: 0.0)
            end = CGPoint(x: gradientSize.width, y: 0.0)
        case .leftTopToRightBottom:
            start = CGPoint(x: 0.0, y: 0.0)
            end = CGPoint(x: gradientSize.width, y: gradientSize.height)
        case .rightTopToleftBottom:
            start = CGPoint(x: gradientSize.width, y: 0.0)
            end = CGPoint(x: 0.0, y: gradientSize.height)
        }
        context?.drawLinearGradient(gradient!, start: start, end: end, options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        context?.restoreGState()
        UIGraphicsEndImageContext()
        
        return image
    }

    ///颜色转图片
    public func ly_image() -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
