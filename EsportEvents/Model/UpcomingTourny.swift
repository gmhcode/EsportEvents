//
//  UpcomingTourny.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/6/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

struct UpcomingTourny: Decodable{
    
    let serie : SeriesDictionary
    let videoGame : VideoGameName
    
    private enum CodingKeys: String, CodingKey{
        case videoGame = "videogame"
        case serie = "serie"
    }
    
}

struct SeriesDictionary: Decodable {
    
    let beginTime : String
    
    private enum CodingKeys: String, CodingKey{
        case beginTime = "begin_at"
    }
}
 struct VideoGameName: Decodable {
    
    let name : String?
}
