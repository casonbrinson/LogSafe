//
//  UtilityFunctions.swift
//  LogSafe
//
//  Created by Jacob Kohn on 11/29/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import Foundation
import SwiftUI

public func getImageFromBinaryData(binaryData: Data?, defaultFilename: String) -> Image {
   
    let uiImage = UIImage(data: binaryData!)
   
    if let imageObtained = uiImage {
       
        return Image(uiImage: imageObtained)
       
    } else {
        
        return Image(defaultFilename)
        
    }
}

