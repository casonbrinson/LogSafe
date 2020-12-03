//
//  VisitorHome.swift
//  LogSafe
//
//  Created by Jacob Kohn on 12/2/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import SwiftUI

struct VisitorHome: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack {
                    
                    
                    Text("Please Select What You Would Like to Do")
                        .font(.system(size: 16))
                        .padding(.top, -100)
                        .padding(.bottom, 35)
                    
                       
                    NavigationLink(destination: VisitorLoginForm()) {
                        Text("New Sign In")
                            .frame(width: 150, height: 36, alignment: .center)
                            .font(.title2)
                            .foregroundColor(.blue)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.blue, lineWidth: 1)
                                
                        )
                            .padding(25)
                    }
                        
                    
                    NavigationLink(destination: VisitorLogout()) {
                        Text("Log Out")
                            .frame(width: 150, height: 36, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.blue, lineWidth: 1)
                        )
                            .foregroundColor(.blue)
                            .font(.title2)
                            .padding(25)
                    }
                        
                    
                }
                
        }
    }
}
