//
//  FrenchDancer.swift
//  JBees
//
//  Created by Gobias LTD on 11/09/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import SwiftUI

struct FrenchDancer: View {
    
    @ObservedObject var audiosettings = audioSettings()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {

        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Image("French Dancer Top")
                .resizable()
                .scaledToFit()
                
                frenchDancer()
                
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


struct frenchDancer: View {
    
    
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
            Text("French Dancers Smile")
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
                        self.audiosettings.playSound(sound: "J & The Bees - French Dancers Smile", type: "mp3")
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
                        shareSettings.ActivityView(activityItems: [self.ShareAudio("J & The Bees - French Dancers Smile")!] as [Any], applicationActivities: nil)
                       } )

                Spacer()
                      
                       Text(timeString(time: audiosettings.playValue))
                .font(Font.custom("Rehat", size: 20))
                               .foregroundColor(Color.yellow)
            }
            Slider(value: $audiosettings.playValue, in: TimeInterval(0.0)...audiosettings.frenchDancerDuration, onEditingChanged: { _ in
                if self.audiosettings.audioPlayer != nil {
                self.audiosettings.changeSliderValue()
                
                self.playButton = Image(systemName: "pause.circle")
                    if self.audiosettings.playValue == self.audiosettings.frenchDancerDuration {
                        self.audiosettings.stopSound()
                        self.playButton = Image(systemName: "play.circle")

                    }
                } else {
                self.audiosettings.playSound(sound: "J & The Bees - French Dancers Smile", type: "mp3")
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
            
                Text("Verse 1:\n\nIt was a\nBeauty seen\nNot noticed at first\nType of beauty be\nSeen as a curse\nIn some form she hides\nEscaping the truth\nAnd when she finds herself that's\nWhen she'll see through\n\nChorus:\n\nFrench dancers smile\nFading away\nKnown her a while\nLess each day\nThere's a light inside\nThing that she has\nShe moves with the wind\nAs she flows to the past\n\nVerse 2:\n\nFrom a spark a\nSong would be bright\nWhen I tell her\nIt seems to excite\nInspiration formed and\nPatience is key\nWhat we're playing with it's\nDestiny\n\nChorus:\n\nFrench dancers smile\nFading away\nKnown her a while\nLess each day\nThere's a light inside\nThing that she has\nShe moves with the wind\nAs she flows to the past\n\nVerse 3:\n\nWhen you aspire for\nGifts of grace\nDeep down you know that you're\nPlaying with fate\nYou tried and that's good it\nMeant something deep\nAt least to me it did the\nSecrets we keep\n\nChorus:\n\nFrench dancers smile\nFading away\nKnown her a while\nLess each day\nThere's a light inside\nThing that she has\nShe moves with the wind\nAs she flows to the past")
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
                         UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=jfQb8pN8sXc")!)
                                 
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
                         UIApplication.shared.open(URL(string: "https://open.spotify.com/track/5w1KOdZqU69CY9M35mtjdi")!)
                                 
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
                             UIApplication.shared.open(URL(string: "https://soundcloud.com/jandthebees/j-the-bees-french-dancers-smile")!)
                                     
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
                             UIApplication.shared.open(URL(string: "https://geo.music.apple.com/us/album/french-dancers-smile/1508220866?i=1508220868&mt=1&app=music")!)
                                     
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

//struct responsible of presenting share window like UIActivityViewController in Swift


struct FrenchDancer_Previews: PreviewProvider {
    static var previews: some View {
        FrenchDancer()
    }
}
