//
//  ViewController.swift
//  FirstTrain
//
//  Created by mobin on 2/13/19.
//  Copyright © 2019 mobin. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate , UINavigationControllerDelegate   {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var melaNameLable: UILabel!
    @IBOutlet weak var mealName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }
    


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        textField.resignFirstResponder()
        return true
    }
    
    
    func  textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    @IBAction func buttonTesty(_ sender: UIButton) {
        melaNameLable.text = mealName.text
        melaNameLable.textColor = UIColor.red
    }
    @IBAction func selectImageFromPhotoLibarary(_ sender: UITapGestureRecognizer) {
    mealName.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
         imagePickerController.sourceType = .photoLibrary
         imagePickerController.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
         present(imagePickerController, animated: true, completion:nil)
    }
    
    func imagePickerDidCancel( sender : UIImagePickerController){
        
        dismiss(animated: true, completion: nil )
    }
    
    func imagePickerController(_picker:UIImagePickerController ,
        didFinishPickingMediaWithInfo info: [String : Any]){
    
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
}


}
