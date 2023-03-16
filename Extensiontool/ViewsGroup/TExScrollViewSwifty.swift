//
//  TExScrollViewSwifty.swift
//  ETxExtensionTool
//
//  Created by xxxx on 2023/x/xx.
//

import Foundation
import UIKit

extension LYViewConvenience where Self: UIScrollView {
    
    ///delegate
    @discardableResult public
    func delegate(_ target: Any?) -> Self{
        delegate = target as? UIScrollViewDelegate
        return self
    }
    
    ///滑动到顶部或底部是否有弹性效果
    @discardableResult public
    func bounces(_ isBounce:Bool = false) -> Self{
        bounces = isBounce
        return self
    }
    
    ///是否可以滑动
    @discardableResult public
    func scrollEnabled(_ isScroll:Bool = false) -> Self{
        isScrollEnabled = isScroll
        return self
    }
    
    ///是否分页滑动
    @discardableResult public
    func pagingEnabled(_ isPage:Bool = true) -> Self{
        isPagingEnabled = isPage
        return self
    }
    
    ///是否展示水平滚动条
    @discardableResult public
    func showsHorizontalScrollIndicator(_ isShow:Bool = false) -> Self{
        showsHorizontalScrollIndicator = isShow
        return self
    }
    
    ///是否展示垂直滚动条
    @discardableResult public
    func showsVerticalScrollIndicator(_ isShow:Bool = false) -> Self{
        showsVerticalScrollIndicator = isShow
        return self
    }
}
