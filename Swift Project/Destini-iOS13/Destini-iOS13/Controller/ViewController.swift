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
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initStory = storyBrain.getInitStory()
        
        storyLabel.text = initStory.title
        choice1Button.setTitle(initStory.choice1, for: .normal)
        choice2Button.setTitle(initStory.choice2, for: .normal)
    }


    @IBAction func onClick(_ sender: UIButton) {
        
        var currentChoice = sender.currentTitle!
        
        var currentStory = storyBrain.getCurrentStory(currentChoice)
        
        updateUI(currentStory: currentStory)
    }
    
    func updateUI(currentStory: Story) {
        storyLabel.text = currentStory.title
        choice1Button.setTitle(currentStory.choice1, for: .normal)
        choice2Button.setTitle(currentStory.choice2, for: .normal)
    }
}

