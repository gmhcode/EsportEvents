//
//  CalendarTableView.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/7/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit
import JTAppleCalendar

extension CalendarViewController {
    
    //TODO: perform fetch request on datesWithEvents
    //TODO: create an event list in a Date class
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dateSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let dateSection = dateSections[section]
        
        if matchesSearch == false {
            guard let tournaments = gameAndDateSpecificTournamentsFromServer[dateSection] else { return 0 }
            return tournaments.count
        } else {
            guard let matches = gameAndDateSpecificMatches[dateSection] else {return 0}
            return matches.count
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * 0.1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameEventCell", for: indexPath) as? CalendarTableViewCell
        let dateSection = dateSections[indexPath.section]
        
        if tournySearch == true {
            
            guard let tournaments = gameAndDateSpecificTournamentsFromServer[dateSection] else { return UITableViewCell() }
            let tournament = tournaments[indexPath.row]
            cell?.tournament = tournament
            
        }
        
        if matchesSearch == true {
            
            guard let matches = gameAndDateSpecificMatches[dateSection] else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return UITableViewCell()}
            let match = matches[indexPath.row]
            cell?.match = match
        }
        
        return cell ?? UITableViewCell()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        
        
        let containerView = UIView()
        
        let separatorView = UIView(frame: CGRect(x: tableView.separatorInset.left, y: containerView.frame.height + 65, width: tableView.frame.width - tableView.separatorInset.right - tableView.separatorInset.left, height: 1))
     
        
        
        containerView.addSubview(headerLabel)
        headerLabel.backgroundColor = UIColor.clear
        headerLabel.font = UIFont(name: "Roboto-Bold", size: 14)
        headerLabel.textColor = UIColor.lightGray
        headerLabel.text = dateSections[section].asString.uppercased()
        headerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).isActive = true
        
        
        return headerLabel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "eventSegue", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        i
        if segue.identifier == "eventSegue"{
            guard let indexPath = tableView.indexPathForSelectedRow else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
            let dateSection = dateSections[indexPath.section]
            let tournaments = gameAndDateSpecificTournamentsFromServer[dateSection]
            let matches = gameAndDateSpecificMatches[dateSection]
            let destinationVC = segue.destination as? EventDescriptionViewController
            
            if tournySearch == true{
                let tournyTakeOff = tournaments?[indexPath.row]
                destinationVC?.tournament = tournyTakeOff
            }
            if matchesSearch == true{
                let matchTakeOff = matches?[indexPath.row]
                destinationVC?.match = matchTakeOff
            }
        }
    }
}



