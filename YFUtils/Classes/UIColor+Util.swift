//
//  UIColor+Util.swift
//  TaxRefund
//
//  Created by Ben on 2017/4/26.
//  Copyright © 2017年 TradeVan. All rights reserved.
//

import UIKit

public extension UIColor {
    
    convenience public init(hex: Int, alpha: CGFloat = 1.0) {
        
        let red = CGFloat((hex >> 16) & 0xFF) / 255.0
        let green = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public func image(size: CGSize) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
