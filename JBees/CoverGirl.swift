//
//  CoverGirl.swift
//  JBees
//
//  Created by Gobias LTD on 11/09/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import SwiftUI

struct CoverGirl: View {
       @ObservedObject var audiosettings = audioSettings()

        var body: some View {
            ScrollView(.vertical, showsIndicators: false) {

            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    Image("Cover Girl Top")
                    .resizable()
                    .scaledToFit()
                    
                    coverGirl()
                    
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


    struct coverGirl: View {
        
        
        @ObservedObject var audiosettings = audioSettings()
        @ObservedObject var sharesettings = shareSettings()

        
        @State private var showingSheet = false

        @State private var playButton: Image? = Image(systemName: "play.circle")
        @State private var pauseButton: Image? = Image(systemName: "pause.circle")
        @State private var shareButton: Image? = Image(systemName: "arrowshape.turn.up.right.circle")

        @State private var stopButton: Image? = Image(systemName: "stop.circle")
        
        
        @State private var textStyle = UIFont.TextStyle.body
        
        var body: some View {
            
            VStack (alignment: .leading, spacing: 20) {
                
     
                Group {

                Text("Cover Girl")
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
                            self.audiosettings.playSound(sound: "J & The Bees - Cover Girl", type: "mp3")
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
                        print("Share Track")
                self.showingSheet = true

                    }) {
                        self.shareButton
                            .foregroundColor(Color.yellow)
                            .font(.system(size: 44))
                        
                    }
            .sheet(isPresented: $showingSheet,
                   content: {
                    shareSettings.ActivityView(activityItems: [self.ShareAudio("J & The Bees - Cover Girl")!] as [Any], applicationActivities: nil)
                   } )

                    Spacer()
                          
                           Text(timeString(time: audiosettings.playValue))
                    .font(Font.custom("Rehat", size: 20))
                                   .foregroundColor(Color.yellow)
                }
                Slider(value: $audiosettings.playValue, in: TimeInterval(0.0)...audiosettings.coverGirlDuration, onEditingChanged: { _ in
                    if self.audiosettings.audioPlayer != nil {
                    self.audiosettings.changeSliderValue()
                    
                    self.playButton = Image(systemName: "pause.circle")
                        if self.audiosettings.playValue == self.audiosettings.coverGirlDuration {
                            self.audiosettings.stopSound()
                            self.playButton = Image(systemName: "play.circle")

                        }
                    } else {
                    self.audiosettings.playSound(sound: "J & The Bees - Cover Girl", type: "mp3")
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
                
         Text("Verse 1:\n\nShe's on the\nCover of a magazine\nShe looks so pristine\nSlim body and perfect skin\nIn life how can she not win\nImages girls see everyday\nPersonify beauty in a cynical way\nAltering what you see\nMaking imperfections look unclean\n\nChorus:\n\nBeen going on for so long\nCan't we see that it's wrong\nWe're trapped within a lie\nAnd darling i'm asking you why?\nIf we could just see through\nAnd discover what's true\nWe're lost within a dream\nSearching for clarity\n\nVerse 2:\n\nJust buy this dress\nAnd buy these shoes\nThe models who wear them all look happy\nSo what have you got to lose\nThe forms we look up to\nAre swimming in a deep untruth\nA corruption of what should be\nInstead of love we're breeding envy\n\nChorus:\n\nBeen going on for so long\nCan't we see that it's wrong\nWe're trapped within a lie\nAnd darling i'm asking you why?\nIf we could just see through\nAnd discover what's true\nWe're lost within a dream\nSearching for clarity\n\nVerse 3:\n\nFlawless skin\nPerfect eyes\nIf you had these\nYou'd be just fine\nBut what does fine even mean?\nInstead of searching just be\nWho you truly are\nA light created from a star\n\nChorus:\n\nBeen going on for so long\nCan't we see that it's wrong\nWe're trapped within a lie\nAnd darling i'm asking you why?\nIf we could just see through\nAnd discover what's true\nWe're lost within a dream\nWake up find clarity")
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
                             UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=wAZMTjtRqfk&feature")!)
                                     
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
                             UIApplication.shared.open(URL(string: "https://open.spotify.com/track/0NYFDkrnloCmObVj17KMBO")!)
                                     
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
                                 UIApplication.shared.open(URL(string: "https://soundcloud.com/jandthebees/j-the-bees-cover-girl")!)
                                         
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
                                 UIApplication.shared.open(URL(string: "https://geo.music.apple.com/us/album/cover-girl-single/1523443485?mt=1&app=music")!)
                                         
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


struct CoverGirl_Previews: PreviewProvider {
    static var previews: some View {
        CoverGirl()
    }
}
