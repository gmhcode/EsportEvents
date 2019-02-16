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
//         UIApplication.shared.beginIgnoringInteractionEvents()
//        func initialFetch(completion: @escaping ([Date:[UpcomingTourny]]?) -> Void) {
//
//
//
//            NetworkCall.shared.fetchTournaments { (fetchedTournaments) in
//
//                    guard let fetchedTournaments = fetchedTournaments else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
//
//                SourceOfTruth.shared.populateTournamentIdsAndTeams(from: fetchedTournaments)
//
//                    var allTournaments: [Date: [UpcomingTourny]] = [:]
//                    var tournaments: [Date: [UpcomingTourny]] = [:]
//
//
//                    if fetchedTournaments.isEmpty == false {
//                        //print("🔥❇️\(fetchedTournaments)")
//                        for tournament in fetchedTournaments{
//                            //print("🌞🍄\(tournament)")
//
//                            guard let tournamentDate = tournament.beginTime?.asCrazyDate
//                                else { continue }
//                            //print("  ❌🔥🤥 \(tournamentDateStringPre)")
//                            if tournaments.keys.contains(tournamentDate){
//
//                                tournaments[tournamentDate]?.append(tournament)
//
//                            } else {
//
//                                    tournaments[tournamentDate] = [tournament]
//                            }
//                        }
//                        SourceOfTruth.shared.everyTournament = tournaments
//                        SourceOfTruth.shared.filterTournyByGameName(tournaments: yes)
//                        completion(tournaments)
//                        //print(tournaments)
//
//                }
//            }
//        }
        
//        initialFetch { (yes) in
//            guard let yes = yes else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
//
//            
//            
//        }
    }
}
