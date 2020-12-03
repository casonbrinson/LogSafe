//
//  CurrentLocationMap.swift
//  LogSafe
//
//  Created by Jacob Kohn on 12/2/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import SwiftUI
import MapKit
 
struct Map: View {
   
    @State private var selectedMapType = MKMapType.hybrid
    @State private var showMapSettings = false
    @State private var showCurrentLocation = false

    var body: some View {
        ZStack {
            if showCurrentLocation {
                let currentGeolocation = currentLocation()
                let latitudeOfCurrentLocation  = currentGeolocation.latitude
                let longitudeOfCurrentLocation = currentGeolocation.longitude
                MapView(mapType: self.selectedMapType, latitude: latitudeOfCurrentLocation, longitude: longitudeOfCurrentLocation,
                        delta: 1000.0, deltaUnit: "meters", annotationTitle: "Current Location", annotationSubtitle: "Go Hokies!")
                    .edgesIgnoringSafeArea(.all)
            } else {
                MapView(mapType: self.selectedMapType, latitude: 37.230639, longitude: -80.415358, delta: 3000, deltaUnit: "meters", annotationTitle: "Blacksburg, Virginia", annotationSubtitle: "Go Hokies!")
                    .edgesIgnoringSafeArea(.all)
            }
           
        VStack {
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        self.showMapSettings.toggle()
                    }) {
                        Image(systemName: self.showMapSettings ? "info.circle.fill" : "info.circle")
                            .font(Font.title.weight(.light))
                            .foregroundColor(.blue)
                            .padding(.top, 10)
                            .padding(.bottom, 7)
                    }
                    .actionSheet(isPresented: $showMapSettings, content: { mapSettings })
                   
                    Divider()
                   
                    Button(action: {
                        self.showCurrentLocation.toggle()
                    }) {
                        Image(systemName: self.showCurrentLocation ? "location.fill" : "location")
                            .font(Font.title.weight(.light))
                            .foregroundColor(.blue)
                            .padding(.top, 7)
                            .padding(.bottom, 10)
                    }
                }
                .frame(width: 40, alignment: .center)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white)
                )
                .padding()
               
            }   // End of HStack
           
            Spacer()
           
        }   // End of VStack
        }   // End of ZStack
       
    }   // End of body
    var mapSettings: ActionSheet {
            ActionSheet(
                title: Text("Map Settings"),
                message: Text("Select map Type"),
                buttons: [
                    .default(Text("Standard")) {
                        self.selectedMapType = MKMapType.standard
                        self.showMapSettings = false
                    },
                    .default(Text("Satellite")) {
                        self.selectedMapType = MKMapType.satellite
                        self.showMapSettings = false
                    },
                    .default(Text("Hybrid")) {
                        self.selectedMapType = MKMapType.hybrid
                        self.showMapSettings = false
                    },
                    .cancel() {
                        self.showMapSettings = false
                    }
            ])
        }
 
}   // End of struct
