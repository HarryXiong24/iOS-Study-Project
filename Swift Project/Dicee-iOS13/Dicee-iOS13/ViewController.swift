//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBOutlet weak var diceImageView3: UIImageView!
    
    
    @IBOutlet weak var diceImageView4: UIImageView!
    
    let imageList: [UIImage] = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"), UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix")].compactMap { $0 }
    
    var leftDiceNumber: Int!
    var rightDiceNumber: Int!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceImageView1.image = UIImage(imageLiteralResourceName: "DiceOne")
        diceImageView2.image = UIImage(imageLiteralResourceName: "DiceSix")
        diceImageView3.image = UIImage(imageLiteralResourceName: "DiceOne")
        diceImageView4.image = UIImage(imageLiteralResourceName: "DiceSix")
        
        leftDiceNumber = 1
        rightDiceNumber = imageList.count - 2
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("Button got tapped.")
        
        
        diceImageView1.image = imageList[leftDiceNumber]
        
        diceImageView2.image = imageList[rightDiceNumber]
        
        leftDiceNumber += 1
        rightDiceNumber -= 1
        
        if (leftDiceNumber >= imageList.count) {
            leftDiceNumber = 0
        }
        
        if (rightDiceNumber < 0) {
            rightDiceNumber = imageList.count - 1
        }
        
        
        diceImageView3.image = imageList.randomElement()
        
        diceImageView4.image = imageList[Int.random(in: 0...5)]

    }


}

