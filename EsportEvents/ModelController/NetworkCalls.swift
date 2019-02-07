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
        let partUrl = url.appendingPathComponent("tournaments").appendingPathComponent("upcoming").appendingPathExtension("json")
        var components = URLComponents(url: partUrl, resolvingAgainstBaseURL: true)
        let query = URLQueryItem(name: "token", value: apiKeY)
        
        components?.queryItems = [query]
        
        guard let fullUrl = components?.url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        print(fullUrl)
        
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
                completion(upComingTourny)
                
            } catch let error{
                
                print("❌ There was an error in \(#function) : ❗️\(#file) \(#line) : \(error) : \(error.localizedDescription)")
                completion(nil) ; return
            }
            
            
            
        }.resume()
    }
}
