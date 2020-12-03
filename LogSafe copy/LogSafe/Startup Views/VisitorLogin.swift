//
//  VisitorLogin.swift
//  LogSafe
//
//  Created by CS3714 on 12/2/20.
//

import SwiftUI

struct VisitorLogin: View {
    
    // Subscribe to changes in UserData
    @EnvironmentObject var userData: UserData
    
    @State private var enteredName = ""
    @State private var enteredPersonVisiting = ""
    
    var body: some View {

        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("\(userData.userType) Login")
                        .font(.headline)
                        .padding()
                    
                    TextField("Name", text: $enteredName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 36)
                        .padding()
                    
                    TextField("Person Visiting", text: $enteredPersonVisiting)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 36)
                        .padding()
                    
                    Button(action: {
                        userData.visitorAuthenticated = true
                    }) {
                        Text("Submit")
                            .frame(width: 100, height: 36, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.black, lineWidth: 1)
                            )
                    }
                }
            }//end of Scroll View
        }//end of ZStack

    }
}

struct VisitorLogin_Previews: PreviewProvider {
    static var previews: some View {
        VisitorLogin()
    }
}
