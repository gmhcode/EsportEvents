//
//  TeamMembersTableViewController.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/20/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class TeamMembersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var teamImageView: UIImageView!
    var teamImage : UIImage?
    var teamID : Int?
    var team : Team? {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.teamNameLabel.text = self.team?.name
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        updateViews()
        
    }
    
    
    func updateViews(){
        fetchTeam()
        teamImageView.image = teamImage
        teamImageView.illuminateView(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }
    func fetchTeam(){
        guard let teamID = teamID else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}

        NetworkCall.shared.fetchTeam(id: teamID) { (team) in
            self.team = team
        }
    }
    
    
    
    

    // MARK: - Table view data source

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        guard let players = team?.players else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return 0}

        
        
        return players.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? TeamMemberTableViewCell
        guard let player = team?.players[indexPath.row] else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return TeamMemberTableViewCell()}
        
        cell?.player = player
        


        return cell ?? TeamMemberTableViewCell()
    }
 

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 200
    }

}
