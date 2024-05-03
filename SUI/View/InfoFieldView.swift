//
//  InfoFieldView.swift
//  SUI
//
//  Created by Tixon Markin on 03.05.2024.
//

import SwiftUI

struct InfoFieldView<AccessoryView: View>: View {
    var title: String 
    var accessoryView: (() -> AccessoryView)
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                accessoryView()
            }
            .font(.verdana(size: 16))
            Divider()
                .padding(.horizontal, 70)
        }
    }
}
