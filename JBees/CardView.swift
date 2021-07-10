//
//  CardView.swift
//  JBees
//
//  Created by Gobias LTD on 09/09/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import SwiftUI

struct CardView: View {
        @State var presentingModal = false
        var card: Card

        
        var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
        @State private var showModal: Bool = false
        //MARK: - CARD
        @State var showsAlert = false

        
        var body: some View {
            ZStack {
                Image(card.imageName)
               //     .cornerRadius(6)
                VStack {
                    Text(card.title)
                        .font(Font.custom("Rehat", size: 36))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.yellow)
                        .multilineTextAlignment(.center)
                    Text(card.headline)
                        .font(Font.custom("Rehat", size: 22))
                        .foregroundColor(Color.yellow)
                        .italic()
                    
                }
                .offset(y: -222)
                
                
                Button(action: {
                    //MARK: - PLAY SOUND
                    //     playSound(sound: "soundName", type: "mp3")
                }) {
                    HStack {
                        Text(card.callToAction)
                            .font(Font.custom("Rehat", size: 26))
                            .foregroundColor(Color.yellow)
                            .accentColor(Color.yellow)

                        
                        Image(systemName: "arrow.right.circle")
                            .font(Font.title.weight(.medium))
                            .accentColor(Color.yellow)
                    } //MARK: -BUTTON FUNCTIONALITY:
                        .onTapGesture {
                            self.hapticImpact.impactOccurred()
                            self.showModal = true
                    }
                    .sheet(isPresented: self.$showModal) {
                        
                        if (self.card.headline == "French Dancers Smile") {
                        if (self.card.callToAction == "Listen") {
                            FrenchDancer()
                        }
                        }
                        if (self.card.headline == "Cover Girl") {

                        if (self.card.callToAction == "Listen") {
                      CoverGirl()
                        }
                        }
                        if (self.card.headline == "All Roads Lead To Now") {

                        if (self.card.callToAction == "Listen") {
               AllRoads()
                        }
                        }
                        if (self.card.headline == "Isolation") {

                        if (self.card.callToAction == "Listen") {
                        Isolation()
                        }
                        }
                        
                        if (self.card.callToAction == "About") {
                About()
                        }
           
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 24)
         //           .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                        .background(Color.white)
                    .clipShape(Capsule())
           //         .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                }
                .offset(y: 222)
                
            }
            .frame(width: 355, height: 545)
      //      .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
            .cornerRadius(16)
            .shadow(radius: 8)
            
        }
    


}


    //MARK: - PREVIEW
    struct CardView_Previews: PreviewProvider {
        static var previews: some View {
            CardView(card: cardData[6])
                .previewLayout(.sizeThatFits)
        }
    }


