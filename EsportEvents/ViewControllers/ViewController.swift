//
//  ViewController.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/6/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//     https://api.pandascore.co/   videogames.json?   token=k-uzeymiPYFtzJhwfGiRZpSC5Ag4SP99pUgB0NF6yuPou3iKtAg
    
//    https://api.pandascore.co//matches/upcoming.json?token=k-uzeymiPYFtzJhwfGiRZpSC5Ag4SP99pUgB0NF6yuPou3iKtAg
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        func getServerEvents(completion: @escaping ([Date:[UpcomingTourny]]?) -> Void) {
            
           
            
            NetworkCall.shared.fetchTournaments { (fetchedTournaments) in
                
                    
                    
                    guard let fetchedTournaments = fetchedTournaments else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                    
                    var allTournaments: [Date: [UpcomingTourny]] = [:]
                    var tournaments: [Date: [UpcomingTourny]] = [:]
                    
                    
                    if fetchedTournaments.isEmpty == false {
                        //                print("🔥❇️\(fetchedTournaments)")
                        
                        
                        //                    print(fetchedTournaments)
                        
                        for tournament in fetchedTournaments{
                            
//                            print("🌞🍄\(tournament)")
                            
                            guard let tournamentDate = tournament.beginTime?.asCrazyDate
                                else { continue }
                            
                          
                            //                    print("  ❌🔥🤥 \(tournamentDateStringPre)")
                            if tournaments.keys.contains(tournamentDate){
                                
                                tournaments[tournamentDate]?.append(tournament)
                                
                                
                            } else {
                                
                                
                                    tournaments[tournamentDate] = [tournament]
                                    //
                               
                            }
                        }
                        
                    
                   
                    completion(tournaments)
//                    print(tournaments)
                    SourceOfTruth.shared.everyTournament = tournaments
              
                }
            }
        }
        
        getServerEvents { (yes) in
            guard let yes = yes else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}

            SourceOfTruth.shared.filterTournyByGameName(tournaments: yes)
            SourceOfTruth.shared.filterMatchesFromTourny()
//            print("🌹🌒dota \(String(describing: SourceOfTruth.shared.dotaTournaments))")
//            print("🌸♊️overwatch \(String(describing: SourceOfTruth.shared.overwatchTournaments))")
//            print("🌸♊️lol \(String(describing: SourceOfTruth.shared.lolTournaments))")
//            print("🌸♊️csgo \(String(describing: SourceOfTruth.shared.csgoTournaments))")
        }
        
    }
}
//func filterMatchesFromTourny(tournament : UpcomingTourny?, name: String){
//    guard let tournament = tournament else { return }
//    
//    
//    guard let matches = tournament.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
//    
//    for match in matches{
//        
//        switch name{
//        case "Dota 2":
//            
//            
//            dotaMatches.isEmpty ? dotaMatches = [match.beginTime.asCrazyDate : [match]] : dotaMatches[match.beginTime.asCrazyDate]?.append(match)
//            
//        case "PUBG":
//            
//            
//            dotaMatches.isEmpty ? dotaMatches = [match.beginTime.asCrazyDate : [match]] : dotaMatches[match.beginTime.asCrazyDate]?.append(match)
//            
//        case "CS:GO":
//            
//            
//            dotaMatches.isEmpty ? dotaMatches = [match.beginTime.asCrazyDate : [match]] : dotaMatches[match.beginTime.asCrazyDate]?.append(match)
//            
//        case "LoL":
//            
//            
//            dotaMatches.isEmpty ? dotaMatches = [match.beginTime.asCrazyDate : [match]] : dotaMatches[match.beginTime.asCrazyDate]?.append(match)
//            
//        case "Overwatch":
//            
//            
//            dotaMatches.isEmpty ? dotaMatches = [match.beginTime.asCrazyDate : [match]] : dotaMatches[match.beginTime.asCrazyDate]?.append(match)
//            
//        default:
//            print("no name")
//        }
//        
//        
//        
//        print("🌹🛳⛽️\(dotaMatches)")
//    }
//    
//    
//}
//var dotaMatches : [Date: [Matches]] = [:]
//var csgoMatches : [Date: [Matches]] = [:]
//
//var pubgMatches : [Date: [Matches]] = [:]
//var overwatchMatches : [Date: [Matches]] = [:]
//var lolMatches : [Date: [Matches]] = [:]
