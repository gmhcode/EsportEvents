//
//  asString.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/6/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

extension Date {
    
    var asString: String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    
    }
}



