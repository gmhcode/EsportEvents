//
//  SourceOfTruth.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/6/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class SourceOfTruth {
    
    static let shared = SourceOfTruth()
    private init() {}
    
    var UpcomingTounaments : [UpcomingTourny] = []
    var everyTournament : [Date:[UpcomingTourny]] = [:]
    var dotaTournaments : [Date:[UpcomingTourny]]?
    var pubgTournaments : [Date:[UpcomingTourny]]?
    var overwatchTournaments : [Date:[UpcomingTourny]]?
    var lolTournaments : [Date:[UpcomingTourny]]?
    var csgoTournaments : [Date:[UpcomingTourny]]?
    var thisMonthsTournyByGame : [Date: [UpcomingTourny]] = [:]
    var noNameTournaments : [Date:[UpcomingTourny]]?
    
    var dotaMatches : [Date: [Match]] = [:]
    var pubgMatches : [Date: [Match]] = [:]
    var overwatchMatches : [Date: [Match]] = [:]
    var lolMatches : [Date: [Match]] = [:]
    var csgoMatches : [Date: [Match]] = [:]
    var noNameMatches : [Date: [Match]] = [:]
    var thisMonthsMatchesByGame : [Date: [Match]] = [:]
    
    var allTeams : [Teams] = []
    
    var dotaMatchesCorrect : [Date: [Match]] = [:]
    var currentImageGameName : String?
    
    var tournamentIDs : [Int] = []
    
    var dota2Tournies : [UpcomingTourny]?
    //    var pubgTournaments : [UpcomingTourny]?
    var csgoTournies : [UpcomingTourny]?
    var lolTournies : [UpcomingTourny]?
    var overwatchTournies : [UpcomingTourny]?
    
    
    
    
    
    
    
    func populateTournamentIdsAndTeams(from tournaments: [UpcomingTourny]){
        tournaments.forEach({
            tournamentIDs.append($0.id)
            populateAllTeams(from: $0)
        })
        //        print("🥶🔥all Teams \(allTeams)")
        //        print("♊️❌tourny id's\(tournamentIDs)")
    }
    
    func populateAllTeams(from tournament: UpcomingTourny){
        tournament.teams?.forEach({
            allTeams.append($0)
        })
    }
    
    
    
    func fetchTournament(from ID : Int) -> UpcomingTourny{
        
        var returningTournament : UpcomingTourny? = nil
        
        for tournament in UpcomingTounaments{
            if tournament.id == ID {
                returningTournament = tournament
            }
        }
        return returningTournament ?? (UpcomingTounaments[0])
    }
    
    func fetchLeague(from id: Int) -> League {
        
        var league : League?
        UpcomingTounaments.forEach({
            if $0.leagueId == id{
                league = $0.league
            }
        })
        return league!
    }
    
    
    
    func fetchTeam(from id: Int) -> Teams{
        
        var returningTeam : Teams? = nil
        
        allTeams.forEach({
            if $0.id == id{
                returningTeam = $0
            }
        })
        return returningTeam ?? allTeams[0]
    }
    
    
    
    func allMatchesForGame(currentImageGameName: String) -> [Date:[Match]]{
        
        switch currentImageGameName {
        case "Dota 2":
            return dotaMatches
        case "PUBG":
            return pubgMatches
        case "CS:GO":
            return csgoMatches
        case "LoL":
            return lolMatches
        case "Overwatch":
            return overwatchMatches
        default:
            return noNameMatches
        }
    }
    
    
    
    func allTournaments(byName currentImageGameName: String) -> [Date: [UpcomingTourny]]{
        switch currentImageGameName {
        case "Dota 2":
            return dotaTournaments ?? [:]
        case "PUBG":
            return pubgTournaments ?? [:]
        case "CS:GO":
            return csgoTournaments ?? [:]
        case "LoL":
            return lolTournaments ?? [:]
        case "Overwatch":
            return overwatchTournaments ?? [:]
        default:
            return noNameTournaments ?? [:]
        }
    }
    
    
    
    func filterMatchesByDate(firstOfMonth: Date, lastOfMonth: Date, currentImageGameName: String) -> [Date:[Match]]{
        var allGameMatches : [Date:[Match]]?
        
        switch currentImageGameName {
        case "Dota 2":
            allGameMatches = dotaMatches
        case "PUBG":
            allGameMatches = pubgMatches
        case "CS:GO":
            allGameMatches = csgoMatches
        case "LoL":
            allGameMatches = lolMatches
        case "Overwatch":
            allGameMatches = overwatchMatches
        default:
            print("no name game")
        }
        
        var thisMonthsMatches : [Date : [Match]] = [:]
        guard let allMatches = allGameMatches else { return [:] }
        
        for (date, matches) in allMatches {
            
            if date >= firstOfMonth && date <= lastOfMonth{
                
                if thisMonthsMatches.keys.contains(date)  {
                    
                    
                    thisMonthsMatches[date]?.append(contentsOf: matches)
                } else {
                    
                    thisMonthsMatches[date] = matches
                }
            }
        }
        thisMonthsMatchesByGame = thisMonthsMatches
        return thisMonthsMatches
    }
    
    
    func filterTournyByDate(firstOfMonth: Date, lastOfMonth: Date, currentImageGameName: String) -> [Date:[UpcomingTourny]] {
        
        var allGameTournaments : [Date:[UpcomingTourny]]?
        
        switch currentImageGameName {
        case "Dota 2":
            allGameTournaments = dotaTournaments
        case "PUBG":
            allGameTournaments = pubgTournaments
        case "CS:GO":
            allGameTournaments = csgoTournaments
        case "LoL":
            allGameTournaments = lolTournaments
        case "Overwatch":
            allGameTournaments = overwatchTournaments
        default:
            print("no name game")
        }
        var thisMonthsTournamentsByGame :  [Date : [UpcomingTourny]] = [:]
        guard let tournaments = allGameTournaments else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return [:] }
        
        for (date, tournies) in tournaments{
            if date >= firstOfMonth && date <= lastOfMonth{
                
                if thisMonthsTournamentsByGame.keys.contains(date)  {
                    
                    thisMonthsTournamentsByGame[date]?.append(contentsOf: tournies)
                } else {
                    
                    thisMonthsTournamentsByGame[date] = tournies
                }
            }
        }
        thisMonthsTournyByGame = thisMonthsTournamentsByGame
        return thisMonthsTournamentsByGame
    }
    
    // uses Info taken from an API call and filters that info into various game categories
    
    
    //populates this VV
    //var dotaTournaments : [Date:[UpcomingTourny]]?
    func filterTournyIntoGame(tournament: UpcomingTourny, gameTournament: inout [Date:[UpcomingTourny]]?, date: Date){
        
        if gameTournament == nil {
            //creates a dotaTournaments(for example) to append to
            gameTournament = [date : [tournament]]
        } else {
            //if the begin date is a key then append the tournament to that date
            if gameTournament?.keys.contains(date) == true {
                gameTournament?[date]?.append(tournament)
            } else {
                //if the tournament begin date is not a key then make one
                gameTournament?[date] =  [tournament]
            }
        }
        guard let matches = tournament.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        // does the same thing with matches VV
        filterMatchesFromTourny(matches: matches, tounament: tournament)
    }
    
    func filterMatchesIntoGame(match: Match, gameMatches: inout [Date: [Match]], matchTime: Date){
        
        if gameMatches.isEmpty {
            //creates a dotaMatches to append to
            gameMatches = [matchTime : [match]]
        } else {
            //if the begin date is a key then append the match to that date
            if gameMatches.keys.contains(matchTime) {
                gameMatches[matchTime]?.append(match)
            } else {
                //if the match begin date is not a key then make one
                gameMatches[matchTime] =  [match]
            }
        }
    }
    
    func filterTournyByGameName(tournaments: [Date:[UpcomingTourny]]){
        for (date, tournies) in tournaments {
            
            if tournies.count != 0 {
                tournies.forEach {
                    
                    switch $0.videoGame.name {
                    case "Dota 2":
                        filterTournyIntoGame(tournament: $0, gameTournament: &dotaTournaments, date: date)
                    case "PUBG":
                        filterTournyIntoGame(tournament: $0, gameTournament: &pubgTournaments, date: date)
                    case "CS:GO":
                        filterTournyIntoGame(tournament: $0, gameTournament: &csgoTournaments, date: date)
                    case "LoL":
                        filterTournyIntoGame(tournament: $0, gameTournament: &lolTournaments, date: date)
                    case "Overwatch":
                        filterTournyIntoGame(tournament: $0, gameTournament: &overwatchTournaments, date: date)
                    default:
                        print("⚡️🌚🌺NO NAME GAME")
                    }
                }
            }
        }
    }
    
    func filterMatchesFromTourny(matches: [Match], tounament: UpcomingTourny){
        
        for match in matches{
            
            guard let matchTimePre = match.beginTime?.dropLast(10) else {continue}
            let matchTime = String(matchTimePre).asDate
            
            switch tounament.videoGame.name{
            case "Dota 2":
                filterMatchesIntoGame(match: match, gameMatches: &dotaMatches, matchTime: matchTime)
            case "PUBG":
                filterMatchesIntoGame(match: match, gameMatches: &pubgMatches, matchTime: matchTime)
            case "CS:GO":
                filterMatchesIntoGame(match: match, gameMatches: &csgoMatches, matchTime: matchTime)
            case "LoL":
                filterMatchesIntoGame(match: match, gameMatches: &lolMatches, matchTime: matchTime)
            case "Overwatch":
                filterMatchesIntoGame(match: match, gameMatches: &overwatchMatches, matchTime: matchTime)
            default :
                print("no game Name")
            }
        }
    }
    
    
    
    
   
    
    
    func initialFetch(completion: @escaping ([Date:[UpcomingTourny]]?) -> Void) {
        
        NetworkCall.shared.fetchOverwatchTournaments { (fetchedTournaments) in
            NetworkCall.shared.fetchDota2Tournaments { (fetchedTournaments) in
                NetworkCall.shared.fetchCSGOTournaments { (fetchedTournaments) in
                    NetworkCall.shared.fetchLoLTournaments { (fetchedTournaments) in
                        
                        print("upcoming tournaments\(self.UpcomingTounaments)")
                        NetworkCall.shared.fetchTournaments { (fetchedTournaments) in
                            guard let fetchedTournaments = fetchedTournaments else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                            print("⚡️🥶\(fetchedTournaments)")
                            SourceOfTruth.shared.populateTournamentIdsAndTeams(from: fetchedTournaments)
                            
                            if self.UpcomingTounaments.isEmpty == false {
                                for tournament in self.UpcomingTounaments{
                                    guard let tournamentDate = tournament.beginTime?.asCrazyDate
                                        else { continue }
                                    if self.everyTournament.keys.contains(tournamentDate){
                                        
                                        self.everyTournament[tournamentDate]?.append(tournament)
                                    } else {
                                        
                                        self.everyTournament[tournamentDate] = [tournament]
                                    }
                                }
                                SourceOfTruth.shared.filterTournyByGameName(tournaments: self.everyTournament)
                                completion(self.everyTournament)
                            }
                        }
                    }
                }
            }
        }
    }
}

