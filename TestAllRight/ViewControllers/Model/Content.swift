//
//  Content.swift
//  TestAllRight
//
//  Created by macOS on 04.03.2019.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class Content: NSObject {
    var answers: [String] = ["a stomach-ache", "a temperature" , "a cold" , "a backache" , "a toothache" , "an earache" , "a cough" , "a headache"]
    
    var images: [UIImage] = [UIImage(named: "Image")! , UIImage(named: "Image1")! , UIImage(named: "Image2")! , UIImage(named: "Image3")! , UIImage(named: "Image4")! , UIImage(named: "Image5")! , UIImage(named: "Image6")! , UIImage(named: "Image7")!]
    
    let pair0 = Pair(value: "a stomach-ache", image: UIImage(named: "Image")!)
    let pair1 = Pair(value: "a backache", image: UIImage(named: "Image1")!)
    let pair2 = Pair(value: "an earache", image: UIImage(named: "Image2")!)
    let pair3 = Pair(value: "a toothache", image: UIImage(named: "Image3")!)
    let pair4 = Pair(value: "a headache", image: UIImage(named: "Image4")!)
    let pair5 = Pair(value: "a temperature", image: UIImage(named: "Image5")!)
    let pair6 = Pair(value: "a cough", image: UIImage(named: "Image6")!)
    let pair7 = Pair(value: "a cold", image: UIImage(named: "Image7")!)
    
    var aceptedPairs : [Pair] = []
    
    override init() {
         self.aceptedPairs = [pair0, pair1, pair2, pair3, pair4, pair5, pair6, pair7]
    }
    
    

    


}
