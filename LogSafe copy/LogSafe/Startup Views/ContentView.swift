//
//  ContentView.swift
//  LogSafe
//
//  Created by CS3714 on 12/1/20.
//

import SwiftUI

struct ContentView: View {
    // Subscribe to changes in UserData
    @EnvironmentObject var userData: UserData

    var body: some View {
        if !userData.userTypeAuthenticated {
            return AnyView(LoginTypeScreen())
        }
        else if userData.userTypeAuthenticated && userData.userType == "Visitor" && !userData.visitorAuthenticated {
            return AnyView(VisitorLogin())
        }
        else if userData.userTypeAuthenticated && userData.userType != "Visitor" && !userData.userPasswordAuthenticated && !userData.userNameAuthenticated {
            return AnyView(LoginView())
        }
        else if userData.userTypeAuthenticated && userData.userNameAuthenticated && userData.userPasswordAuthenticated {
            return AnyView(MainView())
        }
        else if userData.userTypeAuthenticated && userData.userType == "Visitor" && userData.visitorAuthenticated {
            return AnyView(MainView())
        }
        else {
            return AnyView(LoginTypeScreen())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
