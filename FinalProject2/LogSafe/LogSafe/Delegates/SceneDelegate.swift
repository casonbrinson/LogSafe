//
//  ContentView.swift
//  LogSafe
//
//  Created by Jacob Kohn on 11/28/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                    VStack {
                        
                        Image("Welcome")
                            .padding(.top, -50)
                        
                        Text("Please Select An Option")
                            .padding(.top, 10)
                            .padding(25)
                        
                        
                        NavigationLink(destination: VisitorHome()) {
                            Text("Visitor Login")
                                .frame(width: 200, height: 36, alignment: .center)
                                .font(.title2)
                                .foregroundColor(.blue)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .strokeBorder(Color.blue, lineWidth: 1)
                                    
                            )
                                .padding(25)
                        }
                        
                        Text("Employee Login")
                            .frame(width: 200, height: 36, alignment: .center)
                            .font(.title2)
                            .foregroundColor(.blue)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.blue, lineWidth: 1)
                                
                        )
                            .padding(25)
                        
                        NavigationLink(destination: AdminContentView()) {
                            Text("Admin Login")
                                .frame(width: 200, height: 36, alignment: .center)
                                .font(.title2)
                                .foregroundColor(.blue)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .strokeBorder(Color.blue, lineWidth: 1)
                                    
                            )
                                .padding(25)
                        }
                        
                        /*
                        NavigationLink(destination: VisitorLoginForm()) {
                            Text("Visitor")
                                .frame(width: 150, height: 36, alignment: .center)
                                .font(.title2)
                                .foregroundColor(.blue)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .strokeBorder(Color.blue, lineWidth: 1)
                                    
                            )
                                .padding(25)
                        }
                                
                            
                            
                        NavigationLink(destination: ReturningVisitor()) {
                            Text("Returning Visitor")
                                .frame(width: 200, height: 36, alignment: .center)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .strokeBorder(Color.blue, lineWidth: 1)
                            )
                                .foregroundColor(.blue)
                                .font(.title2)
                                .padding(25)
                        }
                            
                        
                        NavigationLink(destination: SignOut()) {
                            Text("Sign Out")
                                .frame(width: 150, height: 36, alignment: .center)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .strokeBorder(Color.blue, lineWidth: 1)
                            )
                                .foregroundColor(.blue)
                                .font(.title2)
                                .padding(25)
                        }
                          */
                        
                    }
                    
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
