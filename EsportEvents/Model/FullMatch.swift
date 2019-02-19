//
//  FullMatch.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/14/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

struct FullMatch: Decodable {
    
    let winner : Winner?
//    let tournament : UpcomingTourny?
    let opponents : [Opponents]
    let status : String?
    let numberOfGames : Int?
    let live : Live
    
    
    private enum CodingKeys: String, CodingKey{
        case winner = "winner"
//        case tournament = "tournament"
        case opponents = "opponents"
        case status = "status"
        case numberOfGames = "number_of_games"
        case live = "live"
    }
}

struct Live : Decodable {
    
    let url : URL?
    
}


struct Opponents: Decodable{
    
    let opponent : Opponent
}

struct Opponent: Decodable {
    
    let name : String
    let id : Int
    let acronym : String?
    let image_url : URL?
    
}

struct Winner: Decodable {
    
    let name : String
    
}
