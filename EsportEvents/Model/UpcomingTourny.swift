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
    let videoGame : UpcomingTournyVideoGameName
    let name : String?
    let beginTime : String?
    let slug : String?
    let teams : [Teams]?
    let matches : [Match]?
    let league : League
    let leagueId : Int?
    let id : Int
    
    private enum CodingKeys: String, CodingKey{
        
        case videoGame = "videogame"
        case serie = "serie"
        case name = "name"
        case beginTime = "begin_at"
        case slug = "slug"
        case teams = "teams"
        case matches = "matches"
        case league = "league"
        case leagueId = "league_id"
        case id = "id"
    }
}

struct SeriesDictionary: Decodable {
    
    let name : String?
    let beginTime : String
    let endTime : String?
    let slug : String?
    
    
    private enum CodingKeys: String, CodingKey{
        
        case beginTime = "begin_at"
        case endTime = "end_at"
        case name = "name"
        case slug = "slug"
    }
}

 struct UpcomingTournyVideoGameName: Decodable {
    
    let name : String?
}

struct Match: Decodable{
    
    let winnerId : Int?
    let numberOfGames : Int?
    let beginTime : String?
    let slug : String?
    let name : String?
    let tournamentId : Int
    let id : Int
    
    
    private enum CodingKeys: String, CodingKey{
        
        case winnerId = "winner_id"
        case numberOfGames = "number_of_games"
        case beginTime = "begin_at"
        case slug = "slug"
        case name = "name"
        case tournamentId = "tournament_id"
        case id = "id"
    }
}

struct Teams: Decodable {
    
    let slug : String?
    let name : String
    let imageUrl : URL?
    let id : Int
    let acronym : String?
    
    private enum CodingKeys: String, CodingKey{
        
        case slug = "slug"
        case name = "name"
        case imageUrl = "image_url"
        case id = "id"
        case acronym = "acronym"
    }
}

struct League: Decodable {
    
    let slug : String?
    let name : String
    let imageUrl : URL?
    let id : Int?
    
    
    private enum CodingKeys: String, CodingKey{
        
        case slug = "slug"
        case name = "name"
        case imageUrl = "image_url"
        case id = "id"
    }
}
