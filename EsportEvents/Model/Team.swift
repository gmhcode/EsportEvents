//
//  Team.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/20/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

struct Team: Decodable {
    let players : [Players]
    let name : String
}

struct Players: Decodable {
    let name : String
    let lastName : String?
    let imageUrl : URL?
    let firstName : String?
    let hometown : String?
    
    
    private enum CodingKeys: String, CodingKey{
        case name = "name"
        case lastName = "last_name"
        case imageUrl = "image_url"
        case firstName = "first_name"
        case hometown = "hometown"
        
    }
}
//3209
