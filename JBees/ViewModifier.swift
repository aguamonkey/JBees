//
//  ViewModifier.swift
//  JBees
//
//  Created by Gobias LTD on 11/09/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import SwiftUI

extension View {
    
    func navigate<SomeView: View>(to view: SomeView, when binding: Binding<Bool>) -> some View {
        modifier(NavigateModifier(destination: view, binding: binding))
    }
}

//MARK: -NAVIGATE MODIFIER

fileprivate struct NavigateModifier<SomeView: View>: ViewModifier {
    
    //MARK: -PRIVATE PROPERTIES
    fileprivate let destination: SomeView
    @Binding fileprivate var binding: Bool
    
    //MARK: -VIEW BODY
    fileprivate func body(content: Content) -> some View {
        NavigationView {
            ZStack {
                content
                .navigationBarTitle("")
                .navigationBarHidden(true)
                NavigationLink(destination: destination
                .navigationBarTitle("")
                .navigationBarHidden(true),
                               isActive: $binding) {
                EmptyView()
                }
            }
        }
    }
    
}
