//
//  Meal.swift
//  FoodTracker
//
//  Created by Jonalynn Masters on 1/19/2020.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

import Foundation


class Meal: NSObject, Codable {
    
    //Mark: Properties
    var restaurantName: String
    var location: String
    var hours: String
    var foodieReview: String
    var foodOrdered: String
    //var photo: Data?
    var rating: Int
        
    init(restaurantName: String, location: String, hours: String, foodieReview: String, foodOrdered: String, rating: Int) {
        
        self.restaurantName = restaurantName
        self.location = location
        self.hours = hours
        self.foodieReview = foodieReview
        self.foodOrdered = foodOrdered
        self.rating = rating
        
        
    }
    
}
      
    
