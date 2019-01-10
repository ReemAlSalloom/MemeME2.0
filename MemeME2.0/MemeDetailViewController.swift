//
//  MemeDetailViewController.swift
//  MemeME2.0
//
//  Created by Reem Saloom on 1/7/19.
//  Copyright © 2019 Reem AlSalloom. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var meme: Meme!
    
    // MARK: Outlets
    
   // @IBOutlet weak var imageView: UIImageView!
    //@IBOutlet weak var label: UILabel!
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.label.text = self.meme.name
        self.tabBarController?.tabBar.isHidden = true
        self.imageView!.image = UIImage(named: meme.imageName)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
