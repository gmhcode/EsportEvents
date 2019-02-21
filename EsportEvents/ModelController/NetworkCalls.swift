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
                
                let upComingTourny = try JSONDecoder().decode([UpcomingTourny].self, from: data)
                
                SourceOfTruth.shared.UpcomingTounaments = upComingTourny
                completion(upComingTourny)
                
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
    
//    func fetchTeamImages(id: String, completion: @escaping ([UIImage]?) -> ()){
//        
//        guard let baseUrl = baseUrl else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}
//        let url = baseUrl.appendingPathComponent("teams").appendingPathComponent(id).appendingPathExtension("json")
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
//        let query = URLQueryItem(name: "token", value: apiKeY)
//        
//        components?.queryItems = [query]
//        guard let fullUrl = components?.url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}
//        
//        var request = URLRequest(url: fullUrl)
//        request.httpBody = nil
//        request.httpMethod = "GET"
//        
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
//                completion(nil)
//                return
//            }
//            
//            guard let data = data  else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}
//            
//            let images = UIImage(data: data)
//            
//        }
//    }
}

