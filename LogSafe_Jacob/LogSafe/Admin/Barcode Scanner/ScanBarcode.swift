//
//  ScanBarcode.swift
//  LogSafe
//
//  Created by Jacob Kohn on 12/2/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import SwiftUI

struct ScanBarcode: View {
    
    @State var barcode: String = ""
    
    var body: some View {
        VStack {
            Text("FINISH BARCODE SCANNER")
            
            if barcode.isEmpty {
                
                
                ZStack {
                    
                    BarcodeScanner(code: self.$barcode)
                    scanFocusRegionImage
                    
                    
                }
                
            }// if
            else {
                
            }
                    
            
        }//vstack
    }
    
    //ADD FUNC TO FIND VISITOR BASED ON BARCODE, RETURN IN ELSE STATEMENT
    
}
