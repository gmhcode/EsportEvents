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
    
    var UpcomingTounaments : [UpcomingTourny]?
    var everyTournament : [Date:[UpcomingTourny]]?
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
    
    
    
    
//    func filterMatchesFromTourny(){
//        guard let dotaTournaments = dotaTournaments else { return }
//
//
//        for (date, tournies) in dotaTournaments{
//
//            for tourny in tournies{
//                guard let matches = tourny.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); continue}
//                for match in matches{
//
//                    guard let matchTimePre = match.beginTime?.dropLast(10) else {continue}
//
//                    let matchTime = String(matchTimePre).asDate
//
//                    print("❇️🔥\(match)")
//
//
//
//                    if dotaMatches.isEmpty {
//                        //creates a dotaMatches to append to
//                        dotaMatches = [matchTime : [match]]
//                    } else {
//                        //if the begin date is a key then append the match to that date
//                        if dotaMatches.keys.contains(matchTime) {
//                            dotaMatches[matchTime]?.append(match)
//                        } else {
//                            //if the match begin date is not a key then make one
//                            dotaMatches[matchTime] =  [match]
//                        }
//                    }
//                    dotaMatches.forEach {
//                        print("key: \($0) & value: :\($1)")
//                    }
//
//                    print("🌹🛳⛽️\(dotaMatches.keys)")
//
//                }
//            }
//        }
////        filterDatesFromMatches()
//    }
    
    
    
    
        
