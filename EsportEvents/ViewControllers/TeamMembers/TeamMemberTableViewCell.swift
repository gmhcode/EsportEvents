//
//  TeamMemberTableViewCell.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/20/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class TeamMemberTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var homeTownLabel: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    

    
    var player : Players?{
        didSet {
            updateViews()
        }
    }
    
    func updateViews(){
        
        guard let player = player else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}

        
        nameLabel.text = "Name: \(player.name)"
        if player.firstName != nil && player.lastName != nil {
           fullNameLabel.text = "Full Name: \(String(describing: player.firstName!)) \(String(describing: player.lastName!))"
        }
        if player.hometown != nil {
            homeTownLabel.text = "Country/Town: \(player.hometown!)"
        }
        playerImage.illuminateView()
        fetchImage()
        
    }
    
    func fetchImage(){
        guard let image = player?.imageUrl else {
            print("❇️♊️>>>\(#file) \(#line): guard let failed<<<")
            return
        }
        NetworkCall.shared.fetchImage(from: image) { (image) in
            DispatchQueue.main.async {
                
                if image != nil {
                    self.playerImage.image = image
                }
            }
        }
    }
    
    
    
}
