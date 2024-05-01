//
//  FormView.swift
//  SUI
//
//  Created by Tixon Markin on 01.05.2024.
//

import SwiftUI

/// Конфигурируемая вью для отображения элемента списка
struct FormView<SuplementaryView: View>: View {
    var title: String
    var image: ImageResource? = nil
    var iconBackground: Color = .clear
    var supplementaryView: (() -> SuplementaryView?) = { nil }
    
    var body: some View {
        HStack(spacing: 12) {
            ImageTextView(image: image, iconBackground: iconBackground, title: title)
                .frame(alignment: .leading)
                .layoutPriority(1)
            HStack{
                supplementaryView()
                    .lineLimit(1)
                    .foregroundStyle(.secondary)
                    .font(.system(size: 18))
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    
}
