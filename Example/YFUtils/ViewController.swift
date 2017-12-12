//
//  ViewController.swift
//  itvTest
//
//  Created by Ben on 2017/12/8.
//  Copyright © 2017年 TradeVan. All rights reserved.
//

import UIKit
import Localize_Swift
import YFUtils

class ViewController: LocalizedViewController {
    
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var loadingButton: UIButton!
    
    @IBAction func languageButtonUpInside(_ sender: Any) {
        
        let currentLanguage = Localize.currentLanguage()
        
        if currentLanguage == "en" {
            Localize.setCurrentLanguage("zh-Hant")
        }
        else {
            Localize.setCurrentLanguage("en")
        }
    }
    
    @IBAction func messageButtonUpInside(_ sender: Any) {
        alert(message: "message_button_message".localized(), type: .error)
    }
    
    @IBAction func loadingButtonUpInside(_ sender: Any) {
        LoadingView.show(message: "loading_view_message".localized(), duration: .milliseconds(Int(2.0 * 1000)))
        LoadingView.hide()
    }
    
    override open func setupLocalizedText() {
        languageButton.setTitle("language_button_title".localized(), for: .normal)
        messageButton.setTitle("message_button_title".localized(), for: .normal)
        loadingButton.setTitle("loading_button_title".localized(), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocalizedText()
    }
}

