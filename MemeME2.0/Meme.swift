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
  
        var topText: String!
        var bottomText: String!
        var originalImage:UIImage!
        var memedImage: UIImage!
    
    init()
    {}
    
    func save() {
        // TODO: Create meme, do I need to call this save() here or use it in EditMemeViewController
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imageView.image!, memedImage: generateMemedImage())
    }
    
   
}

//TODO: when do I need extension?
extension Meme {
    
    static var allMemes: [Meme] {
        
        
}
}
