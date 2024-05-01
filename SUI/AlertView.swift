//
//  AlertView.swift
//  SUI
//
//  Created by Tixon Markin on 29.04.2024.
//

import SwiftUI

struct AlertView: View {
    // MARK: - Constants
    private enum Constants {
        static let buttonText = "Показать"
    }
    
    @State var label: String
    @Binding var isPresented: Bool
    
    var body: some View {
        HStack(spacing: 58) {
            Text(label)
                .font(.interBold(size: 14))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            Button(action: {
                self.isPresented = true
            }, label: {
                Text(Constants.buttonText)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
            .font(.inter(size: 14))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(.userPurple)
            )
            .shadow(color: .black.opacity(0.25), radius: 2, y: 4)
        }
        .frame(maxWidth: .infinity, maxHeight: 48)
    }
}
