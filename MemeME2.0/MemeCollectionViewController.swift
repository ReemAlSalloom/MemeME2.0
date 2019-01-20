//
//  MemeCollectionViewController.swift
//  MemeME2.0
//
//  Created by Reem Saloom on 1/7/19.
//  Copyright © 2019 Reem AlSalloom. All rights reserved.
//


import Foundation
import UIKit


class MemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
//    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
//        flowLayout.dataSource = memes as? UI
//        let space:CGFloat = 3.0
//        let cellWidth = (view.frame.size.width - (5 * space)) / 3.0
//        let height1 = (view.frame.size.height - (5 * space)) / 3.0
//        flowLayout.minimumInteritemSpacing = space
//        flowLayout.itemSize = CGSize(width:cellWidth,height:height1)
    }
  
    var memes: [Meme]! {
        let object =  UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView?.reloadData()

    }
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.memeImageView?.image =  meme.memedImage
        cell.memeLabel?.text = memes[indexPath.row].topText + "..." + memes[indexPath.row].bottomText
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
        
    }
}
