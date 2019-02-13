//
//  SideMenu.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/12/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit
import CoreGraphics

extension CalendarViewController {
    
    func hideMenu(){
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.sideMenuButton1.transform = CGAffineTransform(translationX: -self.sideMenuRound.frame.width, y: 0)
            self.sideMenuButton7.transform = CGAffineTransform(translationX: -self.sideMenuRound.frame.width, y: 0)
        })
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.sideMenuButton2.transform = CGAffineTransform(translationX: -self.sideMenuRound.frame.width, y: 0)
            self.sideMenuButton6.transform = CGAffineTransform(translationX: -self.sideMenuRound.frame.width, y: 0)
        })
        UIView.animate(withDuration: 0.4, delay: 0.3, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.sideMenuButton3.transform = CGAffineTransform(translationX: -self.sideMenuRound.frame.width, y: 0)
            self.sideMenuButton4.transform = CGAffineTransform(translationX: -self.sideMenuRound.frame.width, y: 0)
        })

        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.sideMenuNotRound.transform = CGAffineTransform(translationX: -self.sideMenuRound.frame.width, y: 0)
            
            
            
            
        }, completion: { (complete) in
//                            self.sideMenuNotRound.isHidden = true
//                            self.sideMenu.isHidden = true

            
        })
        UIView.animate(withDuration: 0.4) {
            self.sideMenuNotRound.alpha = 0
            self.sideMenu.alpha = 0
            
            
        }
        dismissSideMenuButton.isHidden = true
    }
    
    func showMenu(){
        
        UIView.animate(withDuration: 0.4) {
            self.sideMenuNotRound.alpha = 1
            self.sideMenu.alpha = 1
            
        }
//        sideMenu.isHidden = false
//        sideMenuNotRound.isHidden = false
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.sideMenuButton1.transform = .identity
            self.sideMenuButton7.transform = .identity
        })
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.sideMenuButton2.transform = .identity
            self.sideMenuButton6.transform = .identity
        })
        UIView.animate(withDuration: 0.4, delay: 0.3, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.sideMenuButton3.transform = .identity
            self.sideMenuButton4.transform = .identity
        })
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.sideMenuNotRound.transform = .identity
            self.sideMenu.transform = .identity
            
        })
      
        
        dismissSideMenuButton.isHidden = false
    }
    
    
}
