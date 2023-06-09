//
//  TExImageSwifty.swift
//  ETxExtensionTool
//
//  Created by xxxx on 2023/x/xx.
//

import Foundation
import UIKit

extension LYImageConvenience where Self: UIImage {
    
    ///图片设置圆角
    public func ly_cornerImage(_ cornerRadii: CGSize,byRoundingCorners: UIRectCorner = UIRectCorner.allCorners) -> UIImage? {
        
        let imageRect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        guard context != nil else {
            return nil
        }
        context?.setShouldAntialias(true)
        let bezierPath = UIBezierPath(roundedRect: imageRect,
                                      byRoundingCorners: byRoundingCorners,
                                      cornerRadii: cornerRadii)
        bezierPath.close()
        bezierPath.addClip()
        self.draw(in: imageRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    /**
     *  压缩上传图片到指定kb
     *  maxLength 压缩后最大多少kb
     *  return 压缩后图片的二进制
     */
    public func ly_compressImage(_ maxLength: Int = 100) -> Data? {
       
        var compress:CGFloat = 0.9
        
        var data = self.jpegData(compressionQuality: compress)
        while data?.count ?? 0 > maxLength*1024 && compress > 0.01 {
            compress -= 0.02
            data = self.jpegData(compressionQuality: compress)
        }
        
        return data
    }
    
    /**
    *  压缩上传图片到指定size
    *  changedSize 压缩后size
    *  注：size中width或height为0时，会按图片比例计算长高
    *  return 压缩后图片的二进制
    */
    public func ly_resizeImage(changedSize: CGSize = CGSize(width: 375, height: 0)) -> UIImage{
        
        //prepare constants
        let width = self.size.width
        let height = self.size.height
        let scale = width/height
        
        var sizeChange = CGSize()
        
        var changedWidth:CGFloat = changedSize.width
        var changedheight:CGFloat = changedSize.height
        
        if changedWidth == 0 && changedheight == 0{
            return self
        }else if changedWidth > 0 && changedheight > 0 {
            if width <= changedWidth && height <= changedheight{
                return self
            }else {
                sizeChange = changedSize
            }
        }else if changedWidth > 0 && changedheight == 0 {
            if width < changedWidth {
                return self
            }else {
                changedheight = changedWidth / scale
                sizeChange = CGSize(width: changedWidth, height:changedheight)
            }
        }else if changedWidth == 0 && changedheight > 0 {
            if height < changedheight {
                return self
            }else {
                changedWidth = changedheight * scale
                sizeChange = CGSize(width: changedWidth, height:changedheight)
            }
        }
        
        UIGraphicsBeginImageContext(sizeChange)
        
        //draw resized image on Context
        self.draw(in: CGRect(x: 0, y: 0, width: sizeChange.width, height: sizeChange.height))
        
        //create UIImage
        let resizedImg = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return resizedImg!
    }
    
    ///图片转颜色
    public func ly_color() -> UIColor {
        
        return UIColor(patternImage: self)
    }
}
