//
//  CardModel.swift
//  JBees
//
//  Created by Gobias LTD on 09/09/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//


import SwiftUI

// MARK: -CARD MODEL

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
//    var message: String
//    var gradientColors: [Color]
    
}
