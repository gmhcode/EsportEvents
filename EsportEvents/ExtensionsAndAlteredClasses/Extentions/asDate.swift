//
//  asDate.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/7/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

extension String {
    
    var asDate: Date {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self)!
    }

    var asCrazyDate: Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return formatter.date(from: self)!
    }
    

}


