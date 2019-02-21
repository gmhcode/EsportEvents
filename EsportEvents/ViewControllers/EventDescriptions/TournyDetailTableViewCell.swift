//
//  TournyDescriptionTableViewCell.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/20/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class TournyDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var Team1NameLabel: UILabel!
    @IBOutlet weak var Team2NameLabel: UILabel!
    
    
    var match : FullMatch? {
        didSet{
            updateViews()
        }
    }
    var tournamentMatch : Match?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func updateViews(){
        
        guard let name1 = match?.opponents[0].opponent.name,
            let name2 = match?.opponents[1].opponent.name else { return }
        
        Team1NameLabel.text = "\(name1)"
        Team2NameLabel.text = "\(name2)"
        setLabelsAppearance()
        
        
    }
    func setLabelsAppearance(){
        Team1NameLabel.illuminateView(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        Team1NameLabel.layer.shadowRadius = 17
        Team1NameLabel.layer.shadowOpacity = 3
        
        Team2NameLabel.textColor = #colorLiteral(red: 0.9921568627, green: 0.6784313725, blue: 0.2117647059, alpha: 1)
        Team2NameLabel.illuminateView(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        Team2NameLabel.layer.shadowRadius = 17
        Team2NameLabel.layer.shadowOpacity = 3
        
        
    }
}
