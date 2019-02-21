//
//  EventDescriptionViewController.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/12/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class EventDescriptionViewController: UIViewController {
    
    
    @IBOutlet weak var team1Image: UIButton!

    @IBOutlet weak var team2Image: UIButton!
    @IBOutlet weak var leagueImageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var numberOfGamesLabel: UILabel!
    @IBOutlet weak var beginTimeLabel: UILabel!
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var team1Label: UILabel!
    @IBOutlet weak var team2Label: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    
    
    var team1ImageGlobal : UIImage?
    var team2ImageGlobal : UIImage?{
        didSet{
            updateLabels()
        }
    }
    var statusLabelText : String = ""
    var numberOfGamesLabelText : String = ""
    var beginTimeLabelText : String = ""
    var liveLabelText : String = ""
    var leagueLabelText : String = ""
    
    var tournament : UpcomingTourny?
    var match : Match?
    var allMatchInfo : FullMatch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
        updateViews()
    }
    
    
    func updateViews(){
        if match != nil {
           fetchMatchImagesAndLabels()
        }
        UIFunctions.invisibleNavBar(navigationController: navigationController)
    }
    
    
    
    func updateLabels(){
        DispatchQueue.main.async {
            self.statusLabel.text =  self.statusLabelText
            self.numberOfGamesLabel.text =  self.numberOfGamesLabelText
            self.beginTimeLabel.text =  self.beginTimeLabelText
            self.leagueLabel.text =  self.leagueLabelText
            self.team1Label.text = self.allMatchInfo?.opponents[0].opponent.name
            self.team2Label.text = self.allMatchInfo?.opponents[1].opponent.name
            self.team1Image.setBackgroundImage(self.team1ImageGlobal, for: .normal)
            self.team2Image.setBackgroundImage(self.team2ImageGlobal, for: .normal)
            self.allMatchInfo?.winner != nil ? (self.winnerLabel.text = self.allMatchInfo?.winner?.name) : (self.winnerLabel.text = "Match Still In Progress")
            self.leagueImageView.illuminateView()
            self.team1Image.illuminateView()
            self.team2Image.illuminateView()
        }
    }
    
    
    
    func fetchMatchImagesAndLabels(){
        guard let match = match else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        let tourny = SourceOfTruth.shared.fetchTournament(from: match.tournamentId)
        let league = tourny.league
        let dispatchGroup = DispatchGroup()
        guard let imageUrl = league.imageUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        
        NetworkCall.shared.fetchImage(from: imageUrl) { (leagueImage) in
            
            DispatchQueue.main.async {
                self.leagueImageView.image = leagueImage
                
            }
            
            dispatchGroup.enter()
            NetworkCall.shared.fetchFullMatch(from: match.id, completion: { (fullMatch) in
            dispatchGroup.leave()
                
                guard let imageUrl = fullMatch?.opponents[0].opponent.image_url,
                    let imageUrl2 =  fullMatch?.opponents[1].opponent.image_url,
                    let fullMatch = fullMatch else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                
                self.statusLabelText = fullMatch.status ?? "Not Available"
                
                fullMatch.numberOfGames != nil ? (self.numberOfGamesLabelText = "\(String(describing: fullMatch.numberOfGames!))") : (self.numberOfGamesLabelText = "Not Available")
                
                match.beginTime != nil ? (self.beginTimeLabelText = "\(String(describing: match.beginTime!.dropLast(10)))" ) : (self.beginTimeLabelText = "Not Avaialable")
                
                fullMatch.live.url != nil ? (self.liveLabelText = "\(fullMatch.live.url!)") : (self.liveLabelText = "Not Available")
                
                self.allMatchInfo = fullMatch
                
                self.leagueLabelText = league.name
                
                print(imageUrl)
            
                dispatchGroup.enter()
                NetworkCall.shared.fetchImage(from: imageUrl , completion: { (leftTeamImage) in
                    self.team1ImageGlobal = leftTeamImage
                    dispatchGroup.leave()
                })
                
                dispatchGroup.enter()
                NetworkCall.shared.fetchImage(from: imageUrl2, completion: { (rightTeamImage) in
                    self.team2ImageGlobal = rightTeamImage
                    dispatchGroup.leave()
                })
            })
        }
        
        dispatchGroup.notify(queue: .main) {
            self.team1Image.imageView?.image = self.team1ImageGlobal
            self.team2Image.imageView?.image = self.team2ImageGlobal
            self.updateLabels()
        }
    }
    
    
    

    

    @IBAction func team1ButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "team1Segue", sender: nil)
    }
    @IBAction func team2ButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "team2Segue", sender: nil)
    }
    //     MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as? TeamMembersViewController
        
        if segue.identifier == "team1Segue"{
            destinationVC?.teamImage = team1ImageGlobal
            destinationVC?.teamID = allMatchInfo?.opponents[0].opponent.id
        }
        if segue.identifier == "team2Segue"{
            destinationVC?.teamImage = team2ImageGlobal
            destinationVC?.teamID = allMatchInfo?.opponents[1].opponent.id
        }
    }
}



