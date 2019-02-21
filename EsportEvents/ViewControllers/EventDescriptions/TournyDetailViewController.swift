//
//  TournyDescriptionViewController.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/20/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class TournyDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tournamentNameLabel: UILabel!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    
    var tournament : UpcomingTourny?
    var leagueImagePocket : UIImage?
    var fullMatches : [FullMatch] = []
    var matchImages : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func updateViews(){
        
        fetchMatches()
        fetchLeagueImages()
        self.tournamentNameLabel.text = self.tournament?.name
        self.leagueNameLabel.text = self.tournament?.league.name
        let nibName = UINib(nibName: "TournyDetailTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "tournyCell")
        UIFunctions.invisibleNavBar(navigationController: navigationController)
    }
    
    
    
    func fetchLeagueImages() {
        
        let dispatchGroup = DispatchGroup()
        guard let imageUrl = tournament?.league.imageUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        dispatchGroup.enter()
        NetworkCall.shared.fetchImage(from: imageUrl) { (image) in
            self.leagueImagePocket = image
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            self.leagueImage.image = self.leagueImagePocket
            self.leagueImage.illuminateView()
        }
    }
    
    
    
    func fetchMatches(){
        
        let dispatchGroup = DispatchGroup()
        guard let matches = tournament?.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        for match in matches {
            dispatchGroup.enter()
            NetworkCall.shared.fetchFullMatch(from: match.id) { (fullMatch) in
                guard let fullMatch = fullMatch else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                self.fullMatches.append(fullMatch)
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    func fetchMatchImages(url: URL){
        
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        NetworkCall.shared.fetchImage(from: url) { (image) in
            guard let image = image else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
            self.matchImages.append(image)
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return fullMatches.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tournyCell", for: indexPath) as? TournyDetailTableViewCell
        let match = fullMatches[indexPath.row]
        cell?.tournamentMatch = tournament?.matches?[indexPath.row]
        cell?.match = match
        return cell ?? TournyDetailTableViewCell()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toMatchDetail", sender: nil)
    }
    
    


    // MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toMatchDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let matches = tournament?.matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
            let destinationVC = segue.destination as? EventDescriptionViewController
            let matchTakeOff = matches[indexPath.row]
            destinationVC?.match = matchTakeOff
        }
    }
}
