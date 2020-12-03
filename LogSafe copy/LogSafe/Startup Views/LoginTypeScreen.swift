//
//  LoginTypeScreen.swift
//  LogSafe
//
//  Created by CS3714 on 12/2/20.
//

import SwiftUI

struct LoginTypeScreen: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    Image("Welcome")
                        .padding(.top, 50)
                        .padding(.bottom, 50)
                    
                    Button(action: {
                        userData.userType = "Visitor"
                        userData.userTypeAuthenticated = true
                    }) {
                        Text("Vistor")
                            .frame(width: 300, height: 36)
                            .font(Font.system(size: 20))
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.black, lineWidth: 1)
                            )
                            .padding()
                    }
                    
                    Button(action: {
                        userData.userType = "Employee"
                        userData.userTypeAuthenticated = true
                    }) {
                        Text("Employee")
                            .frame(width: 300, height: 36)
                            .font(Font.system(size: 20))
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.black, lineWidth: 1)
                            )
                            .padding()
                    }
                    
                    Button(action: {
                        userData.userType = "Admin"
                        userData.userTypeAuthenticated = true
                    }) {
                        Text("Admin")
                            .frame(width: 300, height: 36)
                            .font(Font.system(size: 20))
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.black, lineWidth: 1)
                            )
                            .padding()
                    }
                }//end of VStack
            }//end of Scroll View
        }//end of ZStack
    }
}

struct LoginTypeScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginTypeScreen()
    }
}
