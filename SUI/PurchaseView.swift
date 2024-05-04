//
//  PurchaseView.swift
//  SUI
//
//  Created by Tixon Markin on 04.05.2024.
//

import SwiftUI

struct PurchaseView: View {
    private enum Constants {
        static let privacyMattersTitle = "Privacy Matters"
        static let privacyMattersSubtitle = "Protect your online activities with VPN Plus"
        static let addedButtonTitle = "Added"
        static let buyButtonTitle = "Buy"
    }
    
    @EnvironmentObject var viewModel: VpnViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Text(Constants.privacyMattersTitle)
                .font(.system(size: 24))
            Spacer().frame(height: 22)
            Text(Constants.privacyMattersSubtitle)
                .font(.system(size: 16))
            Spacer().frame(height: 24)
            ScrollView {
                LazyVStack(spacing: 34) {
                    ForEach(0..<viewModel.options.count, id: \.self) { index in
                        var isSelected = false
                        if let selectedIndex = viewModel.selectedOptionIndex {
                            isSelected = selectedIndex == index
                        }
                        return createOptionView(option: viewModel.options[index], isSelected: isSelected) {
                            viewModel.selectedOptionIndex = isSelected ? nil : index
                        }
                    }
                }
            }
        }
        .foregroundStyle(.white)
        .padding([.horizontal, .top], 24)
        .frame(maxWidth: .infinity)
        .background(.black)
    }
    
    
    private func createOptionView(option: SubscriptionOption, isSelected: Bool, action: @escaping (() -> ())) -> some View {
        VStack(spacing: 12) {
            Image(.calendarFrame)
                .frame(maxWidth: 120, maxHeight: 120)
                .overlay(alignment: .top) {
                    Text(option.duration.description)
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(.black)
                        .padding(.top, 54)
                }
            Text(option.description)
                .font(.system(size: 16))
            Button {
                action()
            } label: {
                Text(isSelected ? Constants.addedButtonTitle : Constants.buyButtonTitle)
                    .font(.system(size: 16))
                    .frame(width: 100, height: 48)
            }
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous).fill(isSelected ? .orange : .blue)
            )
        }
    }
}


