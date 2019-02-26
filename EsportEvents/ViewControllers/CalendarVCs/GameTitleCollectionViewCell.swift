//
//  GameTitleCollectionViewCell.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/8/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class GameTitleCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var gameNameLabel: UILabel!
    
    var gameTitleImages : String?{
        didSet{
            updateViews()
        }
    }
    
    
    func updateViews(){
        
        switch gameTitleImages {
        case "Dota 2":
            
            gameNameLabel.text = "Dota 2"
            gameNameLabel.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            
        case "PUBG":
            gameNameLabel.text = "PUBG"
            gameNameLabel.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            
        case "CS:GO":
            gameNameLabel.text = "CS:GO"
            gameNameLabel.layer.borderColor = #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1)
            
        case "LoL":
            gameNameLabel.text = "LoL"
            gameNameLabel.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            
        case "Overwatch":
            gameNameLabel.text = "Overwatch"
            gameNameLabel.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            
        default:
            gameNameLabel.text = "Not Available"
        }
    }
}
