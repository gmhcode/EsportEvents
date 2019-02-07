//
//  CalendarTableViewCell.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/7/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//


    
import UIKit
    
    class CalendarTableViewCell: UITableViewCell {
        
        @IBOutlet weak var eventNameLabel: UILabel!
        @IBOutlet weak var eventSpaceLabel: UILabel!
        @IBOutlet weak var beginningTimeLabel: UILabel!
        @IBOutlet weak var endingTimeLabel: UILabel!
        @IBOutlet weak var profilePicture: UIImageView!
        @IBOutlet weak var doNotDisturbImage: UIImageView!
        @IBOutlet weak var eventColorBar: UIView!
        
        //    TODO need to be able to access user profile picture through event
        
        //        var event : Event? {
        //            didSet {
        //                updateViews()
        //                self.setlabels()
        //            }
        //        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            profilePicture.layer.cornerRadius = profilePicture.frame.size.width/2
            profilePicture.layer.masksToBounds = true
        }
        
        func updateViews(){
        
            
    }
}
