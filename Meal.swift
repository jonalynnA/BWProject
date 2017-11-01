//
//  Meal.swift
//  FoodTracker
//
//  Created by Hanna Lee on 11/1/17.
//  Copyright © 2017 Hanna Lee. All rights reserved.
//

import UIKit

class Meal {
    
    //Mark: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //Mark: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // The name must not be empty.
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively.
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
