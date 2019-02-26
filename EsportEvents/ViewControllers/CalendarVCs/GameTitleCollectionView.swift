//
//  GameTitleCollectionView.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/8/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameTitleImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameTitleCell", for: indexPath) as? GameTitleCollectionViewCell
        
        cell?.gameTitleImages = gameTitleImages[indexPath.row]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let gameCell = cell as? GameTitleCollectionViewCell else { return }
        
        
        
        
        if tournySearch == true {
            
            
            getTournaments { (allTournaments, tournaments) in
                guard let tournaments = tournaments else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                
                self.gameAndDateSpecificTournamentsFromServer = tournaments
                SourceOfTruth.shared.currentImageGameName = gameCell.gameTitleImages
                print(gameCell.gameTitleImages as Any)
                
                
                self.calendarView.scrollToDate((self.dateRange?.first)!)
            }
        }
        if matchesSearch == true{
            
            getMatches { (allMatches, matches) in
                guard let matches = matches else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                self.gameAndDateSpecificMatches = matches
                SourceOfTruth.shared.currentImageGameName = gameCell.gameTitleImages
                self.calendarView.scrollToDate((self.dateRange?.first!)!)
                self.tableView.reloadData()
            }
        }
    }
}
