//
//  PrintActivity.swift
//  LogSafe
//
//  Created by Jacob Kohn on 12/2/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

let activityViewController = ActivityViewControllerRepresentable()

class ActivityViewController: UIViewController {

   var uiImage: UIImage!

   @objc func shareImage() {
       let activityViewController = UIActivityViewController(activityItems: [uiImage!], applicationActivities: nil)
    activityViewController.excludedActivityTypes =  [
           UIActivity.ActivityType.assignToContact,    // Exclude assigning the image to a contact.
           UIActivity.ActivityType.addToReadingList    // Exclude adding the image to Safari’s reading list.
       ]
       present(activityViewController, animated: true, completion: nil)
       activityViewController.popoverPresentationController?.sourceView = self.view
   }
}

struct ActivityViewControllerRepresentable: UIViewControllerRepresentable {

   let activityViewController = ActivityViewController()

   func makeUIViewController(context: Context) -> ActivityViewController {
       activityViewController
   }
   func updateUIViewController(_ uiViewController: ActivityViewController, context: Context) {
       // Unused
   }
   func shareImage(uiImage: UIImage) {
       activityViewController.uiImage = uiImage
       activityViewController.shareImage()
   }
}
