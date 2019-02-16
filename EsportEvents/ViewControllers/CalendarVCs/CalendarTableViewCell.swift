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
//        gameLogo.layer.borderWidth = 1
//        gameLogo.layer.borderColor = #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1)
//        gameLogo.layer.shadowRadius = 10
//        gameLogo.layer.shadowColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//        gameLogo.layer.shadowOpacity = 1
//        gameLogo.layer.shadowColor = CGSize(width: 0, height: 10)
        
       
//        eventNameLabel.layer.shadowOffset = CGRect(
        
        
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.selectedBackgroundView = bgColorView
        
        setUpLabels()
        
        
    }
    
    func setUpLabels(){
        
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
                gameLogo.layer.shadowRadius = 10
                gameLogo.layer.shadowColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                gameLogo.layer.shadowOpacity = 1
                eventNameLabel.layer.shadowRadius = 10
                eventNameLabel.layer.shadowColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                eventNameLabel.layer.shadowOpacity = 1
            case "PUBG":
                gameLogo.image = #imageLiteral(resourceName: "PUBG logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                gameLogo.layer.shadowRadius = 10
                gameLogo.layer.shadowColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                gameLogo.layer.shadowOpacity = 1
                eventNameLabel.layer.shadowRadius = 10
                eventNameLabel.layer.shadowColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                eventNameLabel.layer.shadowOpacity = 1
            case "CS:GO":
                gameLogo.image = #imageLiteral(resourceName: "CSGO Logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1)
                gameLogo.layer.shadowRadius = 10
                gameLogo.layer.shadowColor = #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1)
                gameLogo.layer.shadowOpacity = 1
                eventNameLabel.layer.shadowRadius = 10
                eventNameLabel.layer.shadowColor = #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1)
                eventNameLabel.layer.shadowOpacity = 1
            case "LoL":
                gameLogo.image = #imageLiteral(resourceName: "League of Legends Logo")
                eventNameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                gameLogo.layer.shadowRadius = 10
                gameLogo.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                gameLogo.layer.shadowOpacity = 1
                eventNameLabel.layer.shadowRadius = 10
                eventNameLabel.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                eventNameLabel.layer.shadowOpacity = 1
            case "Overwatch":
                gameLogo.image = #imageLiteral(resourceName: "Overwatch Logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1)
                gameLogo.layer.shadowRadius = 10
                gameLogo.layer.shadowColor = #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1)
                gameLogo.layer.shadowOpacity = 1
                eventNameLabel.layer.shadowRadius = 10
                eventNameLabel.layer.shadowColor = #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1)
                eventNameLabel.layer.shadowOpacity = 1
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
                gameLogo.layer.shadowRadius = 10
                gameLogo.layer.shadowColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                gameLogo.layer.shadowOpacity = 1
                eventNameLabel.layer.shadowRadius = 10
                eventNameLabel.layer.shadowColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                eventNameLabel.layer.shadowOpacity = 1
            case "PUBG":
                gameLogo.image = #imageLiteral(resourceName: "PUBG logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                gameLogo.layer.shadowRadius = 10
                gameLogo.layer.shadowColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                gameLogo.layer.shadowOpacity = 1
                eventNameLabel.layer.shadowRadius = 10
                eventNameLabel.layer.shadowColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                eventNameLabel.layer.shadowOpacity = 1
            case "CS:GO":
                gameLogo.image = #imageLiteral(resourceName: "CSGO Logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1)
                gameLogo.layer.shadowRadius = 10
                gameLogo.layer.shadowColor = #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1)
                gameLogo.layer.shadowOpacity = 1
                eventNameLabel.layer.shadowRadius = 10
                eventNameLabel.layer.shadowColor = #colorLiteral(red: 0.9934261441, green: 1, blue: 0, alpha: 1)
                eventNameLabel.layer.shadowOpacity = 1
            case "LoL":
                gameLogo.image = #imageLiteral(resourceName: "League of Legends Logo")
                eventNameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                gameLogo.layer.shadowRadius = 10
                gameLogo.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                gameLogo.layer.shadowOpacity = 1
                eventNameLabel.layer.shadowRadius = 10
                eventNameLabel.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                eventNameLabel.layer.shadowOpacity = 1
            case "Overwatch":
                gameLogo.image = #imageLiteral(resourceName: "Overwatch Logo")
                eventNameLabel.textColor = #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1)
                gameLogo.layer.shadowRadius = 10
                gameLogo.layer.shadowColor = #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1)
                gameLogo.layer.shadowOpacity = 1
                eventNameLabel.layer.shadowRadius = 10
                eventNameLabel.layer.shadowColor = #colorLiteral(red: 0.9882352941, green: 0.5347940396, blue: 0.06116501426, alpha: 1)
                eventNameLabel.layer.shadowOpacity = 1
            default:
                gameLogo.image = #imageLiteral(resourceName: "settings")
            }
        }
    }
}
