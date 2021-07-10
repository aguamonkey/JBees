//
//  Isolation.swift
//  JBees
//
//  Created by Gobias LTD on 11/09/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import SwiftUI

struct Isolation: View {
    @ObservedObject var audiosettings = audioSettings()

        var body: some View {
            ScrollView(.vertical, showsIndicators: false) {

            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    Image("Isolation Top")
                    .resizable()
                    .scaledToFit()
                    
                    isolation()
                    
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


    struct isolation: View {
        
        
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
                
                Text("Isolation")
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
                            self.audiosettings.playSound(sound: "J & The Bees - Isolation", type: "mp3")
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
                    shareSettings.ActivityView(activityItems: [self.ShareAudio("J & The Bees - Isolation")!] as [Any], applicationActivities: nil)
                   } )
                    Spacer()
                          
                           Text(timeString(time: audiosettings.playValue))
                    .font(Font.custom("Rehat", size: 20))
                                   .foregroundColor(Color.yellow)
                }
                Slider(value: $audiosettings.playValue, in: TimeInterval(0.0)...audiosettings.isolationDuration, onEditingChanged: { _ in
                    if self.audiosettings.audioPlayer != nil {
                    self.audiosettings.changeSliderValue()
                    
                    self.playButton = Image(systemName: "pause.circle")
                        if self.audiosettings.playValue == self.audiosettings.isolationDuration {
                            self.audiosettings.stopSound()
                            self.playButton = Image(systemName: "play.circle")

                        }
                    } else {
                    self.audiosettings.playSound(sound: "J & The Bees - Isolation", type: "mp3")
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
                
                Text("Verse 1:\n\nEveryone listen closely\nBecause we've got to pursue\nWhat we need to know\nAnd life will show\nUs the way ahead\nUnless it's in your head\nWhat's that called?\nThat's a story\nIt doesn't matter\nI don't care\nI'm not scared\nI'm in control\nKnow where to go\nBut do I though?\nI don't know\nThat's a worry\n\nChorus:\n\nIn isolation\nYou may find\nThat your own worst enemy\nResides in your mind\nIt's just a voice\nPassed down through pain\nGiven a choice\nBe Abel not Cain\n\nVerse 2:\n\nSo what have we covered so far?\nThe stories we are\nConfusion in our brains\nLeading to shame\nAll the while chasing pain\nOr was it fame?\nSame difference\nHow about we talk about\nWhat's going on outside\nAnd how we're all hiding away\nFrom a virus\n\nChorus:\n\nIn isolation\nYou may find\nThat your own worst enemy\nResides in your mind\nIt's just a voice\nPassed down through pain\nGiven a choice\nBe Abel not Cain\n\nVerse 3:\n\nWhen fear rules\nWhat do you think humans do?\nDo you think we just all chill out and sit down\nEverybody just do what you've got to do now?\nWe panic\nYour useless fear will be your demise\nTelling you lies\nAbout how you're going to die\nEvery body dies\nWhen they're meant to\n\nChorus:\n\nIn isolation\nYou may find\nThat your own worst enemy\nResides in your mind\nIt's just a voice\nPassed down through pain\nGiven a choice\nBe Abel not Cain\n\nVerse 4\n\nThe moral of the story goes\nFor those that know\nPeace will flow\nFor those that don't\nPain will grow\nThat's the way\nThe wind blows")
                       .font(.headline)
                       .fontWeight(.medium)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, alignment: .center)
                            .fixedSize(horizontal: false, vertical: true)
                
                
                
                
                                    Text("Watch Lyric Video:")
                       .font(Font.custom("Rehat", size: 22))
                       .fontWeight(.heavy)
                       .foregroundColor(Color.black)
                       .multilineTextAlignment(.center)
                       .frame(maxWidth: .infinity, alignment: .center)
                   .fixedSize(horizontal: false, vertical: true)
                   
                   Button(action: {
                                UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=yizDSx7MnCs")!)
                                        
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
                                UIApplication.shared.open(URL(string: "https://open.spotify.com/track/64m7wNduerfpAihJQfVysG")!)
                                        
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
                                    UIApplication.shared.open(URL(string: "https://soundcloud.com/jandthebees/j-the-bees-isolation")!)
                                            
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
                                    UIApplication.shared.open(URL(string: "https://geo.music.apple.com/us/album/isolation/1508220866?i=1508220869&mt=1&app=music")!)
                                            
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



struct Isolation_Previews: PreviewProvider {
    static var previews: some View {
        Isolation()
    }
}
