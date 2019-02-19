//
//  UnderLine.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/19/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit
extension UIView{


func addUnderline() {
    let line = UIView()
    line.translatesAutoresizingMaskIntoConstraints = false
    self.superview!.addSubview(line)
    
    line.backgroundColor = .black
    NSLayoutConstraint(item: line, attribute: .top, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -4).isActive = true
    NSLayoutConstraint(item: line, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: line, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: line, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 1).isActive = true
}


func addOverline() {
    let line = UIView()
    line.translatesAutoresizingMaskIntoConstraints = false
    self.superview!.addSubview(line)
    
    line.backgroundColor = .black
    NSLayoutConstraint(item: line, attribute: .top, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: line, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: line, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: line, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 1).isActive = true
}
    
    func illuminateView(){
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.shadowOpacity = 1
    }

}
