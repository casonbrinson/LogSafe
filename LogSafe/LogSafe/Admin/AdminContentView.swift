//
//  AdminContentView.swift
//  LogSafe
//
//  Created by Jacob Kohn on 12/2/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import SwiftUI

struct AdminContentView: View {
    
    var body: some View {
        
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            ScanBarcode()
                .tabItem {
                    Image(systemName: "scanner.fill")
                    Text("Scan Barcode")
                }
            Map()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            VisitorList()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Visitors")
                }
            BarGraph()
                .tabItem() {
                    Image(systemName: "doc.richtext")
                    Text("Graph")
                }
        }
        .font(.headline)
        .imageScale(.medium)
        .font(Font.title.weight(.regular))
        .navigationBarTitle(Text("Admin"), displayMode: .inline)
        
    }
}
