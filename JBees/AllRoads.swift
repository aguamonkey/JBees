//
//  AllRoads.swift
//  JBees
//
//  Created by Gobias LTD on 11/09/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import SwiftUI

struct AllRoads: View {
    @ObservedObject var audiosettings = audioSettings()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    Image("All Roads Top")
                        .resizable()
                        .scaledToFit()
                    
                    allRoads()
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 30)
                Spacer()
            }.onDisappear {
                self.audiosettings.stopSound()
            }
        }
    }
}


struct allRoads: View {
    
    
    @ObservedObject var audiosettings = audioSettings()
    @ObservedObject var sharesettings = shareSettings()

    @State private var showingSheet = false

    
    @State private var playButton: Image? = Image(systemName: "play.circle")
    @State private var pauseButton: Image? = Image(systemName: "pause.circle")
    
    @State private var stopButton: Image? = Image(systemName: "stop.circle")
    @State private var shareButton: Image? = Image(systemName: "arrowshape.turn.up.right.circle")
    
    @State private var textStyle = UIFont.TextStyle.body
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 20) {
            
            Group {
            
            Text("All Roads Lead To Now")
                .font(Font.custom("Rehat", size: 28))
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
            
            
            
            Text("Listen:")
                .font(Font.custom("Rehat", size: 22))
                .foregroundColor(Color.black)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack {
                Button(action: {
                    if (self.playButton == Image(systemName: "play.circle")) {
                        print("All Done")
                        self.audiosettings.playSound(sound: "J & The Bees - All Roads Lead To Now", type: "mp3")
                        self.audiosettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        self.playButton = Image(systemName: "pause.circle")
                        
                    } else {
                        
                        self.audiosettings.pauseSound()
                        self.playButton = Image(systemName: "play.circle")
                        
                        
                    }
                    
                    
                }) {
                    self.playButton
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 44))
                }
                Button(action: {
                    print("All Done")
                    self.audiosettings.stopSound()
                    self.playButton = Image(systemName: "play.circle")
                    self.audiosettings.playValue = 0.0
                    
                }) {
                    self.stopButton
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 44))
                    
                }
                Button(action: {
                    self.showingSheet = true

                    
                }) {
                    self.shareButton
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 44))
                    
                } .sheet(isPresented: $showingSheet,
                                content: {
                                 //present share window pass items you want to share in this case we call func which will take an audioname
                                 //replace Beep with your audio name which currently need to share when button tapped
                                    shareSettings.ActivityView(activityItems: [self.ShareAudio("J & The Bees - All Roads Lead To Now")!] as [Any], applicationActivities: nil) })

                
                Spacer()
                
                Text(timeString(time: audiosettings.playValue))
                    .font(Font.custom("Rehat", size: 20))
                    .foregroundColor(Color.yellow)
            }
            Slider(value: $audiosettings.playValue, in: TimeInterval(0.0)...audiosettings.allRoadsDuration, onEditingChanged: { _ in
                if self.audiosettings.audioPlayer != nil {
                    self.audiosettings.changeSliderValue()
                    
                    self.playButton = Image(systemName: "pause.circle")
                    if self.audiosettings.playValue == self.audiosettings.allRoadsDuration {
                        self.audiosettings.stopSound()
                        self.playButton = Image(systemName: "play.circle")
                        
                    }
                } else {
                    self.audiosettings.playSound(sound: "J & The Bees - All Roads Lead To Now", type: "mp3")
                    self.audiosettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    self.playButton = Image(systemName: "pause.circle")
                    
                }
                
                
            }).accentColor(Color.black)
                //      .frame(width: 200, height: 10, alignment: Alignment.center)
                .onReceive(audiosettings.timer) { _ in
                    
                    if self.audiosettings.playing {
                        if let currentTime = self.audiosettings.audioPlayer?.currentTime {
                            self.audiosettings.playValue = currentTime
                            
                            if currentTime == TimeInterval(0.0) {
                                self.audiosettings.playing = false
                                self.playButton = Image(systemName: "play.circle")
                                
                            }
                            
                        }
                        
                    }
                    else {
                        self.audiosettings.playing = false
                        self.audiosettings.timer.upstream.connect().cancel()
                    }
            }
            }
            Group {
            
            Text("Lyrics:")
                .font(Font.custom("Rehat", size: 22))
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Verse 1:\n\nBright light on the corner\nCrown full of flowers\nWe were connected\nBy power\nLife quickly moves on\nThat's how it flows\nBut there she is again\nAnd why I don't know\n\nChorus:\n\nSweetness is contagious\nIt pulls you in\nWe bonded can you blame us\nShe was looking within\nFor answers to her problems\nI showed her how\nIn the end\nAll roads lead to now\n\nVerse 2:\n\nHeld her while she cried\nHer boyfriend didn't care\nAt least not until she did\nWhat's best for her\nThen he had a problem\nSaw what he could lose\nHopefully on reflection\nHe found a new view\n\nChorus:\n\nSweetness is contagious\nIt pulls you in\nWe bonded can you blame us\nShe was looking within\nFor answers to her problems\nI showed her how\nIn the end\nAll roads lead to now\n\nVerse 3:\n\nWhen someone isn't ready\nTo face the truth\nIn trying to guide them\nYou've lost you\nControl is no way\nEven if it helps\nDeep down people must decide\nFor themselves\n\nChorus:\n\nSweetness is contagious\nIt pulls you in\nWe bonded can you blame us\nShe was looking within\nTo see beyond the pain\nThat's life's plan\nWhat was her name?\nJust call her Phoebe Ann")
                .font(.headline)
                .fontWeight(.medium)
                         .foregroundColor(Color.black)
                         .multilineTextAlignment(.center)
                         .frame(maxWidth: .infinity, alignment: .center)
                     .fixedSize(horizontal: false, vertical: true)
            
                           Text("Watch Music Video:")
                .font(Font.custom("Rehat", size: 22))
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            .fixedSize(horizontal: false, vertical: true)
            
            Button(action: {
                         UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=AKOqaVB1Rv8")!)
                                 
                             }) {
                                 Image("Youtube")
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                .resizable()
                               .scaledToFit()
                                    .frame(width: 64, height: 64, alignment: .center)
                                .frame(maxWidth: .infinity, alignment: .center)

                                 
                             }
            
                             Text("Listen On Spotify:")
                .font(Font.custom("Rehat", size: 22))
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            .fixedSize(horizontal: false, vertical: true)
            
            Button(action: {
                         UIApplication.shared.open(URL(string: "https://open.spotify.com/track/1Vh1GqkaPZOUiiymVvx9po")!)
                                 
                             }) {
                                 Image("Spotify")
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                .resizable()
                               .scaledToFit()
                                    .frame(width: 64, height: 64, alignment: .center)
                                .frame(maxWidth: .infinity, alignment: .center)

                                 
                             }
                
                
                                 Text("Listen On Soundcloud:")
                    .font(Font.custom("Rehat", size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
                
                Button(action: {
                             UIApplication.shared.open(URL(string: "https://soundcloud.com/jandthebees/all-roads-lead-to-now")!)
                                     
                                 }) {
                                     Image("Soundcloud")
                                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                    .resizable()
                                   .scaledToFit()
                                        .frame(width: 64, height: 64, alignment: .center)
                                    .frame(maxWidth: .infinity, alignment: .center)

                                     
                                 }

                                 Text("Listen On iTunes:")
                    .font(Font.custom("Rehat", size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
                
                Button(action: {
                             UIApplication.shared.open(URL(string: "https://geo.music.apple.com/us/album/all-roads-lead-to-now-single/1512371110?mt=1&app=music")!)
                                     
                                 }) {
                                     Image("iTunes")
                                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                    .resizable()
                                   .scaledToFit()
                                        .frame(width: 64, height: 64, alignment: .center)
                                    .frame(maxWidth: .infinity, alignment: .center)

                                     
                                 }

            
            
            
            }
            
        }
    }
    
    func ShareAudio(_ AudioName : String ) -> URL?{
        guard let hasAudio = Bundle.main.path(forResource: AudioName, ofType: "mp3") else {
            print("no url found with name \(AudioName)")
            return nil
        }
        let AudioUrl = URL.init(fileURLWithPath: hasAudio)
        return AudioUrl
    }

}



struct AllRoads_Previews: PreviewProvider {
    static var previews: some View {
        AllRoads()
    }
}
