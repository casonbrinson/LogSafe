//
//  CreateAudioPlayers.swift
//  MyPIM
//
//  Created by Gregory Cason Brinson on 10/19/20.
//  Copyright © 2020 Gregory Cason Brinson. All rights reserved.
//


import Foundation
import AVFoundation

// Global Audio Players
var hokiePokieAudioPlayer = AVAudioPlayer()

// This function is called upon app launch in AppDelegate.swift
public func createAudioPlayers() {
    /*
     MARK: - Create an audio player for each item in the notes list
     */
    /*
    if let audioFileUrl = Bundle.main.url(forResource: "hokiePokie", withExtension: "wav", subdirectory: "AudioFiles") {
        do {
            hokiePokieAudioPlayer = try AVAudioPlayer(contentsOf: audioFileUrl)
            hokiePokieAudioPlayer.prepareToPlay()
        } catch {
            fatalError("Unable to create hokiePokie AVAudioPlayer!")
        }
    } else {
        fatalError("Unable to load the hokiePokie audio file from the main bundle!")
    }
 */

}
