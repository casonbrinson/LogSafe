//
//  UserData.swift
//  LogSafe
//
//  Created by Matt Krivansky on 12/2/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    
    // Publish if the user is authenticated or not
    @Published var userPasswordAuthenticated = false
    @Published var userNameAuthenticated = false
    @Published var userType = ""
    @Published var userTypeAuthenticated = false
    @Published var visitorAuthenticated = false
    
    
    /*
     MARK: - Slide Show Declarations
     */
    let numberOfImagesInSlideShow = 9
    var counter = 0
    var slideShowTimer = Timer()

    
    // Publish imageNumber to refresh the View body in Home.swift when it is changed in the slide show
    @Published var imageNumber = 0

   

    /*
     MARK: - Scheduling a Timer
     */
    public func startTimer() {
        // Stop timer if running
        stopTimer()

        /*
         Schedule a timer to invoke the fireTimer() method given below
         after 3 seconds in a loop that repeats itself until it is stopped.
         */
        slideShowTimer = Timer.scheduledTimer(timeInterval: 3,
                             target: self,
                             selector: (#selector(fireTimer)),
                             userInfo: nil,
                             repeats: true)

    }

    public func stopTimer() {
        counter = 0
        slideShowTimer.invalidate()
    }
    
    @objc func fireTimer() {
        counter += 1
        if counter == numberOfImagesInSlideShow {
            counter = 0
        }
        
        imageNumber = counter
    }

}
