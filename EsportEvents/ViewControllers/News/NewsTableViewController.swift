//
//  NewsTableViewController.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/26/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var newsSearchBar: UISearchBar!
    var newsArticles: NewsArticles?{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLoad()
        loadViews()
        newsSearchBar.delegate = self
    }
    
    func loadViews(){
        
        UIFunctions.invisibleNavBar(navigationController: navigationController)
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0.9867876172, green: 0.2802347839, blue: 0.07607873529, alpha: 1)
        
    }
    
    
    
    func firstLoad(){
        NetworkCall.shared.fetchNews(searchTerm: "") { (articles) in
            guard let articles = articles else {return}
            self.newsArticles = articles
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        NetworkCall.shared.fetchNews(searchTerm: searchBar.text!) { (articles) in
            guard let articles = articles else {return}
            self.newsArticles = articles
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsArticles?.newsArticleDictionary.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? NewsArticleTableViewCell
        
        cell?.article = newsArticles?.newsArticleDictionary[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let newsURL = newsArticles?.newsArticleDictionary[indexPath.row].url else {return}
        if let url = URL(string: newsURL) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
