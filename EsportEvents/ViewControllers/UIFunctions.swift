//
//  UIFunctions.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/19/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class UIFunctions: UIViewController{
    
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
}
