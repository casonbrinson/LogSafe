//
//  VisitorLogout.swift
//  LogSafe
//
//  Created by Jacob Kohn on 12/2/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import SwiftUI

fileprivate enum ActivateAlert {
    case visitorNotFound, signOutComplete
}

struct VisitorLogout: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var activateAlert:ActivateAlert = .visitorNotFound
    @State private var showAlert = false
    
    @State private var name = ""
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Enter Name Here", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            if (name != "") {
                Button(action: {
                    if (inputDataValidated()) {
                        activateAlert = .signOutComplete
                    } else {
                        activateAlert = .visitorNotFound
                    }
                }) {
                    Text("Continue")
                        .foregroundColor(.blue)
                }
            }
        }
        .navigationBarTitle(Text("Log Out Form"), displayMode: .inline)
        .alert(isPresented: $showAlert, content: {
            switch activateAlert {
                case .visitorNotFound: return visitorNotFoundAlert
                case .signOutComplete: return signOutCompleteAlert
            }
            
        })
    }
    var visitorNotFoundAlert: Alert {
        Alert(title: Text("Sign Out Incomplete"),
              message: Text("Your name could not be found in the database.  Please make sure your spelling is correct."),
              dismissButton: .default(Text("OK")) {
                
              }
        )
    }
    
    var signOutCompleteAlert: Alert {
        Alert(title: Text("Sign Out Complete"),
              message: Text("Thank you for signing Out. Please come again!"),
              dismissButton: .default(Text("OK")) {
                self.presentationMode.wrappedValue.dismiss()
              }
        )
    }
    
    func inputDataValidated() -> Bool {
        /**
         THIS NEEDS TO BE CHANGED TO  SEARCHING THE DATABASE FOR THE VALID NAME
         */
        
        if (name == "") {
            return false
        }
        return true
    }
}
