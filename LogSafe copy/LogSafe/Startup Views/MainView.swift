//
//  MainView.swift
//  LogSafe
//
//  Created by CS3714 on 12/2/20.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
