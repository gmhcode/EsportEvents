//
//  IntroView.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/15/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

@IBDesignable class IntroView: UIView {
    
    
    @IBInspectable var viewColor : UIColor = UIColor.white
    @IBInspectable var viewBorderWidth : CGFloat = 0
    @IBInspectable var viewBorderColor : UIColor = UIColor.clear
    @IBInspectable var viewCornerRadius : CGFloat = 0.0
    

    override func awakeFromNib() {
        super.awakeFromNib()
        styleView()
    }
    
    override func prepareForInterfaceBuilder() {
        styleView()
    }
    
    func styleView(){
        
        backgroundColor = viewColor
        layer.borderWidth = viewBorderWidth
        layer.borderColor = viewBorderColor.cgColor
        layer.cornerRadius = viewCornerRadius
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
