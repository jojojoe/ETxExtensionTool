//
//  ETxDoubleSwifty.swift
//  ETxExtensionTool
//
//  Created by xxxx on 2023/x/xx.
//

import Foundation
import UIKit

public struct LYDoubleConvenienceFunc {

    private let double: Double
    
    internal init(_ double: Double) {
        self.double = double
    }
    
    ///把数字精确到小数点后第 position 位，不足 position 位补 0，然后四舍五入(注：position = -1 四舍五入后个位数为0)
    public func accuracyToString(position: Int) -> String {
        
        //四舍五入
        let roundingBehavior = NSDecimalNumberHandler(roundingMode: .plain, scale: Int16(position), raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        
        let ouncesDecimal: NSDecimalNumber = NSDecimalNumber(value: double)
        let roundedOunces: NSDecimalNumber = ouncesDecimal.rounding(accordingToBehavior: roundingBehavior)
        
        //生成需要精确的小数点格式，
        //比如精确到小数点第3位，格式为“0.000”；精确到小数点第4位，格式为“0.0000”；
        //也就是说精确到第几位，小数点后面就有几个“0”
        var formatterString : String = "0."
        if position > 0 {
            for _ in 0 ..< position {
                formatterString.append("0")
            }
        }else {
            formatterString = "0"
        }
        let formatter : NumberFormatter = NumberFormatter()
        //设置生成好的格式，NSNumberFormatter 对象会按精确度自动四舍五入
        formatter.positiveFormat = formatterString
        //然后把这个number 对象格式化成我们需要的格式，
        //最后以string 类型返回结果。
        var roundingStr = formatter.string(from: roundedOunces) ?? "0.00"
        
        if roundingStr.range(of: ".") != nil {
            
            let sub1 = String(roundingStr.suffix(1))
            if sub1 == "0" {
                roundingStr = String(roundingStr.prefix(roundingStr.count-1))
                let sub2 = String(roundingStr.suffix(1))
                if sub2 == "0" {
                    roundingStr = String(roundingStr.prefix(roundingStr.count-2))
                }
            }
        }
        
        return roundingStr
    }
    
    ///时间戳转年份函数
    public func timeStampToDate()->Date {
        let timeStamp:TimeInterval = double
        let date = Date(timeIntervalSince1970: timeStamp)
        return date
    }
}

