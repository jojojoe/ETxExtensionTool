//
//  TExViewConvenience.swift
//  ETxExtensionTool
//
//  Created by xxxx on 2023/x/xx.
//

import UIKit
import SnapKit

extension LYViewConvenience where Self: UIView {
     
    ///添加到父视图
    @discardableResult public
    func addToSuperView(_ superV:UIView) -> Self {
        
        superV.addSubview(self)
        
        return self
    }
    
    ///加约束
    @discardableResult public
    func layout(_ superV:UIView, snapMaker: (ConstraintMaker) ->Void) -> Self {
        
        superV.addSubview(self)
        self.snp.makeConstraints { (make) in
            snapMaker(make)
        }
        return self
    }
    
    ///设置背景颜色
    @discardableResult public
    func tag(_ tag:Int) -> Self{
        self.tag = tag
        return self
    }
    
    
    @discardableResult public
    func clipsToBounds(_ clip:Bool = true) -> Self{
        self.clipsToBounds = clip
        return self
    }
    ///设置背景颜色
    @discardableResult public
    func backgroundColor(_ color:UIColor) -> Self{
        self.backgroundColor = color
        return self
    }
    
    ///设置边框
    @discardableResult public
    func layerBorder(_ bWidth:CGFloat = 1,
                     _ bColor:UIColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)) ->Self{
    
        layer.borderColor = bColor.cgColor
        layer.borderWidth = bWidth
        
        return self
    }
    
    ///设置圆角
    @discardableResult public
    func layerRadius(_ radius:CGFloat = 5,
                     _ isMasks:Bool = false) -> Self{
        
        layer.cornerRadius = radius
        layer.masksToBounds = isMasks
        return self
    }
    
    ///设置填充模式
    @discardableResult public
    func contentMode(_ mode:UIView.ContentMode) -> Self{
        contentMode = mode
        return self
    }
    
    ///是否能点击
    @discardableResult public
    func userEnabled(_ isEnable:Bool = false) -> Self{
        isUserInteractionEnabled = isEnable
        return self
    }
    
    ///是否隐藏
    @discardableResult public
    func hidden(_ isHid:Bool = true) -> Self {
        isHidden = isHid
        return self
    }
    
    ///添加点击事件
    @discardableResult public
    func addTarget(target: Any?, action: Selector?)-> Self{
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        return self
    }
}

extension UIView {
    //MARK: - VIEW属性
   
    public var ly_left:CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    public var ly_top:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    public var ly_width:CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    
    public var ly_height:CGFloat {
        get {
            return self.frame.size.height
        }

        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
    public var ly_right:CGFloat {
        get {
            return self.ly_left + self.ly_width
        }
    }
    
    public var ly_bottom:CGFloat {
        get {
            return self.ly_top + self.ly_height
        }
    }
    
    public var ly_centerX:CGFloat {
        get {
            return self.center.x
        }
        
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    
    public var ly_centerY:CGFloat {
        get {
            return self.center.y
        }
        
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
    
}


public struct LYViewConvenienceFunc {
    
    private let view: UIView
    
    internal init(_ view: UIView) {
        self.view = view
    }
    
    //MARK: - 取得视图转化后的图片(截图)
    ///获取View图片(截图)
    public func getImage() -> UIImage{
        
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, UIScreen.main.scale)
        
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    
    //MARK: - 取得视图所在的控制器
    ///取得视图所在的控制器
    public func viewController()->UIViewController? {
        
        var nextResponder: UIResponder? = view
        
        repeat {
            nextResponder = nextResponder?.next
            
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            
        } while nextResponder != nil
        
        return nil
    }
    
    //MARK: - 设置视图layer
    ///设置阴影
    public func layerShadow(color:UIColor = .black,
                     offsetSize:CGSize = CGSize(width: 0, height: 0),
                     opacity:Float = 0.1,
                     radius:CGFloat = 5.0) {
        
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOffset = offsetSize
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = radius
    }
    

    ///设置部分圆角
    public func layerRoundingCorners(corners:UIRectCorner,radius:CGFloat)
        
    {
        
        let maskPath = UIBezierPath.init(roundedRect: view.bounds,
                                         
                                         byRoundingCorners: corners,
                                         
                                         cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.frame = view.bounds
        
        maskLayer.path = maskPath.cgPath
        
        view.layer.mask = maskLayer
        
    }
    
    ///边框位置
    public struct LYUIBorderSideType: OptionSet {
        public var rawValue: Int
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public static var all: LYUIBorderSideType = LYUIBorderSideType(rawValue: 0)
        public static var left: LYUIBorderSideType = LYUIBorderSideType(rawValue: 1 << 0)
        public static var right: LYUIBorderSideType = LYUIBorderSideType(rawValue: 1 << 1)
        public static var top: LYUIBorderSideType = LYUIBorderSideType(rawValue: 1 << 2)
        public static var bottom: LYUIBorderSideType = LYUIBorderSideType(rawValue: 1 << 3)
    }
    
    ///设置部分边框(注意：要先设置视图的frame)
    public func layerBorder(color: UIColor, width: CGFloat, type: LYUIBorderSideType){
        
        if type ==  .all {
            view.layer.borderColor = color.cgColor
            view.layer.borderWidth = width
            return
        }
        
        if type.contains(.left) {
            view.layer.addSublayer(self.addLine(originPoint: CGPoint.zero, toPoint: CGPoint(x: 0, y: view.frame.size.height), color: color, width: width))
        }
        
        if type.contains(.right) {
            view.layer.addSublayer(self.addLine(originPoint: CGPoint(x: view.frame.size.width, y: 0), toPoint: CGPoint(x: view.frame.size.width, y: view.frame.size.height), color: color, width: width))
        }
        
        if type.contains(.top) {
            view.layer.addSublayer(self.addLine(originPoint: CGPoint(x: 0, y: 0), toPoint: CGPoint(x: view.frame.size.width, y: 0), color: color, width: width))
        }
        
        if type.contains(.bottom) {
            view.layer.addSublayer(self.addLine(originPoint: CGPoint(x: 0, y: view.frame.size.height), toPoint: CGPoint(x: view.frame.size.width, y: view.frame.size.height), color: color, width: width))
        }
    }
    
    ///给layer添加线条
    private func addLine(originPoint: CGPoint, toPoint: CGPoint, color: UIColor, width: CGFloat) -> CAShapeLayer {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: originPoint)
        bezierPath.addLine(to: toPoint)
        
        let shapeLayer = CAShapeLayer()
        // 线宽度
        shapeLayer.lineWidth = width;
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        // 添加路径
        shapeLayer.path = bezierPath.cgPath
        return shapeLayer
    }
}


public protocol LYViewConvenience {}

extension UIView:LYViewConvenience{
    public var ly: LYViewConvenienceFunc { return LYViewConvenienceFunc(self) }
}

public protocol LYCollectionViewFlowLayoutConvenience {}

extension UICollectionViewFlowLayout:LYCollectionViewFlowLayoutConvenience{}

public protocol LYMutableAttributedStringConvenience {}

extension NSMutableAttributedString:LYMutableAttributedStringConvenience{}

public protocol LYImageConvenience {}

extension UIImage:LYImageConvenience{}

public protocol LYBundleConvenience {}

extension Bundle:LYBundleConvenience{}

extension String {
    public var ly: LYStringConvenienceFunc { return LYStringConvenienceFunc(self) }
}

extension Double {
    public var ly: LYDoubleConvenienceFunc { return LYDoubleConvenienceFunc(self) }
}

extension Date {
    public var ly: LYDateConvenienceFunc { return LYDateConvenienceFunc(self) }
}
 