//
//    func filterMatchesByDate(firstOfMonth: Date, lastOfMonth: Date, allGameMatches: [Date:[Matches]]) -> [Date:[Matches]]{
//
//        var thisMonthsMatches : [Date : [Matches]] = [:]
//
//        for (date, matches) in allGameMatches {
//
//            if date >= firstOfMonth && date <= lastOfMonth{
//
//                if thisMonthsMatches.keys.contains(date)  {
//
//
//                    thisMonthsMatches[date]?.append(contentsOf: matches)
//                } else {
//
//                    thisMonthsMatches[date] = matches
//
//                }
//            }
//        }
//        thisMonthsMathesByGame = thisMonthsMatches
//        return thisMonthsMatches
//    }
//
//    var games = ["Dota 2", "PUBG", "CS:GO", "LoL", "Overwatch"]
//
    
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
        
        for tournament in UpcomingTounaments!{
            if tournament.id == ID {
                returningTournament = tournament
            }
        }

        return returningTournament ?? (UpcomingTounaments?[0])!
    }
    
    func fetchLeague(from id: Int) -> League {
        
        var league : League?
        
        UpcomingTounaments?.forEach({
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
    
    
    
    
    func filterMatchesFromTourny(matches: [Match], tounament: UpcomingTourny){
        
        for match in matches{
            
            guard let matchTimePre = match.beginTime?.dropLast(10) else {continue}
            
            let matchTime = String(matchTimePre).asDate
            
            //                    print("❇️🔥\(match)")
            
            switch tounament.videoGame.name{
            case "Dota 2":
                if dotaMatches.isEmpty {
                    //creates a dotaMatches to append to
                    dotaMatches = [matchTime : [match]]
                } else {
                    //if the begin date is a key then append the match to that date
                    if dotaMatches.keys.contains(matchTime) {
                        dotaMatches[matchTime]?.append(match)
                        //                                print("🌹🛳⛽️\(dotaMatches.keys)")
                    } else {
                        //if the match begin date is not a key then make one
                        dotaMatches[matchTime] =  [match]
                    }
                    
                }
            case "PUBG":
                if pubgMatches.isEmpty {
                    //creates a dotaMatches to append to
                    pubgMatches = [matchTime : [match]]
                } else {
                    //if the begin date is a key then append the match to that date
                    if pubgMatches.keys.contains(matchTime) {
                        pubgMatches[matchTime]?.append(match)
                        //                                print("🔥⛽️\(pubgMatches.keys)")
                    } else {
                        //if the match begin date is not a key then make one
                        dotaMatches[matchTime] =  [match]
                    }
                    
                }
                
            case "CS:GO":
                if csgoMatches.isEmpty {
                    //creates a dotaMatches to append to
                    csgoMatches = [matchTime : [match]]
                } else {
                    //if the begin date is a key then append the match to that date
                    if csgoMatches.keys.contains(matchTime) {
                        csgoMatches[matchTime]?.append(match)
                        
                    } else {
                        //if the match begin date is not a key then make one
                        csgoMatches[matchTime] =  [match]
                    }
                }
            case "LoL":
                if lolMatches.isEmpty {
                    //creates a dotaMatches to append to
                    lolMatches = [matchTime : [match]]
                } else {
                    //if the begin date is a key then append the match to that date
                    if lolMatches.keys.contains(matchTime) {
                        lolMatches[matchTime]?.append(match)
                    } else {
                        //if the match begin date is not a key then make one
                        lolMatches[matchTime] =  [match]
                    }
                }
                
            case "Overwatch":
                if overwatchMatches.isEmpty {
                    //creates a dotaMatches to append to
                    overwatchMatches = [matchTime : [match]]
                } else {
                    //if the begin date is a key then append the match to that date
                    if overwatchMatches.keys.contains(matchTime) {
                        overwatchMatches[matchTime]?.append(match)
                    } else {
                        //if the match begin date is not a key then make one
                        overwatchMatches[matchTime] =  [match]
                    }
                }
            default :
                print("no game Name")
            }
        }
        //        filterDatesFromMatches()
    }
    
    
   
    
    
    
    
    func filterTournyByGameName(tournaments: [Date:[UpcomingTourny]]){
        
        for (date, tournies) in tournaments {
            
            if tournies.count != 0 {
                tournies.forEach {
                    
                    switch $0.videoGame.name {
                    case "Dota 2":
//                        dotaTournaments == nil ? dotaTournaments = [date : [$0]] : dotaTournaments?[date]?.append($0)
                        
                        if dotaTournaments == nil {
                            //creates a dotaMatches to append to
                            dotaTournaments = [date : [$0]]
                        } else {

                            //if the begin date is a key then append the match to that date
                            if dotaTournaments?.keys.contains(date) == true {
                                dotaTournaments?[date]?.append($0)
                                //                                print("🌹🛳⛽️\(dotaMatches.keys)")
                            } else {
                                //if the match begin date is not a key then make one
                                dotaTournaments?[date] =  [$0]
                            }
                            
                        }
                        guard let matches = $0.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                        filterMatchesFromTourny(matches: matches, tounament: $0)
                        
                        
//                        print("DOTA 🔥\(dotaTournaments!.keys)🍠🥶")
                        
                        
                    case "PUBG":
                        
                        if pubgTournaments == nil {
                            pubgTournaments = [date : [$0]]
                        } else {
                            
                            if pubgTournaments?.keys.contains(date) == true {
                                pubgTournaments?[date]?.append($0)
                            } else {
                                pubgTournaments?[date] =  [$0]
                            }
                            
                        }
                        guard let matches = $0.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                        filterMatchesFromTourny(matches: matches, tounament: $0)
//                        print(" PUBG ❇️🥕\(pubgMatches.values)🍠🥶")
                        
                    case "CS:GO":
                        
                         if csgoTournaments == nil {
                            csgoTournaments = [date : [$0]]
                        } else {
                            
                            if csgoTournaments?.keys.contains(date) == true {
                                csgoTournaments?[date]?.append($0)
                            } else {
                                csgoTournaments?[date] =  [$0]
                            }
                            
                        }
                        guard let matches = $0.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                        filterMatchesFromTourny(matches: matches, tounament: $0)
//                        print(" csgo 🌸🥕\(String(describing: csgoMatches.keys))🍠🥶")
                        
                    case "LoL":
                         if lolTournaments == nil {
                            lolTournaments = [date : [$0]]
                        } else {
                            
                            if lolTournaments?.keys.contains(date) == true {
                                lolTournaments?[date]?.append($0)
                            } else {
                                lolTournaments?[date] =  [$0]
                            }
                            
                        }
                        guard let matches = $0.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                        filterMatchesFromTourny(matches: matches, tounament: $0)
//                        print(" lol 🥶🥕\(String(describing: lolMatches.keys))🍠🥶")
                    case "Overwatch":
                        if overwatchTournaments == nil {
                            overwatchTournaments = [date : [$0]]
                        } else {
                            
                            if overwatchTournaments?.keys.contains(date) == true {
                                overwatchTournaments?[date]?.append($0)
                            } else {
                                overwatchTournaments?[date] =  [$0]
                            }
                            
                        }
                        guard let matches = $0.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                        filterMatchesFromTourny(matches: matches, tounament: $0)
//                        print(" overwatch ❗️🥕\(String(describing: overwatchMatches))🍠🥶")
                    //                var games = ["Dota 2", "PUBG", "CS:GO", "LoL", "Overwatch"]
                    default:
                        print("⚡️🌚🌺NO NAME GAME")
                    }
                    
                }
            }
        }
    }
    
    func initialFetch(completion: @escaping ([Date:[UpcomingTourny]]?) -> Void) {
        
        
        
        NetworkCall.shared.fetchTournaments { (fetchedTournaments) in
            
            guard let fetchedTournaments = fetchedTournaments else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
            
            SourceOfTruth.shared.populateTournamentIdsAndTeams(from: fetchedTournaments)
            
            var allTournaments: [Date: [UpcomingTourny]] = [:]
            var tournaments: [Date: [UpcomingTourny]] = [:]
            
            
            if fetchedTournaments.isEmpty == false {
                //print("🔥❇️\(fetchedTournaments)")
                for tournament in fetchedTournaments{
                    //print("🌞🍄\(tournament)")
                    
                    guard let tournamentDate = tournament.beginTime?.asCrazyDate
                        else { continue }
                    //print("  ❌🔥🤥 \(tournamentDateStringPre)")
                    if tournaments.keys.contains(tournamentDate){
                        
                        tournaments[tournamentDate]?.append(tournament)
                        
                    } else {
                        
                        tournaments[tournamentDate] = [tournament]
                    }
                }
                SourceOfTruth.shared.everyTournament = tournaments
                SourceOfTruth.shared.filterTournyByGameName(tournaments: tournaments)
                completion(tournaments)
                //print(tournaments)
            }
        }
    }
}


