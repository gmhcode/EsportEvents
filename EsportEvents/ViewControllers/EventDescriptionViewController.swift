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
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var numberOfGamesLabel: UILabel!
    @IBOutlet weak var beginTimeLabel: UILabel!
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var liveLabel: UIButton!
    
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
            self.liveLabel.setTitle(self.liveLabelText, for: .normal)
            self.leagueLabel.text =  self.leagueLabelText
            self.leagueImageView.illuminateView()
            self.team1Image.image = self.team1ImageGlobal
            self.team2image.image = self.team2ImageGlobal
            self.team1Image.illuminateView()
            self.team2image.illuminateView()
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
            self.team1Image.image = self.team1ImageGlobal
            self.team2image.image = self.team2ImageGlobal
            self.updateLabels()
        }
    }
    
    @IBAction func urlButtonTapped(_ sender: Any) {
        if let url = NSURL(string: "http://...") {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    
    
//    func illuminateView(view : UIView){
//        view.layer.shadowRadius = 5
//        view.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        view.layer.shadowOpacity = 1
//    }
    
}

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


