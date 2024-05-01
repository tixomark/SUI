//
//  CardView.swift
//  SUI
//
//  Created by Tixon Markin on 30.04.2024.
//

import SwiftUI

/// Вью бокового меню с краткой информацией о карте
struct CardView: View {
    // MARK: - Constants
    private enum Constants {
        static let avalibleText = "доступно"
    }
    
    @Binding var amount: Int
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(amount.formatAsRubCurrency())
                    .font(.interBold(size: 20))
                Text(Constants.avalibleText)
                    .font(.inter(size: 16))
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding([.leading, .top], 16)
            
            Spacer()
            Image(.logoMIR)
                .padding([.trailing, .bottom], 16)
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
        }
        .background {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(.userLightGreen.opacity(0.7))
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        
    }
}
