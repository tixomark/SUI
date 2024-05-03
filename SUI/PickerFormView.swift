//
//  PickerFormView.swift
//  SUI
//
//  Created by Tixon Markin on 01.05.2024.
//

import SwiftUI

/// Обертка над `FromView` ставящая `Picker` в качестве дополнительной вью
struct PickerFormView: View {
    @State var selection: Int = 0
    
    var options: [String] = []
    var image: ImageResource? = nil
    var iconBackground: Color
    var title: String
    
    var body: some View {
        NavigationLink {
            Form {
                Picker("", selection: $selection) {
                    ForEach(options, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.inline)
            }
            .navigationBarTitleDisplayMode(.inline)
        } label: {
            FormView(title: title, image: image, iconBackground: iconBackground) {
                Text(self.options[selection])
            }
            
        }
    }
}
