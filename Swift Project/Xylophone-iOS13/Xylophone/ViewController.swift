//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(resource: String, format: String = "wav") {
        let url = Bundle.main.url(forResource: resource, withExtension: format)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
    @IBAction func KeyPressed(_ sender: UIButton) {
    
        
        playSound(resource: sender.currentTitle!)
    }
}

