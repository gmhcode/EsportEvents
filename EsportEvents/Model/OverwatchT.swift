//
//  OverwatchT.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/21/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

struct OverwatchTourny: Decodable{
    
    let serie : OverwatchSeriesDictionary
    let videoGame : OverwatchTournyVideoGameName
    let name : String?
    let beginTime : String?
    let slug : String?
    let teams : [OverwatchTeams]?
    let matches : [OverwatchMatch]?
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

struct OverwatchSeriesDictionary: Decodable {
    
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

struct OverwatchTournyVideoGameName: Decodable {
    
    let name : String?
}

struct OverwatchMatch: Decodable{
    
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

struct OverwatchTeams: Decodable {
    
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

struct OverwatchLeague: Decodable {
    
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
