//
//  LocalizedViewController.swift
//  TaxRefund
//
//  Created by Ben on 2017/6/7.
//  Copyright © 2017年 TradeVan. All rights reserved.
//

import UIKit
import Localize_Swift

open class LocalizedViewController: UIViewController {
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setupLocalizedText), name: NSNotification.Name(LCLLanguageChangeNotification), object: nil)
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(LCLLanguageChangeNotification), object: nil)
    }
    
    @objc open func setupLocalizedText() {
        fatalError("Override this method.")
    }
}
