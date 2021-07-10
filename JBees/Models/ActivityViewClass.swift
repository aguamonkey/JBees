//
//  ActivityViewClass.swift
//  JBees
//
//  Created by Gobias LTD on 21/09/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import SwiftUI

class shareSettings: ObservableObject {
struct ActivityView: UIViewControllerRepresentable {

    let activityItems: [Any]
    let applicationActivities: [UIActivity]?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems,
                                        applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ActivityView>) {

    }
}
}
