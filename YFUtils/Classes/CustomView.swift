//
//  CustomView.swift
//  ShopRound
//
//  Created by Ben on 2017/12/12.
//  Copyright © 2017年 TradeVan. All rights reserved.
//

import UIKit

class CustomView: UIView {

    func setupCustomNib() {
        let selfType = type(of: self)
        let nib = UINib(nibName: String(describing: selfType.self), bundle: Bundle(for: selfType))
        let contentView = nib.instantiate(withOwner: self, options: nil).first! as! UIView
        contentView.frame = bounds
        addSubview(contentView)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCustomNib()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setupCustomNib()
    }
}


class CustomControl: UIControl {
    
    func setupCustomNib() {
        let selfType = type(of: self)
        let nib = UINib(nibName: String(describing: selfType.self), bundle: Bundle(for: selfType))
        let contentView = nib.instantiate(withOwner: self, options: nil).first! as! UIView
        contentView.frame = bounds
        addSubview(contentView)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCustomNib()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setupCustomNib()
    }
}
