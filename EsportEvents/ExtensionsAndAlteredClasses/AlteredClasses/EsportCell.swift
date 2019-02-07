//
//  EsportCell.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/7/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit
class EsportCell: UITableViewCell {
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setCellHighlightedsColor()
    }
    
    
    
        func setCellHighlightedsColor(){
            self.selectedBackgroundView?.backgroundColor = #colorLiteral(red: 0, green: 0.8818310499, blue: 0.470210135, alpha: 1)
        }
        
    }
