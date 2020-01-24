//
//  Meal Controller.swift
//  FoodieFun
//
//  Created by Jonalynn Masters on 1/23/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

import Foundation


enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class MealController {
    var meals: [Meal] = []
    let baseURL = URL(string: "https://foodie-9745b.firebaseio.com/restaurant")!
    

    func getMeals(completion: @escaping ([Meal]?, Error?) -> Void = { _,_ in }) {
    let requestURL = baseURL.appendingPathExtension("json")
    print(requestURL)
    URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
        if let error = error {
            NSLog("Error fetching tasks: \(error)")
            completion(nil, error)
        }
        
        guard let data = data else {
            NSLog("No data returned from data task")
            completion(nil, nil)
            return
        }
        
        do {
            let decoder = JSONDecoder()
             let mealsDictionary = try decoder.decode([String: Meal].self, from: data)
            let meals = Array(mealsDictionary.values)
            completion(meals, nil)
        } catch {
            print("Error: \(error)")
        }
    }.resume()
}

    func put(meal: Meal, completion: @escaping (Error?) -> Void = {_ in }) {
    
        let requestURL = baseURL.appendingPathComponent("\(UUID())").appendingPathExtension("json")
    
    var request = URLRequest(url: requestURL)
    request.httpMethod = HTTPMethod.put.rawValue
    
    do {
        request.httpBody = try JSONEncoder().encode(meal)
    } catch {
        NSLog("Error encoding meal: \(error.localizedDescription)")
        completion(error)
        return
    }
    
    URLSession.shared.dataTask(with: request) { (_, _, error) in
        if let error = error {
            NSLog("Error PUTting meal: \(error.localizedDescription)")
            completion(error)
            return
        }
        completion(nil)
    }.resume()
}
}

