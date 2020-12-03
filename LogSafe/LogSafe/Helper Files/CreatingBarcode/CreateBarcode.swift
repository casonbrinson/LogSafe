//
//  CreateBarcode.swift
//  LogSafe
//
//  Created by Jacob Kohn on 12/2/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import UIKit
import Foundation

public func createBarcode(from stringValue: String, type barcodeType: String, scaleFactor scale: CGFloat) -> UIImage? {
 
    let data = stringValue.data(using: String.Encoding.ascii)

    
    if let ciFilter = CIFilter(name: barcodeType) {
       
        ciFilter.setDefaults()
        ciFilter.setValue(data, forKey: "inputMessage")
        
        let factorByWhichToScale = CGAffineTransform(scaleX: scale, y: scale)
        
        if let output = ciFilter.outputImage?.transformed(by: factorByWhichToScale) {
           
            let ciContext: CIContext = CIContext.init(options: nil)
            let cgImageFromOutput: CGImage = ciContext.createCGImage(output, from: output.extent)!
            let rawImage: UIImage = UIImage.init(cgImage: cgImageFromOutput)
            let cgImage: CGImage = (rawImage.cgImage)!
           
            let cropZone = CGRect(x: 0, y: 0, width: Int(rawImage.size.width), height: Int(rawImage.size.height))
            let cWidth: size_t  = size_t(cropZone.size.width)
            let cHeight: size_t  = size_t(cropZone.size.height)
            let bitsPerComponent: size_t = cgImage.bitsPerComponent
            let bytesPerRow = (cgImage.bytesPerRow) / (cgImage.width * cWidth)
 
            let cgContext = CGContext(data: nil, width: cWidth, height: cHeight, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: cgImage.bitmapInfo.rawValue)!
 
            cgContext.draw(cgImage, in: cropZone)
 
            let cgImageObtained: CGImage  = cgContext.makeImage()!
            let barcodeImageCreated = UIImage(cgImage: cgImageObtained)
 
            return barcodeImageCreated
        }
    }
    return nil
}
