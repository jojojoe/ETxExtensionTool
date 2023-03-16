//
//  TExTextViewSwifty.swift
//  ETxExtensionTool
//
//  Created by xxxx on 2023/x/xx.
//

import Foundation
import UIKit

extension LYViewConvenience where Self: UITextView {
   
    ///设置提示文字(注意)
    @discardableResult public
    func placeholder(_ placeholder:String?,_ placeholderColor:UIColor=UIColor(.placeholder)) -> Self{

        var placeholderLabel = self.viewWithTag(9999) as? UILabel
        if placeholderLabel == nil {
            let label = UILabel().tag(9999)
            self.addSubview(label)
            self.setValue(label, forKey: "_placeholderLabel")
            placeholderLabel = label
        }
        placeholderLabel?
            .text(placeholder)
            .textColor(placeholderColor)
        placeholderLabel?.font = font
        
        return self
    }
    
    ///设置文字
    @discardableResult public
    func text(_ textString:String?) -> Self{
        text = textString
        return self
    }
    
    ///delegate
    @discardableResult public
    func delegate(_ target: Any?) -> Self{
        delegate = target as? UITextViewDelegate
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
    
    ///设置键盘样式
    @discardableResult public
    func keyboardType(_ keyboardType:UIKeyboardType) -> Self {
        self.keyboardType = keyboardType
        return self
    }
    
    ///是否可以编辑
    @discardableResult public
    func editable(_ isEdit:Bool = false) -> Self {
        isEditable = isEdit
        return self
    }
    
    //是否可以滑动
    @discardableResult public
    func scrollEnabled(_ isScorll:Bool = false) -> Self {
        isScrollEnabled = isScorll
        return self
    }
}
