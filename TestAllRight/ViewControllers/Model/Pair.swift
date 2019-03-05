//
//  Pair.swift
//  TestAllRight
//
//  Created by macOS on 04.03.2019.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

enum Color : String {
    case red
    case yellow
    case gray
    case green
    
    var colorString: String {
        switch self {
        case .red: return "red"
        case .yellow: return "yellow"
        case .gray: return "gray"
        case .green: return "green"
        }
    }
}

struct Pair {
    
    var value: String
    var image: UIImage
    
    init(value : String, image : UIImage) {
        self.value = value
        self.image = image
    }
    
    static func == (firstPair: Pair, secondPair: Pair) -> Bool {
        return (firstPair.value == secondPair.value && firstPair.image == secondPair.image)
    }
    
    static func != (firstPair: Pair, secondPair: Pair) -> Bool {
        return !(firstPair.value == secondPair.value && firstPair.image == secondPair.image)
    }
}
