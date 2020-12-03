//
//  ContentView.swift
//  LogSafe
//
//  Created by Matt Krivansky on 11/18/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Map()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            
            /*ApartmentsList()
                .tabItem {
                    Image(systemName: "building.2")
                    Text("Apartments")
                }
            
            Attractions()
                .tabItem {
                    Image(systemName: "suit.heart")
                    Text("Attractions")
                }
            
            VideosList()
                .tabItem {
                    Image(systemName: "video")
                    Text("Videos")
                }
            
            Photos()
                .tabItem {
                    Image(systemName: "photo.on.rectangle.angled")
                    Text("Photos")
                }*/
        }   // End of TabView
        .font(.headline)
        .imageScale(.medium)
        .font(Font.title.weight(.regular))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
