//
//  MemeCollectionViewController.swift
//  MemeME2.0
//
//  Created by Reem Saloom on 1/7/19.
//  Copyright © 2019 Reem AlSalloom. All rights reserved.
//


import Foundation
import UIKit


class MemeCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances.
    let allMemes = Meme.allMemes
    
    // MARK: Life Cycle
    var memes: [Meme]! {
        let object =  UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return AppDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: Collection View Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allMemes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = self.allMemes[(indexPath as NSIndexPath).row]
        
        // Set the name and image ????
        cell.nameLabel.text = meme.name
        cell.memeImageView?.image = UIImage(named: meme.imageName)
        //cell.schemeLabel.text = "Scheme: \(villain.evilScheme)"
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.allMemes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
}
