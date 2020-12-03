//
//  Home.swift
//  LogSafe
//
//  Created by Jacob Kohn on 12/2/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import SwiftUI
 
struct Home: View {
   
    // Subscribe to changes in UserData
    //@EnvironmentObject var userData: UserData
   
    var body: some View {
        Text("HOME SCREEN FIND PICS")
        /*
        ZStack {        // Background
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
           
        ScrollView(.vertical, showsIndicators: false) {
            VStack {    // Foreground
                Image("Welcome")
                    .padding(.top, 50)
               
                Image("photo\(userData.imageNumber + 1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 300, maxWidth: 500, alignment: .center)
                    .padding(.top, 30)
                    .padding(.bottom, 5)
                    .padding(.horizontal)
               
                HStack {
                    Button(action: {    // Button 1
                        self.userData.imageNumber = 0
                    }) {
                        self.imageForButton(buttonNumber: 0)
                    }
                    Button(action: {    // Button 2
                        self.userData.imageNumber = 1
                    }) {
                        self.imageForButton(buttonNumber: 1)
                    }
                    Button(action: {    // Button 3
                        self.userData.imageNumber = 2
                    }) {
                        self.imageForButton(buttonNumber: 2)
                    }
                    Button(action: {    // Button 4
                        self.userData.imageNumber = 3
                    }) {
                        self.imageForButton(buttonNumber: 3)
                    }
                    Button(action: {    // Button 5
                        self.userData.imageNumber = 4
                    }) {
                        self.imageForButton(buttonNumber: 4)
                    }
                    Button(action: {    // Button 6
                        self.userData.imageNumber = 5
                    }) {
                        self.imageForButton(buttonNumber: 5)
                    }
                    Button(action: {    // Button 7
                        self.userData.imageNumber = 6
                    }) {
                        self.imageForButton(buttonNumber: 6)
                    }
                    Button(action: {    // Button 8
                        self.userData.imageNumber = 7
                    }) {
                        self.imageForButton(buttonNumber: 7)
                    }
                    Button(action: {    // Button 9
                        self.userData.imageNumber = 8
                    }) {
                        self.imageForButton(buttonNumber: 8)
                    }
                   
                }   // End of HStack
                    .imageScale(.medium)
                    .font(Font.title.weight(.regular))
                    .padding(.bottom, 100)
                
                Link(destination: URL(string: "https://www.themoviedb.org/documentation/api")!, label: {
                    Image("tmdbAttribution")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 60)
                })
                .padding(.top, -50)
                
                Link(destination: URL(string: "https://www.omdbapi.com/")!, label: {
                    Image("omdbAttribution")
                        .renderingMode(.original)   // To keep the logo in its original form
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 60)
                })
                .padding()
               
            }   // End of VStack
           
        }   // End of ScrollView
            .onAppear() {
                self.userData.startTimer()
            }
            .onDisappear() {
                self.userData.stopTimer()
            }
           
        }   // End of ZStack
 */
    }
   /*
    func imageForButton(buttonNumber: Int) -> Image {
       
        if self.userData.imageNumber == buttonNumber {
            return Image(systemName: "\(buttonNumber+1).circle.fill")
        } else {
            return Image(systemName: "\(buttonNumber+1).circle")
        }
    }
   */
}
/*
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(UserData())
    }
}
*/
