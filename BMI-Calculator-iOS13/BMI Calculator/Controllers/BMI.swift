//
//  BMI.swift
//  BMI Calculator
//
//  Created by Harry Xiong on 2024/6/3.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct BMI {
    var value: Float
    var advice: String
    var color: UIColor
    
    init(value: Float, advice: String, color: UIColor) {
        self.value = value
        self.advice = advice
        self.color = color
    }
}
