//
//  TExLabelSwifty.swift
//  ETxExtensionTool
//
//  Created by xxxx on 2023/x/xx.
//

import Foundation
import UIKit

extension LYViewConvenience where Self: UILabel {
    
    ///设置文字
    @discardableResult public
    func text(_ textString:String?) -> Self{
        text = textString
        return self
    }
    
    ///设置属性文本
    @discardableResult public
    func attributedText(_ attributedString:NSAttributedString?) -> Self {
        attributedText = attributedString
        return self
    }
    
    ///设置字体
    @discardableResult public
    func fontName(_ fontName: String, _ size:CGFloat) -> Self{
        font = UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
        return self
    }
    
    ///设置字体
    @discardableResult public
    func font(_ fontSize:CGFloat) -> Self{
        font = UIFont.systemFont(ofSize: fontSize)
        return self
    }
    
    ///设置粗字体
    @discardableResult public
    func boldFont(_ fontSize:CGFloat) -> Self{
        font = UIFont.boldSystemFont(ofSize: fontSize)
        return self
    }

    ///设置文字颜色
    @discardableResult public
    func textColor(_ color:UIColor) -> Self {
        textColor = color
        return self
    }
    
    ///设置行数
    @discardableResult public
    func numberOfLines(_ lines:Int) -> Self {
        numberOfLines = lines
        return self
    }
    
    ///设置文本对齐方式
    @discardableResult public
    func textAlignment(_ alignment:NSTextAlignment = .left) -> Self {
        textAlignment = alignment
        return self
    }
}
