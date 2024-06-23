//
//  CoinData.swift
//  ByteCoin
//
//  Created by Harry Xiong on 2024/6/8.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Decodable {
    
    //Because it's a decimal number, we'll give it a Double data type.
    let rate: Double
}
