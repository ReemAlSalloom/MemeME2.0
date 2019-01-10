//
//  Meme.swift
//  MemeME2.0
//
//  Created by Reem Saloom on 1/7/19.
//  Copyright © 2019 Reem AlSalloom. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    
    // MARK: Properties
    
    let name: String
    let evilScheme: String
    let imageName: String
    
  
        var topText: String!
        var bottomText: String!
        var originalImage:UIImage!
        var memedImage: UIImage!
    
    init()
    {}
    
    func save() {
        // Create meme
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imageView.image!, memedImage: generateMemedImage())
    }
    
   
}
extension Meme {
    
    // Generate an array full of all of the villains
    static var allMemes: [Meme] {
        
        var memeArray = [Meme]()
        
        for d in Meme.localMemeData() {
            memeArray.append(Meme(dictionary: d))
        }
        
        return memeArray
}
}
