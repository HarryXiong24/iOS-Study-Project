//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
//    let textTitle = "⚡️FlashChat"

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        titleLabel.text = ""
//        var charIndex = 0.0
//        
//        for letter in textTitle {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false, block: { timer in
//                self.titleLabel.text?.append(letter)
//            })
//            charIndex += 1
//        }
        
        titleLabel.text = "⚡️FlashChat"
    }
    

}
