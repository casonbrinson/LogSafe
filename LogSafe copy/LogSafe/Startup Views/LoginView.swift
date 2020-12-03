//
//  LoginView.swift
//  MyPIM
//
//  Created by Gregory Cason Brinson on 10/16/20.
//  Copyright © 2020 Gregory Cason Brinson. All rights reserved.
//

import SwiftUI

struct LoginView : View {
    // Subscribe to changes in UserData
    @EnvironmentObject var userData: UserData

    @State private var enteredPassword = ""
    @State private var enteredUserName = ""
    @State private var showInvalidPasswordAlert = false

    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                /*
                Image("Welcome")
                    .padding(.top, 30)
            */
                Text("\(userData.userType) Login")
                    .font(.headline)
                    .padding()
/*
                Image("DataProtection")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 300, maxWidth: 600)
                    .padding()
*/
                TextField("Username", text: $enteredUserName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300, height: 36)
                    .padding()
                SecureField("Password", text: $enteredPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300, height: 36)
                    .padding()
    
                HStack {
                    Button(action: {
                        let validPassword = UserDefaults.standard.string(forKey: "Password")
                        let validUserName = UserDefaults.standard.string(forKey:
                            "UserName")
                        /*
                         If the user has not yet set a password, validPassword = nil
                         In this case, allow the user to login.
                         */
                        if validPassword == nil || self.enteredPassword == validPassword {
                            userData.userPasswordAuthenticated = true
                            self.showInvalidPasswordAlert = false
                        } else {
                            self.showInvalidPasswordAlert = true
                        }
                        
                        if validUserName == nil || self.enteredUserName == validUserName {
                            userData.userNameAuthenticated = true
                            self.showInvalidPasswordAlert = false
                        } else {
                            self.showInvalidPasswordAlert = true
                            
                        }
                    }) {
                        Text("Login")
                            .frame(width: 100, height: 36, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.black, lineWidth: 1)
                            )
                    }
                    .alert(isPresented: $showInvalidPasswordAlert, content: { self.invalidPasswordAlert })
                    
                    
                }//end of HStack
                
            }   // End of VStack
        }   // End of ScrollView
        }   // End of ZStack

    }   // End of var
   

    /*
     -----------------------------
     MARK: - Invalid Password Alert
     -----------------------------
     */
    var invalidPasswordAlert: Alert {

        Alert(title: Text("Invalid Password!"),
              message: Text("Please enter a valid password to unlock the app!"),
              dismissButton: .default(Text("OK")) )
    }

}

 

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

 
