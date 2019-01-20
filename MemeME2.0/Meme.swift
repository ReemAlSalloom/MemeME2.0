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
    
    init(top: String, bottom: String, img: UIImage, mImg: UIImage)
    {
        topText = top
        bottomText = bottom
        originalImage = img
        memedImage = mImg
        
    }
    

}



