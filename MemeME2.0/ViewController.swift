//
//  ViewController.swift
//  MemeME2.0
//
//  Created by Reem Saloom on 1/6/19.
//  Copyright © 2019 Reem AlSalloom. All rights reserved.
//



import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
   // let allMemes = Meme.allMemes
    var memes: [Meme]! {
        let object =  UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        // TODO: why? memes object is already in appdelegate
        return appDelegate.memes
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        //TODO: Set the name and image ???
        cell.textLabel?.text = meme.topText
        cell.imageView?.image = meme.memedImage
        
        // If the cell has a detail label, we will put the evil scheme in. ????
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = meme.topText+".."+meme.bottomText
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    
}

