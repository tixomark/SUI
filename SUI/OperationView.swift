//
//  OptionView.swift
//  SUI
//
//  Created by Tixon Markin on 30.04.2024.
//

import SwiftUI

/// Вью с картинкой и текстом для отображения возможной операции с картой
struct OperationView: View {
    
    var image: ImageResource
    var caption: String
    var onTap: (() -> ()) = { }
    
    var body: some View {
        Button {
            onTap()
        } label: {
            VStack(alignment: .center, spacing: 8) {
                Image(image)
                    .padding(.top, 14)
                Text(caption)
                    .font(.interLight(size: 14))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .padding(.bottom, 8)
            }
        }
        .frame(maxHeight: 88)
        .clipped()
    }
}

