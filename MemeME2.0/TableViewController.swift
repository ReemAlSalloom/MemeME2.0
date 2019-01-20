//
//  ViewController.swift
//  MemeME2.0
//
//  Created by Reem Saloom on 1/6/19.
//  Copyright © 2019 Reem AlSalloom. All rights reserved.
//



import UIKit


class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
   
   // let allMemes = Meme.allMemes
    var memes: [Meme]! {
        let object =  UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        let memesCount = memes.count
        
        //if no memes created direct the user to create new meme
        if memesCount == 0 {
            let detailController = self.storyboard!.instantiateViewController(withIdentifier:
                "EditMemeViewController") as! EditMemeViewController
            self.present(detailController, animated: true, completion: nil)
        }
        return memes.count
        
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        
        cell.textLabel?.text = memes[indexPath.row].topText + "..." + memes[indexPath.row].bottomText
        cell.imageView?.image = meme.memedImage
        
        
        
        return cell
        
        
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
   
}

