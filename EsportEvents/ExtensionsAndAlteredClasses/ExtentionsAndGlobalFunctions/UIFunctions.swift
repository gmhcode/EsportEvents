//
//  UIFunctions.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/19/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class UIFunctions{
    
    static func invisibleNavBar(navigationController: UINavigationController?){
        
        guard let navigationController = navigationController else { return }
        
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.view.backgroundColor = .clear
    }
    
    static func getNibCell(nibName: String, forCellReuseIdentifier: String, tableView: UITableView){
        let nibName = UINib(nibName: nibName, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: forCellReuseIdentifier)
    }
    
    static func setCellAppearance(cell: UITableViewCell){
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.6784313725, blue: 0.2117647059, alpha: 0.410932149)
        cell.selectedBackgroundView = bgColorView
    }
}
