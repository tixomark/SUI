//
//  ActivityView.swift
//  SUI
//
//  Created by Tixon Markin on 03.05.2024.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    public var activityItems: [Any]
    public var applivationActivities: [UIActivity] = []
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: applivationActivities)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

