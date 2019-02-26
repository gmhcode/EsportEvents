//
//  CalendarTableViewCell.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/7/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//



import UIKit

class CalendarTableViewCell: UITableViewCell {
    //
    @IBOutlet weak var gameLogo: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var gameNameLabel: UILabel!
    
    
    var tournament : UpcomingTourny?{
        didSet{
            updateViews()
        }
    }
    var match : Match?{
        didSet {
            updateViews()
        }
    }
    var headerGameName = SourceOfTruth.shared.currentImageGameName
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func updateViews(){
        
        UIFunctions.setCellAppearance(cell: self)
        
        setUpLabels()
        
    }
    
    func setUpLabels(){
        gameNameLabel.text = SourceOfTruth.shared.currentImageGameName
        if match != nil {
            
            if match?.name == nil {
                eventNameLabel.text = match?.slug
            } else {
                eventNameLabel.text = match?.name
                
            }
            switch SourceOfTruth.shared.currentImageGameName {
            case "Dota 2":
                gameLogo.image = #imageLiteral(resourceName: "Dota Logo")
                eventNameLabel.textColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                gameLogo.illuminateView(color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
                eventNameLabel.illuminateView(color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
                gameNameLabel.illuminateView(color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
                gameLogo.layer.shadowRadius = 10
            case "PUBG":
                gameLogo.image = #imageLiteral(resourceName: "PUBG logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                gameLogo.illuminateView(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
                eventNameLabel.illuminateView(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
                gameNameLabel.illuminateView(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
                 gameLogo.layer.shadowRadius = 10
            case "CS:GO":
                gameLogo.image = #imageLiteral(resourceName: "CSGO Logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1)
                gameLogo.illuminateView(color: #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1))
                eventNameLabel.illuminateView(color: #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1))
                gameNameLabel.illuminateView(color: #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1))
                gameLogo.layer.shadowRadius = 10
                
            case "LoL":
                gameLogo.image = #imageLiteral(resourceName: "League of Legends Logo")
                eventNameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                gameLogo.illuminateView(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                eventNameLabel.illuminateView(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                gameNameLabel.illuminateView(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                gameLogo.layer.shadowRadius = 10
                
            case "Overwatch":
                gameLogo.image = #imageLiteral(resourceName: "Overwatch Logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1)
                gameLogo.illuminateView(color: #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1))
                eventNameLabel.illuminateView(color: #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1))
                gameNameLabel.illuminateView(color: #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1))
                gameLogo.layer.shadowRadius = 10
               
            default:
                gameLogo.image = #imageLiteral(resourceName: "settings")
            }
            
        } else {
            
            if tournament?.name == nil{
                eventNameLabel.text = tournament?.slug
            } else {
                
                eventNameLabel.text = tournament?.name
            }
            
            switch tournament?.videoGame.name {
            case "Dota 2":
                gameLogo.image = #imageLiteral(resourceName: "Dota Logo")
                eventNameLabel.textColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                gameLogo.illuminateView(color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
                eventNameLabel.illuminateView(color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
                gameNameLabel.illuminateView(color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
                gameLogo.layer.shadowRadius = 10
            case "PUBG":
                gameLogo.image = #imageLiteral(resourceName: "PUBG logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                gameLogo.illuminateView(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
                eventNameLabel.illuminateView(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
                gameNameLabel.illuminateView(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
                gameLogo.layer.shadowRadius = 10
            case "CS:GO":
                gameLogo.image = #imageLiteral(resourceName: "CSGO Logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1)
                gameLogo.illuminateView(color: #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1))
                eventNameLabel.illuminateView(color: #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1))
                gameNameLabel.illuminateView(color: #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1))
                gameLogo.layer.shadowRadius = 10
            case "LoL":
                gameLogo.image = #imageLiteral(resourceName: "League of Legends Logo")
                eventNameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                gameLogo.illuminateView(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                eventNameLabel.illuminateView(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                gameNameLabel.illuminateView(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                gameLogo.layer.shadowRadius = 10
            case "Overwatch":
                gameLogo.image = #imageLiteral(resourceName: "Overwatch Logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1)
                gameLogo.illuminateView(color: #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1))
                eventNameLabel.illuminateView(color: #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1))
                gameNameLabel.illuminateView(color: #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1))
                gameLogo.layer.shadowRadius = 10
            default:
                gameLogo.image = #imageLiteral(resourceName: "Overwatch Logo")
            }
        }
    }
}
