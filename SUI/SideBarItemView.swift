//
//  SideBarItemView.swift
//  SUI
//
//  Created by Tixon Markin on 01.05.2024.
//

import SwiftUI

/// Боковое представление со списком карт пользователя
struct SideBarItemView: View {
    @Binding var amount: Int
    
    var caption: String
    var onTap: (() -> ()) = { }
    
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack(alignment: .center, spacing: 8) {
                Image(.cardIcon)
                VStack(alignment: .leading) {
                    Text(amount.formatAsRubCurrency())
                        .foregroundStyle(.black)
                        .font(.interBold(size: 14))
                    Text(caption)
                        .font(.inter(size: 10))
                        .foregroundStyle(.black)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
        }
        .clipped()
        .frame(maxHeight: 35)
        Divider()
    }
}
