//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let story = Story (title: "You see a fork in the road",
                        choice1: "Take a lef",
                        choice2: "Take a right")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = Story.title
        choice1Button.setTitle(choice1, for: .normal)
        choice2Button.setTitle(choice2, for: .normal)
    }

    @IBAction func choiceMade(_ sender: Any) {
    }
    
    func updateUI(){
        
    }
}

