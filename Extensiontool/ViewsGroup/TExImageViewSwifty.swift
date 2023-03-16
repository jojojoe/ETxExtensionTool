//
//  TExImageViewSwifty.swift
//  ETxExtensionTool
//
//  Created by xxxx on 2023/x/xx.
//

import Foundation
import UIKit
import Kingfisher

extension LYViewConvenience where Self: UIImageView {
    
    ///设置图片
    @discardableResult public
    func image(_ img:UIImage?) -> Self {
        image = img
        return self
    }
    
    ///设置图片数组(gif)
    @discardableResult public
    func images(_ imgs:[UIImage],
                duration:TimeInterval = 1.0,
                repeatCount:Int = 0) -> Self {
        //设置动画数组图片
        animationImages = imgs
        //设置一个动画的时长
        animationDuration = duration
        //设置动画循环的次数（0是无线循环）
        animationRepeatCount = repeatCount
        //开始动画
        startAnimating()
        return self
    }
    
     
    //MARK:UIImageView用Kingfisher加载网络图片
    //设置网络图片
    public func ly_setKfImage(_ imageUrl:String?,
                       _ placeholderImageName:String = "") {

        var imageURL : URL?
        var placeholderImage : UIImage?

        if let url = imageUrl,let imgUrl = URL(string: url) {
           imageURL = imgUrl
        }

        placeholderImage = UIImage(named: placeholderImageName)


        if let URL = imageURL {
            self.kf.setImage(with: ImageResource(downloadURL: URL), placeholder: placeholderImage)
        }else {
            self.image = placeholderImage
        }

    }

    ///设置网络图片(无默认图片,需自己设置UIImage)
    public func ly_setKfImage(_ imageUrl:String?,
                        placeholder image:UIImage?) {

        if let url = imageUrl,let imgUrl = URL(string: url) {
            self.kf.setImage(with: ImageResource(downloadURL: imgUrl), placeholder: image)

        }else {
            self.image = image
        }

    }
    
}
