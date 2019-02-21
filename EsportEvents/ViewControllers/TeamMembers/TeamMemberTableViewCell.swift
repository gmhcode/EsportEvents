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
    @IBOutlet weak var noImageAvailableLabel: UILabel!
    

    
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
        } else{
            fullNameLabel.text = "Full Name: Unknown)"
        }
        
        if player.hometown != nil {
            homeTownLabel.text = "Country/Town: \(player.hometown!)"
        }else {
            homeTownLabel.text = "Country/Town: Unknown"
        }
        fetchImage()
        playerImage.illuminateView(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        UIFunctions.setCellAppearance(cell: self)
       
        
    }
    
    func fetchImage(){
        guard let image = player?.imageUrl else {
            print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); self.noImageAvailableLabel.isHidden = false;
            return
        }
        NetworkCall.shared.fetchImage(from: image) { (image) in
            DispatchQueue.main.async {
                
                if image != nil {
                    self.playerImage.image = image
                    self.noImageAvailableLabel.isHidden = true
                } else {
                    
                }
            }
        }
    }
}
