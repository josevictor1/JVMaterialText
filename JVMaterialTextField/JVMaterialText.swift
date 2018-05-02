//
//  JVMaterialText.swift
//  JVMaterialTextField
//
//  Created by José Victor Pereira Costa on 21/04/2018.
//  Copyright © 2018 José Victor Pereira Costa. All rights reserved.
//

import UIKit

@IBDesignable
class JVMaterialText: UITextField {
    
    @IBInspectable dynamic open var disabledColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1)
    @IBInspectable dynamic open var enabledColor = UIColor(red: 32/255, green: 178/255, blue: 187/255, alpha: 1)
    @IBInspectable dynamic open var placeHolderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    @IBInspectable dynamic open var placeHolderFont = UIFont.systemFont(ofSize: 13)
    @IBInspectable dynamic open var errorColor = UIColor.red
    
    
    open var boderLine: UIView!
    open var placeHolderLabel: UILabel!
    open var hasError: Bool = false
    
    func updateColors(){
        if !isEditing{
            boderLine.backgroundColor = disabledColor
            placeHolderLabel.textColor = placeHolderColor
        }
        else if hasText || isEditing || isFocused {
            
            if !hasText {
                boderLine.backgroundColor = enabledColor
                placeHolderLabel.textColor = placeHolderColor
            }
            else if hasError {
                boderLine.backgroundColor = errorColor
                placeHolderLabel.textColor = errorColor
            }
            else {
                boderLine.backgroundColor = enabledColor
                placeHolderLabel.textColor = enabledColor
            }
        }
    }
    
    func instantiateBorderLine() {
        boderLine = UIView()
        boderLine.isUserInteractionEnabled = false
        boderLine.frame = drawBorderLine(bounds)
        boderLine.backgroundColor = disabledColor
        boderLine.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        addSubview(boderLine)
    }
    
    func instantiateLabel() {
        
        placeHolderLabel = UILabel()
        placeHolderLabel.alpha = 1.0
        placeHolderLabel.font = placeHolderFont
        placeHolderLabel.textColor = placeHolderColor
        placeHolderLabel.isUserInteractionEnabled = false
        placeHolderLabel.text = "teste"
        placeHolderLabel.frame = drawPlaceHolderLabel(bounds)
        placeHolderLabel.autoresizingMask = [.flexibleHeight ,.flexibleBottomMargin]
        addSubview(placeHolderLabel)
    }
    
    func redraw() {
        boderLine.frame = drawBorderLine(bounds)
    }
    
    
    func releaseScreen() {
        updateColors()
        redraw()
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        if let myfont = font {
            return CGRect(x: 0, y: bounds.size.height - 2 - myfont.lineHeight - placeHolderFont.lineHeight, width: bounds.size.width, height: 2 + myfont.lineHeight + placeHolderFont.lineHeight)
        }
        return CGRect(x: 0, y: bounds.size.height - 2 - 16, width: bounds.size.width, height: 16)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        if let myfont = font {
            return CGRect(x: 0, y: bounds.size.height - 2 - myfont.lineHeight, width: bounds.size.width, height: myfont.lineHeight)
        }
        return CGRect(x: 0, y: bounds.size.height - 2 - 16, width: bounds.size.width, height: 16)
    }
    func drawPlaceHolderLabel(_ bounds: CGRect) -> CGRect{
        return CGRect(x: 0, y: bounds.size.height - 2 - placeHolderFont.lineHeight , width: bounds.size.width, height: placeHolderFont.lineHeight)
    }
    
    func drawBorderLine(_ bounds: CGRect) -> CGRect {
        if isFocused || isEditing {
            return CGRect(x: 0, y: bounds.size.height - 2, width: bounds.size.width, height: 2)
        }
        return CGRect(x: 0, y: bounds.size.height - 1, width: bounds.size.width, height: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiateBorderLine()
        instantiateLabel()
        borderStyle = .none 
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        instantiateBorderLine()
        instantiateLabel()
        borderStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        releaseScreen()
    }
    
    override func becomeFirstResponder() -> Bool {
        let becomeFR =  super.becomeFirstResponder()
        releaseScreen()
        return becomeFR
    }
    
    override func resignFirstResponder() -> Bool {
        let resignFR = super.resignFirstResponder()
        releaseScreen()
        return resignFR
    }
}
