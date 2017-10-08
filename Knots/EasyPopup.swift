//
//  EasyPopup
//  EasyPopup
//
//  Created by DaRk-_-D0G on 24/08/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation
import UIKit


/// EasyPopUp class create PopUp
class EasyPopup : UIView {
    
    /**
    Enumarate for position
    
    - Left:  Left position
    - Right: Right position
    
    enum CloseButtonPosition {
    case Left, Right
    } */
    
    /// Popup view
    var popupView: UIView!
    ///  Close button
    var closeButton: UIButton!
    /// Background view
    var backgroundView: UIView!
    
    /// Set Start animate
    var startAnimate:(()->())?
    /// Set End animate
    var endAnimate:(()->())?
    
    ///###### Public ######///
    
    var sizeCloseBtnPourcent:CGFloat = 13 {
        didSet {
            self.updateConstraintsPopUp()
        }
    }
    var heightPopPourcent:CGFloat = 80 {
        didSet {
            self.updateConstraintsPopUp()
        }
    }
    var widthPopPourcent:CGFloat = 80 {
        didSet {
            self.updateConstraintsPopUp()
        }
    }
    var positionYMore:CGFloat = 0 {
        didSet {
            self.updateConstraintsPopUp()
        }
    }
    /* var possitionCloseButton:CloseButtonPosition = .Left {
    willSet {
    self.setCloseButtonPosition(newValue)
    }
    } */
    
    ///###### Private ######///
    
    var positionX: CGFloat {
        get {
            return UIScreen.main.bounds.width / 2 - self.popUpWidth / 2
        }
    }
    var positionY: CGFloat {
        get {
            return sizeButtonClose + positionYMore
        }
    }
    var sizeButtonClose: CGFloat {
        get {
            return (self.frame.width * sizeCloseBtnPourcent / 100)
        }
    }
    fileprivate var popUpHeight: CGFloat {
        get {
            return (self.frame.height * heightPopPourcent / 100)
        }
    }
    fileprivate var popUpWidth: CGFloat {
        get {
            return (self.frame.width * widthPopPourcent / 100)
        }
    }
    
    
    required init(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    /**
    Init
    
    :param: frame       Frame of your UIViewController
    :param: contentView Content view in PopUp
    
    :returns: EasyPopUp
    */
    init(frame: CGRect, contentView: UIView) {
        super.init(frame: frame)
        
        
        self.createBackground()
        self.createPopupView()
        self.createCloseButton()
        
        
        contentView.frame =  CGRect(x: 0, y: 0,width: popUpWidth, height: popUpHeight)
        self.popupView.addSubview(contentView)

        
        
        
    }
    
    func start() {
        self.createStartAnimation()
        
    }
    
    func removeDefautlAnimate() {
        
        // Guard Swift 2.0

        self.backgroundView.layer.removeAllAnimations()
        self.popupView.layer.removeAllAnimations()
        self.closeButton.layer.removeAllAnimations()
    }
    
    
    ///####################################################################################################///
    ///                                     Create Function                                                ///
    ///####################################################################################################///
    
    
    /**
    Create Background
    */
    func createBackground() {
        
        self.backgroundView = UIView(frame: frame)
        self.backgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        
        self.addSubview(backgroundView)
        
    }
    /**
    Create popupView
    */
    func createPopupView(defaultAnimate withDefaultAnimate:Bool = true, defaultStyle withDefaultStyle:Bool = true) {
        
        self.popupView = UIView(frame: CGRect(x: positionX, y: self.positionY, width: popUpWidth,height: popUpHeight))
        self.popupView.backgroundColor = UIColor.white
        self.popupView.layer.cornerRadius = 8.0
        self.popupView.clipsToBounds = true
        
        self.addSubview(popupView)
        
    }
    /**
    Create close button
    */
    func createCloseButton() {
        
        let positionX = UIScreen.main.bounds.width / 2 - popupView.frame.size.width / 2
        
        self.closeButton = (UIButton(type:.system))
        self.closeButton.addTarget(self, action: #selector(EasyPopup.closeButtonPressed(_:)), for: .touchUpInside)
        self.closeButton.frame = CGRect(x: positionX - 20, y: positionY - 20, width: sizeButtonClose, height: sizeButtonClose)
        
        self.closeButton.backgroundColor = UIColor(red: 0.149, green: 0.149, blue: 0.149, alpha: 1.00)
        self.closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        self.closeButton.clipsToBounds = true
        self.closeButton.setTitleColor(UIColor.white, for: UIControlState())
        self.closeButton.setTitle("×", for: UIControlState())
        self.closeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.closeButton.titleLabel?.textAlignment =  .center
        self.addSubview(closeButton)
        //  self.insertSubview(closeButton, aboveSubview: popupView)
    }
    /**
    Create animation
    */
    func createStartAnimation() {
        if let funcAnimate = self.startAnimate {
            funcAnimate()
        } else {
            
            self.backgroundView.alpha = 0
            self.closeButton.alpha = 0
            
            self.popupView.frame.origin.y = -self.frame.height
            
            self.closeButton.frame.origin.y = -self.frame.height
            
            
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: UIViewAnimationOptions(), animations: {
                self.backgroundView.alpha = 1
                self.closeButton.alpha = 1
                
                self.popupView.frame.origin.y = self.positionY + self.positionY / 10
                self.closeButton.frame.origin.y  = self.positionY - self.sizeButtonClose / 2 + self.positionY / 10
                }, completion: { (bool) -> Void in
                    UIView.animate(withDuration: 0.2, delay: 0.0, options: UIViewAnimationOptions(), animations: {
                        
                        
                        self.popupView.frame.origin.y = self.positionY
                        self.closeButton.frame.origin.y  = self.positionY - self.sizeButtonClose / 2
                        }, completion: { (bool) -> Void in
                            
                    })
            })
            
            
        }
    }
    
    /**
    Create end animation
    */
    func createEndAnimation() {
        
        if let funcAnimate = self.endAnimate {
            funcAnimate()
        } else {
            
            UIView.animate(withDuration: 0.4, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.backgroundView.alpha = 0
                
                self.popupView.frame.origin.y = self.frame.height
                self.closeButton.frame.origin.y  = self.frame.height
                
                
                }) { (Bool) -> Void in
                    self.removeFromSuperview()
            }
        }
        
    }
    ///####################################################################################################///
    ///                                     Update Constraint                                              ///
    ///####################################################################################################///
    fileprivate func updateConstraintsPopUp() {
        self.closeButton.frame = CGRect(x: positionX - 20, y: positionY - 20, width: sizeButtonClose, height: sizeButtonClose)
        self.popupView.frame = CGRect(x: positionX, y: self.positionY, width: popUpWidth,height: popUpHeight)
    }
    ///####################################################################################################///
    ///                                     Set Function                                                   ///
    ///####################################################################################################///
    
    
    /**
    Set positon button
    
    :param: position CloseButtonPosition
    
    private func setCloseButtonPosition(position: CloseButtonPosition) {
    if position == .Left {
    closeButton.frame = CGRectMake(closeButton.frame.origin.x, closeButton.frame.origin.y, sizeButtonClose, sizeButtonClose)
    } else if position == .Right {
    closeButton.frame =  CGRectMake(popupView.frame.size.width, closeButton.frame.origin.y, sizeButtonClose, sizeButtonClose)
    
    }
    }*/
    
    ///####################################################################################################///
    ///                                     UIButton Listener                                              ///
    ///####################################################################################################///
    func closeButtonPressed(_ sender: UIButton)  { self.createEndAnimation() }
    
    
}
