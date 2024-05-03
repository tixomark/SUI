//
//  SwitchFormView.swift
//  SUI
//
//  Created by Tixon Markin on 01.05.2024.
//

import SwiftUI

/// Обертка над `FromView` ставящая `Toggle` в качестве дополнительной вью
struct ToggleFormView: View {
    @State private var isOn = false

    var image: ImageResource? = nil
    var iconBackground: Color
    var title: String
    
    var body: some View {
        FormView(title: title, image: image, iconBackground: iconBackground) {
            Toggle("", isOn: $isOn)
        }
    }
}
