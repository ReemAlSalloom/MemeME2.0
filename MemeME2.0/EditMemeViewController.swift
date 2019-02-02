//
//  ViewController.swift
//  MemeMe
//
//  Created by Reem AlSalloom on 11/18/18.
//  Copyright © 2018 Reem AlSalloom. All rights reserved.
//

import UIKit

class EditMemeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate
{
    
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shareBtn: UIBarButtonItem!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var navigationBar : UINavigationBar!
    
    let imageController = UIImagePickerController()
    
    let memeTextAttributes:[NSAttributedString.Key: Any] = [
        NSAttributedString.Key(rawValue: NSAttributedString.Key.strokeColor.rawValue): UIColor.black,
        NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white,
        NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key(rawValue: NSAttributedString.Key.strokeWidth.rawValue): -4.0]
    
    
    func configureTextfield(textfield: UITextField, withText: String)
    {
        textfield.delegate = self
        textfield.defaultTextAttributes = memeTextAttributes
        textfield.textAlignment = .center
        textfield.text = withText
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageController.delegate = self
        topTextField.delegate = self
        bottomTextField.delegate = self
        
       
        configureTextfield(textfield: topTextField, withText: "Top Text")
        configureTextfield(textfield: bottomTextField, withText: "Bottom text ")
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Manage camera and share button when application starts
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        shareBtn.isEnabled = imageView.image != nil
        
        subscribeToKeyboardNotification()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unsubscribeToKeyboardNotification()
    }
    
    
    @IBAction func share(sender: UIButton){
        
        //generate meme
        let memedImage = generateMemedImage()
        
        //create activity controller and pass the MememedImage
        let controller = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        
        
        controller.completionWithItemsHandler = {(activity, completed, items, error) in
            if (completed) {
                self.save()
                
                self.dismiss(animated: true, completion: nil)
            }
        }
        present(controller, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        imageController.sourceType = .camera
        present(imageController, animated: true, completion: nil)
        
    }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    
    
    @IBAction func pickAnImage(_ sender: Any) {
        imageController.sourceType = .photoLibrary
        present(imageController, animated: true, completion: nil)
        
        
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        
        if let selectedImage = info[.originalImage] as? UIImage
        {
            imageView.contentMode = .scaleAspectFit
            imageView.image = selectedImage
        }
        else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        

        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
        
    }
    
    //hide/show bars
    func toggleBars(flag : Bool)
    {
        toolbar.isHidden = flag
        navigationBar.isHidden = flag
        
    }
    
    func generateMemedImage() -> UIImage {
        
        toggleBars(flag : true)
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        
        toggleBars(flag : false)
        return memedImage
        
        
    }
    
   
    
    var memes: [Meme]! {
        let object =  UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    func save() {
        
        // Create the meme
        let meme = Meme(top: topTextField.text!, bottom: bottomTextField.text!, img: imageView.image!, mImg: generateMemedImage())
        
        
        let object =  UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        
        appDelegate.memes.append(meme)
    }
    
    
    func getKeyboardHeight(_ notification: Notification) ->CGFloat
    {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        
        return keyboardSize.cgRectValue.height
    }
    
    @objc func keyboardWillShow(_ notification: Notification)
    {
        if bottomTextField.isFirstResponder {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification)
    {
        // view.frame.origin.y += getKeyboardHeight(notification)
        view.frame.origin.y = 0
    }
    
    func subscribeToKeyboardNotification()
    {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    func unsubscribeToKeyboardNotification()
    {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        topTextField.resignFirstResponder()
        bottomTextField.resignFirstResponder()
        return true
        
    }
    
    
}