//func initialFetch(completion: @escaping ([Date:[UpcomingTourny]]?) -> Void) {
//
//
//
//    NetworkCall.shared.fetchTournaments { (fetchedTournaments) in
//
//        guard let fetchedTournaments = fetchedTournaments else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
//
//        SourceOfTruth.shared.populateTournamentIdsAndTeams(from: fetchedTournaments)
//
//        var allTournaments: [Date: [UpcomingTourny]] = [:]
//        var tournaments: [Date: [UpcomingTourny]] = [:]
//
//
//        if fetchedTournaments.isEmpty == false {
//            for tournament in fetchedTournaments{
//
//                guard let tournamentDate = tournament.beginTime?.asCrazyDate
//                    else { continue }
//
//                if tournaments.count < 50 {
//
//                    if tournaments.keys.contains(tournamentDate) && self.everyTournament.keys.contains(tournamentDate){
//
//                        tournaments[tournamentDate]?.append(tournament)
//
//                    } else {
//
//                        tournaments[tournamentDate] = [tournament]
//                    }
//                }else{
//                    break
//                }
//            }
//
//            SourceOfTruth.shared.everyTournament = tournaments
//            SourceOfTruth.shared.filterTournyByGameName(tournaments: tournaments)
//            completion(tournaments)
//        }
//    }
//}


