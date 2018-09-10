//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Luis Ernesto Ochoa Rios on 9/9/18.
//  Copyright © 2018 Luis Ernesto Ochoa Rios. All rights reserved.
//

import Foundation

struct Categories: Codable{
    let categories: [String]
}

struct PreparationTime: Codable{
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey{
        case prepTime = "preparation_time"
    }
}

