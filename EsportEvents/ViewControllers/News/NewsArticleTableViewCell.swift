//
//  NewsArticleTableViewCell.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/26/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class NewsArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var flavorLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    var article: NewsArticleDictionary? {
        didSet{
            DispatchQueue.main.async {
                self.articleImageView.image = nil
                guard let article = self.article else {return}
                self.articleImageView.layer.shadowColor = #colorLiteral(red: 0.2750247121, green: 0.7252599001, blue: 0.8348675966, alpha: 1)
                self.articleImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
                self.articleImageView.layer.shadowOpacity = 1
                self.articleImageView.layer.shadowRadius = 1
                
                self.titleLabel.text = article.title
                self.flavorLabel.text = article.description
                self.backgroundColor = .black
                
                guard let url = article.urlToImage else {return}
                self.loadFromURL(urlAsString: url)
            }
        }
    }
    
    
    func loadFromURL(urlAsString: String){
        let myURL = URL(string: urlAsString)
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: myURL!){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.articleImageView.alpha = 0
                        self.articleImageView.isHidden = false
                        self.articleImageView.image = image
                        
                        self.articleImageView.layer.masksToBounds = false
                        self.articleImageView.clipsToBounds = true
                        self.articleImageView.layer.cornerRadius = self.articleImageView.frame.height / 2
                        
                        
                        UIView.animate(withDuration: 0.5, animations: {
                            self.articleImageView.alpha = 1
                        })
                    }
                }else{
                    print("Image conversion error")
                }
            }
        }
    }
    override func prepareForReuse() {
        articleImageView.image = nil
    }
}
