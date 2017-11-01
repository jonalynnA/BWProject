//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Hanna Lee on 11/1/17.
//  Copyright © 2017 Hanna Lee. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    //MARK: Properties
    private var ratingButtons = [UIButton]()
    
    var rating = 0
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    private func setupButtons() {
        // Create button and add constraints.
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // Add click handler.
        button.addTarget(self, action:
            #selector(RatingControl.ratingButtonTapped(button:)),
            for: .touchUpInside)
        
        // Add button to the horizontal stack view.
        // This function call adds the view to the list of views managed by
        // RatingControl, which is set on the HorizontalStackView UI object.
        addArrangedSubview(button)
        
    }
    
    //Mark: Button Action
    // Need the @objc annotation so that the method is visible to #selector.
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed")
    }
}
