//
//  MenuController.swift
//  Restaurant
//
//  Created by Luis Ernesto Ochoa Rios on 9/9/18.
//  Copyright © 2018 Luis Ernesto Ochoa Rios. All rights reserved.
//

import Foundation

class MenuController {
    
    static let shared = MenuController()
    
    let baseURL = URL(string: "http://localhost:8090/")!
    
    func fetchCategories(completion: @escaping ([String]?)-> Void){
        let categoryURL = baseURL.appendingPathComponent("categories")
        //Making the Request
        let task = URLSession.shared.dataTask(with: categoryURL)
        {
            (data, response, error) in
            if let data = data,
            let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let categories = jsonDictionary?["categories"] as?
                [String] {
                completion(categories)
            } else {
                completion(nil)
            }
        }
        task.resume()
        
    }
    
    
    func fetchMenuItems(categoryName: String, completion: @escaping ([MenuItem]?)-> Void){
        let initialMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        let menuURL = components.url!
        
        //Making the Request
        let task = URLSession.shared.dataTask(with: menuURL){
            (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data){
                completion(menuItems.items) } else {
                completion(nil)
            }
        }
        task.resume()
        
    }
    
    func submitOrder(menuIds: [Int], completion: @escaping (Int?) -> Void){
        let orderURL = baseURL.appendingPathComponent("order")
        //Making the Request
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Encode the array of menu IDS into JSON
        let data: [String: [Int]] = ["menuIds": menuIds]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        
        //Data for a POST must be stored within the body of the request
        request.httpBody = jsonData
        
        //Create task for order network call
        let task = URLSession.shared.dataTask(with: request){
            (data , response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let preparationTime = try?
                    jsonDecoder.decode(PreparationTime.self, from: data){
                completion(preparationTime.prepTime)
            }else {
                completion(nil)
            }
        }
        //Begin the order Network Call
        task.resume()
        
    }
    
    

    
}
