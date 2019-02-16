//
//  EventDescriptionViewController.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/12/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class EventDescriptionViewController: UIViewController {

    @IBOutlet weak var team1Image: UIImageView!
    @IBOutlet weak var team2image: UIImageView!
    @IBOutlet weak var leagueImageView: UIImageView!
    
    var tournament : UpcomingTourny?
    var match : Match?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
        updateViews()
    }
    

    func updateViews(){
        if match != nil {
           setMatchImages()
        }
    }
    func setMatchImages(){
        guard let match = match else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        let tourny = SourceOfTruth.shared.fetchTournament(from: match.tournamentId)
        let league = tourny.league
        guard let imageUrl = league.imageUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
            NetworkCall.shared.fetchImage(from: imageUrl) { (leagueImage) in
                DispatchQueue.main.async {
                self.leagueImageView.image = leagueImage
                }
                NetworkCall.shared.fetchFullMatch(from: match.id, completion: { (fullMatch) in
                    guard let imageUrl = fullMatch?.opponents[0].opponent.image_url,
                        let imageUrl2 =  fullMatch?.opponents[1].opponent.image_url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                    
                    NetworkCall.shared.fetchImage(from: imageUrl , completion: { (leftTeamImage) in
                         DispatchQueue.main.async {
                        self.team1Image.image = leftTeamImage
                        }
                    })
                    NetworkCall.shared.fetchImage(from: imageUrl2, completion: { (rightTeamImage) in
                        DispatchQueue.main.async {
                        self.team2image.image = rightTeamImage
                        }
                    })
                })
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


