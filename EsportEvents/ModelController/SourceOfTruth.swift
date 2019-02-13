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
    
    
    var dotaMatches : [Date: [Matches]] = [:]
    
    var dotaMatchesCorrect : [Date: [Matches]] = [:]
    
    
    
    var dota2Tournies : [UpcomingTourny]?
//    var pubgTournaments : [UpcomingTourny]?
    var csgoTournies : [UpcomingTourny]?
    var lolTournies : [UpcomingTourny]?
    var overwatchTournies : [UpcomingTourny]?
    
    
    
    
    func filterMatchesFromTourny(){
        guard let dotaTournaments = dotaTournaments else { return }
        
        
        for (date, tournies) in dotaTournaments{
            
            for tourny in tournies{
                guard let matches = tourny.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); continue}
                for match in matches{
                    
                    guard let matchtime = match.beginTime?.asCrazyDate else {continue}
//                    print("❇️🔥\(matchtime)")
                    dotaMatches.isEmpty ? dotaMatches = [date : [match]] : dotaMatches[date]?.append(match)
                    //^^ this question maRK is breaking it
                    
                    
                    
//                    print("🌹🛳⛽️\(dotaMatches)")
                    
                }
            }
        }
        filterDatesFromMatches()
    }
    
    
    func filterDatesFromMatches(){
        
        
        for (date, matches) in dotaMatches{
            for match in matches{
            guard let matchtime = match.beginTime?.asCrazyDate else {continue}
//            print("❇️🔥\(matchtime)")
            dotaMatchesCorrect.isEmpty ? dotaMatchesCorrect = [matchtime : [match]] : dotaMatchesCorrect[matchtime]?.append(match)
            print("🏓❇️\(dotaMatchesCorrect)")
            }
        }
    }
    
        
    
    
    
    
    
    var games = ["Dota 2", "PUBG", "CS:GO", "LoL", "Overwatch"]
    
    func filterTournyByGameName(tournaments: [Date:[UpcomingTourny]]){
        
        for (date, tournies) in tournaments {
            
            if tournies.count != 0 {
                tournies.forEach {
                    switch $0.videoGame.name {
                    case "Dota 2":
                        dotaTournaments == nil ? dotaTournaments = [date : [$0]] : dotaTournaments?[date]?.append($0)
//                        guard let matches = $0.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
//                        for match in matches{
                        print("❗️🔥😃\($0)")
//
//                        }
                    case "PUBG":
                        pubgTournaments == nil ? pubgTournaments = [date : [$0]] : pubgTournaments?[date]?.append($0)
                    case "CS:GO":
                        csgoTournaments == nil ? csgoTournaments = [date : [$0]] : csgoTournaments?[date]?.append($0)
                    case "LoL":
                        lolTournaments == nil ? lolTournaments = [date : [$0]] : lolTournaments?[date]?.append($0)
                    case "Overwatch":
                        overwatchTournaments == nil ? overwatchTournaments = [date : [$0]] : overwatchTournaments?[date]?.append($0)
                    //                var games = ["Dota 2", "PUBG", "CS:GO", "LoL", "Overwatch"]
                    default:
                        print("⚡️🌚🌺NO NAME GAME")
                    }
                    
                }
            }
        }
    }
}


//var dateSections: [Date] {
//    var dateSections: [Date] = []
//    guard let everyTournament = everyTournament else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return dateSections }
//
//    //sets all the dates in order by date
//    for (date, _) in everyTournament.sorted(by: {$0.key < $1.key})
//    {
//        if !dateSections.contains(date) {
//            dateSections.append(date)
//        }
//    }
//
//
//    return dateSections
//}

//        if tournaments.keys.contains(tournamentDate){
//
//            tournaments[tournamentDate]?.append($0)


//        } else {
//
//            if tournamentDate >= first && tournamentDate <= last && tournamentName.contains(self.currentImageGameName) {
//                tournaments[tournamentDate] = [tournament]
//                //
//            }
//
//            }
