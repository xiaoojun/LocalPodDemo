//
//  UIFont+Extension.swift
//  ApeUni
//
//  Created by 汤小军 on 2019/2/13.
//  Copyright © 2019 AU. All rights reserved.
//

import Foundation
import UIKit

public extension UIFont {
    enum FontWeightStyle {
        case Medium //中黑体
        case Semibold //中粗体
        case Light //细体
        case Regular //常规体
    }
    
    //MARK: 获取字体名称
     static   func getAllFonts() {
        print("打印字体名称 ***********************************************begin*****************")
        for fontFamilyName in UIFont.familyNames {
            print("\n字体族名称: \(fontFamilyName)")
            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName) {
                print("字体名称 : \(fontName)")
            }
        }
        print("打印字体名称 ***********************************************end*****************")
    }
    
   //MARK: 平方字体
    static  func pingFang(_ fontSize: CGFloat = 18, fontWeight: FontWeightStyle = .Regular) -> UIFont {
        var fontName = "PingFangSC-Regular"
        switch fontWeight {
        case .Medium:
            fontName = "PingFangSC-Medium"
        case .Semibold:
            fontName = "PingFangSC-Semibold"
        case .Light:
            fontName = "PingFangSC-Light"
        case .Regular:
            fontName = "PingFangSC-Regular"
        }
        let font = UIFont(name: fontName, size: fontSize)
        return font ?? UIFont.systemFont(ofSize: fontSize)
    }
}
