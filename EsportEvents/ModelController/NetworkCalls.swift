//
//  NetworkCalls.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/6/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class NetworkCall{
    
    static var shared = NetworkCall()
    
    
    let baseUrl = URL(string: "https://api.pandascore.co/")
    let apiKeY = "k-uzeymiPYFtzJhwfGiRZpSC5Ag4SP99pUgB0NF6yuPou3iKtAg"
    
    
    
    func fetchTournaments(completion: @escaping ([UpcomingTourny]?) -> ()){
        
        guard let url = baseUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        let partUrl = url.appendingPathComponent("tournaments").appendingPathExtension("json")
        var components = URLComponents(url: partUrl, resolvingAgainstBaseURL: true)
        let query = URLQueryItem(name: "token", value: apiKeY)
        components?.queryItems = [query]
        
        guard let fullUrl = components?.url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        var request = URLRequest(url: fullUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); completion(nil) ; return}
            
            do{
                
                let tournaments = try JSONDecoder().decode([UpcomingTourny].self, from: data)
                
                SourceOfTruth.shared.UpcomingTounaments.append(contentsOf: tournaments)
                completion(tournaments)
                
            } catch let error{
                
                print("❌ There was an error in \(#function) : ❗️\(#file) \(#line) : \(error) : \(error.localizedDescription)")
                completion(nil) ; return
            }
            }.resume()
    }
    
    
    func fetchOverwatchTournaments(completion: @escaping ([UpcomingTourny]?) -> ()){
        
        
        
        guard let url = baseUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        let partUrl = url.appendingPathComponent("ow").appendingPathComponent("tournaments")
//            .appendingPathExtension("json")
        var components = URLComponents(url: partUrl, resolvingAgainstBaseURL: true)
        let query = URLQueryItem(name: "token", value: apiKeY)
        let query2 = URLQueryItem(name: "per_page", value: "15.json")
        components?.queryItems = [query2, query]
        print("components  🔥\(String(describing: components?.url))")
        guard let fullUrl = components?.url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        
        var request = URLRequest(url: fullUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); completion(nil) ; return}
            
            do{
                
                let tournaments = try JSONDecoder().decode([UpcomingTourny].self, from: data)
                
                SourceOfTruth.shared.UpcomingTounaments.append(contentsOf: tournaments)
                completion(tournaments)
                
            } catch let error{
                
                print("❌ There was an error in \(#function) : ❗️\(#file) \(#line) : \(error) : \(error.localizedDescription)")
                completion(nil) ; return
            }
            }.resume()
    }
    
    func fetchLoLTournaments(completion: @escaping ([UpcomingTourny]?) -> ()){
        
        guard let url = baseUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        let partUrl = url.appendingPathComponent("lol").appendingPathComponent("tournaments").appendingPathExtension("json")
        var components = URLComponents(url: partUrl, resolvingAgainstBaseURL: true)
        let query = URLQueryItem(name: "token", value: apiKeY)
        let query2 = URLQueryItem(name: "per_page", value: "15.json")
        components?.queryItems = [query2, query]
        
        guard let fullUrl = components?.url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        var request = URLRequest(url: fullUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); completion(nil) ; return}
            
            do{
                
                let tournaments = try JSONDecoder().decode([UpcomingTourny].self, from: data)
                
                SourceOfTruth.shared.UpcomingTounaments.append(contentsOf: tournaments)
                completion(tournaments)
                
            } catch let error{
                
                print("❌ There was an error in \(#function) : ❗️\(#file) \(#line) : \(error) : \(error.localizedDescription)")
                completion(nil) ; return
            }
            }.resume()
    }
    
    func fetchDota2Tournaments(completion: @escaping ([UpcomingTourny]?) -> ()){
        
        guard let url = baseUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        let partUrl = url.appendingPathComponent("dota2").appendingPathComponent("tournaments").appendingPathExtension("json")
        var components = URLComponents(url: partUrl, resolvingAgainstBaseURL: true)
        let query = URLQueryItem(name: "token", value: apiKeY)
        let query2 = URLQueryItem(name: "per_page", value: "15.json")
        components?.queryItems = [query2, query]
        
        guard let fullUrl = components?.url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        var request = URLRequest(url: fullUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); completion(nil) ; return}
            
            do{
                
                let tournaments = try JSONDecoder().decode([UpcomingTourny].self, from: data)
                
                SourceOfTruth.shared.UpcomingTounaments.append(contentsOf: tournaments)
                completion(tournaments)
                
            } catch let error{
                
                print("❌ There was an error in \(#function) : ❗️\(#file) \(#line) : \(error) : \(error.localizedDescription)")
                completion(nil) ; return
            }
            }.resume()
    }
    
    func fetchCSGOTournaments(completion: @escaping ([UpcomingTourny]?) -> ()){
        
        guard let url = baseUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        let partUrl = url.appendingPathComponent("csgo").appendingPathComponent("tournaments").appendingPathExtension("json")
        var components = URLComponents(url: partUrl, resolvingAgainstBaseURL: true)
        let query = URLQueryItem(name: "token", value: apiKeY)
        let query2 = URLQueryItem(name: "per_page", value: "15.json")
        components?.queryItems = [query2, query]
        
        guard let fullUrl = components?.url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        var request = URLRequest(url: fullUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); completion(nil) ; return}
            
            do{
                
                let tournaments = try JSONDecoder().decode([UpcomingTourny].self, from: data)
                
                SourceOfTruth.shared.UpcomingTounaments.append(contentsOf: tournaments)
                completion(tournaments)
                
            } catch let error{
                
                print("❌ There was an error in \(#function) : ❗️\(#file) \(#line) : \(error) : \(error.localizedDescription)")
                completion(nil) ; return
            }
            }.resume()
    }
    
    
    
    func fetchPUBGTournaments(completion: @escaping ([UpcomingTourny]?) -> ()){
        
        
        
        guard let url = baseUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        let partUrl = url.appendingPathComponent("pubg").appendingPathComponent("tournaments")
        //            .appendingPathExtension("json")
        var components = URLComponents(url: partUrl, resolvingAgainstBaseURL: true)
        let query = URLQueryItem(name: "token", value: apiKeY)
        let query2 = URLQueryItem(name: "per_page", value: "15.json")
        components?.queryItems = [query2, query]
        print("components  🔥\(String(describing: components?.url))")
        guard let fullUrl = components?.url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        
        var request = URLRequest(url: fullUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); completion(nil) ; return}
            
            do{
                
                let tournaments = try JSONDecoder().decode([UpcomingTourny].self, from: data)
                
                SourceOfTruth.shared.UpcomingTounaments.append(contentsOf: tournaments)
                completion(tournaments)
                
            } catch let error{
                
                print("❌ There was an error in \(#function) : ❗️\(#file) \(#line) : \(error) : \(error.localizedDescription)")
                completion(nil) ; return
            }
            }.resume()
    }
    
    
    
    
    
    
    
    func fetchImage(from URL: URL, completion: @escaping ((UIImage?) -> Void)){
        URLSession.shared.dataTask(with: URL) { (data, response, error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            guard let myData = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
            
            let image = UIImage(data: myData)
            completion(image)
            
            }.resume()
    }
    
    
    
    func fetchFullMatch(from ID: Int, completion: @escaping (FullMatch?)->Void){
        guard let baseUrl = baseUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        let partUrl = baseUrl.appendingPathComponent("matches").appendingPathComponent("\(ID)").appendingPathExtension("json")
        
        var components = URLComponents(url: partUrl, resolvingAgainstBaseURL: true)
        let query = URLQueryItem(name: "token", value: apiKeY )
        components?.queryItems = [query]
        
        guard let fullUrl = components?.url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        print("❌🔥⚡️full Url\(fullUrl)")
        var request = URLRequest(url: fullUrl)
        request.httpBody = nil
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
            
            do {
                
                let match = try JSONDecoder().decode(FullMatch.self, from: data)
                completion(match)
                
            } catch let error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
        }.resume()
    }
    
    
    
    func fetchTeam(id: Int, completion: @escaping (Team?) -> ()){
        
        guard let baseUrl = baseUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}

        let url = baseUrl.appendingPathComponent("teams").appendingPathComponent("\(id)").appendingPathExtension("json")
        
        let query = URLQueryItem(name: "token", value: apiKeY)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [query]
        
        guard let fullUrl = components?.url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}

        
        var request = URLRequest(url: fullUrl)
        request.httpBody = nil
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}
            do{
                let team = try JSONDecoder().decode(Team.self, from: data)
                completion(team)
            } catch{
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription)")
                completion(nil)
                return
            }
        }.resume()
    }
    
    
    
    
    func fetchNews(searchTerm: String, completion: @escaping (NewsArticles?) -> Void){
        let baseUrl = "https://newsapi.org/v2/everything?"
        var esports = "+esports"
        if searchTerm == "" || searchTerm == " "{
            esports = "esports"
        }
        let topic = "q=\(searchTerm.replacingOccurrences(of: " ", with: "-"))\(esports)&"
        let sort = "sortBy=popularity&"
        let language = "language=en&"
        let newsApiKey = "apiKey=9af671eb7b56478a93b3e6d2b53fcbe6"
        let newsApi = "\(baseUrl)\(topic)\(language)\(sort)\(newsApiKey)"
        print(newsApi)
        let url = URL(string: newsApi)
        URLSession.shared.dataTask(with: url!) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(#function) \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            
            do{
                let articles = try JSONDecoder().decode(NewsArticles.self, from: data)
                completion(articles)
            }catch let error{
                print("Error fetching game \(error) \(error.localizedDescription)")
                completion(nil);return
            }
            }.resume()
    }
    
    
    
    
    func fetchTeamImages(id: String, completion: @escaping ([UIImage]?) -> ()){

        guard let baseUrl = baseUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}
        let url = baseUrl.appendingPathComponent("teams").appendingPathComponent(id).appendingPathExtension("json")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let query = URLQueryItem(name: "token", value: apiKeY)
    
        components?.queryItems = [query]
        guard let fullUrl = components?.url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}
    
        var request = URLRequest(url: fullUrl)
        request.httpBody = nil
        request.httpMethod = "GET"
    
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
    
            guard let data = data  else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}
            
            var teamPlaceholder: Team?
            let jsonDecoder = JSONDecoder()
            do {
                let team = try jsonDecoder.decode(Team.self, from: data)
                teamPlaceholder = team
                
            } catch {
                // Handle error
            }
            
            let imageURLs = teamPlaceholder?.players.compactMap { $0.imageUrl }
            let dispatchGroup = DispatchGroup()
            var images: [UIImage] = []
            imageURLs?.forEach {
                dispatchGroup.enter()
                URLSession.shared.dataTask(with: $0, completionHandler: { (data, _, error) in
                    if let error = error {
                        print("There was an error fetching the image: \(error)")
                    }
                    
                    if let data = data {
                        if let image = UIImage(data: data) {
                            images.append(image)
                        }
                    }
                    dispatchGroup.leave()
                
                }).resume()
                
            }
            dispatchGroup.notify(queue: .main, execute: {
                completion(images)
            })
        }
    }
}

