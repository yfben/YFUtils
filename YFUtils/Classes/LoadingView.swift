//
//  LoadingView.swift
//  TaxRefund
//
//  Created by Ben on 2017/6/13.
//  Copyright © 2017年 TradeVan. All rights reserved.
//

import UIKit

public class LoadingView: UIView {
    
    static var sharedInstance: LoadingView {
        struct Singleton {
            static let instance = LoadingView(frame: CGRect.zero)
        }
        return Singleton.instance
    }
    
    let messageLabel = UILabel()
    let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    
    var end: DispatchTime!
    
    public static let animatingDuration = 0.33
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)

        backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
        
        messageLabel.font = UIFont(name: "HelveticaNeue", size: 17.0)!
        messageLabel.numberOfLines = 1
        messageLabel.textAlignment = .left
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.adjustsFontSizeToFitWidth = true
        messageLabel.minimumScaleFactor = 0.5
        messageLabel.textColor = UIColor.white
        addSubview(messageLabel)
        
        addSubview(indicatorView)
    }
    
    private class func containerView() -> UIView {
        return UIApplication.shared.keyWindow!
    }
    
    @discardableResult
    public class func show(message: String? = nil, duration: DispatchTimeInterval = .milliseconds(Int(animatingDuration * 1000))) -> LoadingView {
        
        let spinner = LoadingView.sharedInstance
        
        spinner.end = DispatchTime.now() + duration
        
        spinner.messageLabel.text = message
        
        spinner.updateFrame()
        
        if spinner.superview == nil {
            
            spinner.alpha = 0
            
            let containerView = self.containerView()
            containerView.addSubview(spinner)
            
            spinner.indicatorView.startAnimating()
            
            UIView.animate(withDuration: animatingDuration, delay: 0.0, options: .curveEaseOut, animations: {
                
                spinner.alpha = 1
                
            })
        }
        
        return spinner
    }
    
    public class func hide(completion: (() -> Void)? = nil) {
        
        let spinner = LoadingView.sharedInstance
        
        DispatchQueue.main.asyncAfter(deadline: spinner.end) {
            
            if spinner.superview == nil {
                return
            }
            
            spinner.indicatorView.stopAnimating()
            
            UIView.animate(withDuration: animatingDuration, delay: 0.0, options: .curveEaseOut, animations: {
                
                spinner.alpha = 0
                
            }, completion: { _ in
                
                spinner.removeFromSuperview()
                spinner.messageLabel.text = nil
                
                if let completion = completion {
                    completion()
                }
            })
        }
    }
    
    override public var frame: CGRect {
        
        didSet {
            
            if frame == CGRect.zero {
                return
            }
            
            // titile label
            if let text = messageLabel.text {
                
                messageLabel.frame.size = text.boundingRect(with: CGSize(width: 250.0, height: 21.0), attributes:[NSAttributedStringKey.font: messageLabel.font], context: nil).size
                
                let titleLabelWidth = indicatorView.frame.width
                let indicatorViewXTitleLabel: CGFloat = 8.0
                messageLabel.center = CGPoint(x: center.x + (titleLabelWidth + indicatorViewXTitleLabel) / 2.0, y: center.y)
                
                indicatorView.center = CGPoint(x: messageLabel.frame.minX - indicatorViewXTitleLabel - indicatorView.frame.size.width / 2.0, y: messageLabel.center.y)
            }
            else {
                
                messageLabel.frame.origin = CGPoint.zero
                indicatorView.center = center
            }
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Not coder compliant")
    }
    
    func updateFrame() {
        
        let containerView = LoadingView.containerView()
        LoadingView.sharedInstance.frame = containerView.bounds
    }
    
    override public func layoutSubviews() {
        
        super.layoutSubviews()
        updateFrame()
    }
}

