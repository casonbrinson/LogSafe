//
//  ImagePicker.swift
//  LogSafe
//
//  Created by Jacob Kohn on 11/29/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import Foundation
import SwiftUI

// Global variable
var pickedImage = UIImage()


let thumbnailImageWidth: CGFloat = 500.0
let thumbnailImageHeight: CGFloat = 500.0

/*
********************************
MARK: - Image Picker Coordinator
********************************
*/
class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
   
 
   @Binding var imagePickerShown: Bool
   @Binding var photoImageData: Data?
 
   init(imagePickerShown: Binding<Bool>, photoImageData: Binding<Data?>) {
       _imagePickerShown = imagePickerShown
       _photoImageData = photoImageData
   }
 
   
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
       if let editedImage = info[.editedImage] as? UIImage {
           pickedImage = editedImage
       } else if let originalImage = info[.originalImage] as? UIImage {
           pickedImage = originalImage
       } else {
           photoImageData = nil
           return
       }

       let thumbnailImage = pickedImage.scale(toSize: CGSize(width: thumbnailImageWidth, height: thumbnailImageHeight))
     
       if let thumbnailData = thumbnailImage.jpegData(compressionQuality: 1.0) {
           
           photoImageData = thumbnailData
       } else {
           photoImageData = nil
       }
     
       
       imagePickerShown = false
         
   }
 
   func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       
     
       // To cancel close it
       imagePickerShown = false
     
       picker.dismiss(animated: true, completion: nil)
   }
 
}

/*
*************************************************
MARK: - Image Picker from Camera or Photo Library
*************************************************
*/
struct ImagePicker: UIViewControllerRepresentable {
 
   @Binding var imagePickerShown: Bool
   @Binding var photoImageData: Data?
   let cameraOrLibrary: String
 
   func makeCoordinator() -> ImagePickerCoordinator {
       return ImagePickerCoordinator(imagePickerShown: $imagePickerShown, photoImageData: $photoImageData)
   }
 
   func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
     
       let imagePickerController = UIImagePickerController()
     
       if cameraOrLibrary == "Camera" {
           imagePickerController.sourceType = .camera
       } else {
           imagePickerController.sourceType = .photoLibrary
       }
     
       imagePickerController.allowsEditing = true
       imagePickerController.mediaTypes = ["public.image"]
     
       imagePickerController.delegate = context.coordinator
     
       return imagePickerController
   }
 
   func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
       // Unused
   }
 
}

/*
---------------------------------------------
MARK: - Extension Methods to Resize a UIImage
---------------------------------------------
*/

// Resize a UIImage proportionately without distorting it
extension UIImage {
 
   func scale(toSize newSize:CGSize) -> UIImage {
       
       let aspectFill = self.size.resizeFill(toSize: newSize)
     
       UIGraphicsBeginImageContextWithOptions(aspectFill, false, 0.0);
       self.draw(in: CGRect(origin: .zero, size: CGSize(width: aspectFill.width, height: aspectFill.height)))
       let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
       UIGraphicsEndImageContext()
     
       return newImage
   }
}

extension CGSize {
 
   func resizeFill(toSize: CGSize) -> CGSize {
       let scale : CGFloat = (self.height / self.width) < (toSize.height / toSize.width) ? (self.height / toSize.height) : (self.width / toSize.width)
       return CGSize(width: (self.width / scale), height: (self.height / scale))
   }
}
