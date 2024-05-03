//
//  ImageTextView.swift
//  SUI
//
//  Created by Tixon Markin on 01.05.2024.
//

import SwiftUI

/// Иконка с подписью справа
struct ImageTextView: View {
    var image: ImageResource? = nil
    var iconBackground: Color = .clear
    var title: String
    
    var body: some View {
        HStack(spacing: 12) {
            if let image {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(iconBackground)
                            .frame(width: 30, height: 30)
                    )
                    .frame(width: 20, height: 20)
            }
            Text(title)
                .lineLimit(1)
                .font(.system(size: 18))
        }
    }
}
