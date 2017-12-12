//
//  UIAlertController+Util.swift
//  TaxRefund
//
//  Created by Ben on 2017/4/19.
//  Copyright © 2017年 TradeVan. All rights reserved.
//

import UIKit
import Localize_Swift

public extension UIViewController {
    
    var bundle: Bundle {
        let myBundle = Bundle(identifier: "org.cocoapods.YFUtils")!
        return Bundle(path: myBundle.path(forResource: "YFUtils", ofType: "bundle")!)!
    }
    
    public enum AlertType {
        case message, error
    }
    
    public func alert(message: String?, type: AlertType = .message, handler: ((UIAlertAction) -> Swift.Void)? = nil, completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: "", message: message , preferredStyle: .alert)
        
        if type == .message {
            let attributedString = NSAttributedString(string: "alert_message_title".localized(in: bundle), attributes: [
                NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17.0),
                NSAttributedStringKey.foregroundColor : UIColor.black])
            
            alert.setValue(attributedString, forKey: "attributedTitle")
        }
        else {
            let attributedString = NSAttributedString(string: "alert_error_title".localized(in: bundle), attributes: [
                NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17.0),
                NSAttributedStringKey.foregroundColor : UIColor.red])
            
            alert.setValue(attributedString, forKey: "attributedTitle")
        }
        
        alert.addAction(UIAlertAction(title: "alert_button_done".localized(in: bundle), style: .default, handler: handler))
        
        self.present(alert, animated: true, completion: completion)
    }
}
