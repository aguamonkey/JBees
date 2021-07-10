//
//  PlaySound.swift
//  JBees
//
//  Created by Gobias LTD on 11/09/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import Foundation
import AVFoundation
import Combine
//MARK: - AUDIOPLAYER

class audioSettings: ObservableObject {
    
    var audioPlayer: AVAudioPlayer?
    var playing = false
    @Published var playValue: TimeInterval = 0.0
    var frenchDancerDuration: TimeInterval = 173
    var coverGirlDuration: TimeInterval = 201
    var allRoadsDuration: TimeInterval = 171
    var isolationDuration: TimeInterval = 185


  var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var formatter = DateComponentsFormatter()
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                if playing == false {
                    if (audioPlayer == nil) {
                        
                        
                        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                        audioPlayer?.prepareToPlay()
                        
                        audioPlayer?.play()
                        playing = true
                    }
                    
                }
                if playing == false {
                    
                    audioPlayer?.play()
                    playing = true
                }
                
                
            } catch {
                print("Could not find and play the sound file.")
            }
        }
        
    }
    
    
    
    func stopSound() {
        //   if playing == true {
        audioPlayer?.stop()
        audioPlayer = nil
        playing = false
        playValue = 0.0
        
        
        //   }
    }
    
    func pauseSound() {
        if playing == true {
            audioPlayer?.pause()
            playing = false
            
            
        }
    }
    
    
    func changeSliderValue() {
        if playing == true {
            pauseSound()
            audioPlayer?.currentTime = playValue
            
        }
        
        if playing == false {
            audioPlayer?.currentTime = playValue
            
            
            audioPlayer?.play()
            playing = true
        }
    }
    
}
func timeString(time:TimeInterval) -> String {
    let minutes = Int(time) / 60
    let seconds = time - Double(minutes) * 60
    return String(format:"%02i:%02i",minutes,Int(seconds))
}
