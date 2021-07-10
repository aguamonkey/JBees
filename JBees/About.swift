//
//  About.swift
//  JBees
//
//  Created by Gobias LTD on 11/09/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import SwiftUI

struct About: View {
    
    
    var body: some View {
                ScrollView(.vertical, showsIndicators: false) {

                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Image("About Top")
                        .resizable()
                        .scaledToFit()
                        
                        aboutSection()
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 30)
                    Spacer()
                }
                }
            }
            
        }


struct aboutSection: View {
    
    
    @ObservedObject var audiosettings = audioSettings()
    
    
    
    @State private var playButton: Image? = Image(systemName: "play.circle")
    @State private var pauseButton: Image? = Image(systemName: "pause.circle")
    
    @State private var stopButton: Image? = Image(systemName: "stop.circle")
    @State private var shareButton: Image? = Image(systemName: "arrowshape.turn.up.right.circle")
    
    @State private var textStyle = UIFont.TextStyle.body
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 20) {
            
 
            Group {
            Text("About")
                .font(Font.custom("Rehat", size: 28))
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            .fixedSize(horizontal: false, vertical: true)
            
                            Text("J & The Bees has been in the works for a few years. Back in 2015 I was in a band called Leo Steel. We released an EP and toured England but alas our success was not meant to be. Since then I have been patiently writing lyrics and honing my skills as a musician so that I may put out to the world what I am passionate about. I'm J, and the bees are anyone who contributes to the creative process. The bees are also any fans that get involved in the music in any way. All my music has been tuned down and recorded in a pure 432 hz frequency. Whether it's a placebo or not I feel this frequency is better suited for listening to music. If you've liked the music in this app and want to hear more when it comes out, be sure to subscribe and follow me on the platforms below. Also be sure to share the songs with whoever you think will like them by hitting the share button on the tracks page. Peace and Love, Joshua x")
                .font(.headline)
                .fontWeight(.medium)
                         .foregroundColor(Color.black)
                         .multilineTextAlignment(.center)
                         .frame(maxWidth: .infinity, alignment: .center)
                     .fixedSize(horizontal: false, vertical: true)
            
            
            
                 Text("Links:")
                     .font(Font.custom("Rehat", size: 22))
                     .fontWeight(.heavy)
                     .foregroundColor(Color.black)
                     .multilineTextAlignment(.center)
                     .frame(maxWidth: .infinity, alignment: .center)
                 .fixedSize(horizontal: false, vertical: true)
            
    
                

                Text("Subscribe On Youtube:")
                .font(Font.custom("Rehat", size: 22))
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            .fixedSize(horizontal: false, vertical: true)
            
            Button(action: {
                         UIApplication.shared.open(URL(string: "https://www.youtube.com/channel/UCPmKDIPU8dcSGOCFDp2d_SQ")!)
                                 
                             }) {
                                 Image("Youtube")
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                .resizable()
                               .scaledToFit()
                                    .frame(width: 64, height: 64, alignment: .center)
                                .frame(maxWidth: .infinity, alignment: .center)

                                 
                             }
            
                             Text("Follow On Spotify:")
                .font(Font.custom("Rehat", size: 22))
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            .fixedSize(horizontal: false, vertical: true)
            
            Button(action: {
                         UIApplication.shared.open(URL(string: "https://open.spotify.com/artist/2VIeKZjQEk1iaGifhGCP70?si=BfTRCNXFQiOq4Lp9uyiXzw")!)
                                 
                             }) {
                                 Image("Spotify")
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                .resizable()
                               .scaledToFit()
                                    .frame(width: 64, height: 64, alignment: .center)
                                .frame(maxWidth: .infinity, alignment: .center)

                                 
                             }
                
                
                                 Text("Follow On Soundcloud:")
                    .font(Font.custom("Rehat", size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
            }
            
            Group {
                Button(action: {
                             UIApplication.shared.open(URL(string: "https://soundcloud.com/jandthebees")!)
                                     
                                 }) {
                                     Image("Soundcloud")
                                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                    .resizable()
                                   .scaledToFit()
                                        .frame(width: 64, height: 64, alignment: .center)
                                    .frame(maxWidth: .infinity, alignment: .center)

                                     
                                 }

                                 Text("Follow On iTunes:")
                    .font(Font.custom("Rehat", size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
                
                Button(action: {
                             UIApplication.shared.open(URL(string: "https://geo.music.apple.com/us/artist/j-the-bees/1508220332?mt=1&app=music")!)
                                     
                                 }) {
                                     Image("iTunes")
                                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                    .resizable()
                                   .scaledToFit()
                                        .frame(width: 64, height: 64, alignment: .center)
                                    .frame(maxWidth: .infinity, alignment: .center)

                                     
                                 }

                              Text("Follow On Instagram:")
                    .font(Font.custom("Rehat", size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
                
                Button(action: {
                             UIApplication.shared.open(URL(string: "https://www.instagram.com/jthebees/")!)
                                     
                                 }) {
                                     Image("Instagram")
                                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                    .resizable()
                                   .scaledToFit()
                                        .frame(width: 64, height: 64, alignment: .center)
                                    .frame(maxWidth: .infinity, alignment: .center)

                                     
                                 }
                
                              Text("Like On Facebook:")
                    .font(Font.custom("Rehat", size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
                
                Button(action: {
                             UIApplication.shared.open(URL(string: "https://www.facebook.com/J-the-Bees-350769971994426")!)
                                     
                                 }) {
                                     Image("Facebook")
                                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                    .resizable()
                                   .scaledToFit()
                                        .frame(width: 64, height: 64, alignment: .center)
                                    .frame(maxWidth: .infinity, alignment: .center)

                                     
                                 }
                
                              Text("Website:")
                    .font(Font.custom("Rehat", size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
                
                Button(action: {
                             UIApplication.shared.open(URL(string: "https://www.jandthebees.com/")!)
                                     
                                 }) {
                                     Image("Website")
                                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                    .resizable()
                                   .scaledToFit()
                                        .frame(width: 64, height: 64, alignment: .center)
                                    .frame(maxWidth: .infinity, alignment: .center)

                                     
                                 }
            
            
            }
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
