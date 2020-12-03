//
//  PhotoCaptureView.swift
//  LogSafe
//
//  Created by Jacob Kohn on 11/29/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import SwiftUI
 
struct PhotoCaptureView: View {
  
    @Binding var showImagePicker: Bool
    @Binding var photoImageData: Data?
  
    let cameraOrLibrary: String
    
    
  
    var body: some View {
      
        
        ImagePicker(imagePickerShown: $showImagePicker,
                    photoImageData: $photoImageData,
                    cameraOrLibrary: cameraOrLibrary)
    }
    
}

