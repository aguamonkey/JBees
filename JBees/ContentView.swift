//
//  ContentView.swift
//  JBees
//
//  Created by Gobias LTD on 08/09/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        @Environment(\.viewController) private var viewControllerHolder: UIViewController?
        
       //MARK: - PROPERTIES
        @State var presentingModal = false
        var cards: [Card] = cardData
        
        
        //MARK: -CONTENT
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 20) {
                    ForEach(cards) { item in
                        CardView(card: item)
                        
                    }
                    
                }.padding(.horizontal, 10)
            }
        }
        
    }

    //MARK: - PREVIEW
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(cards: cardData)
            .previewDevice("iPhone 11 Pro")
        }
    }

    struct ViewControllerHolder {
        weak var value: UIViewController?
    }

    struct ViewControllerKey: EnvironmentKey {
        static var defaultValue: ViewControllerHolder {
            return ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController)
        }
    }

    extension EnvironmentValues {
        var viewController: UIViewController? {
            get { return self[ViewControllerKey.self].value }
            set { self[ViewControllerKey.self].value = newValue }
        }
    }

    extension UIViewController {
        func present<Content: View>(style: UIModalPresentationStyle = .automatic, @ViewBuilder builder: () -> Content) {
            let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
            toPresent.modalPresentationStyle = style
            toPresent.rootView = AnyView(
            builder()
                .environment(\.viewController, toPresent)
            )
            self.present(toPresent, animated: true, completion: nil)
        }
    }
