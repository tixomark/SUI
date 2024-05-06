//
//  BasketView.swift
//  SUI
//
//  Created by Tixon Markin on 04.05.2024.
//

import SwiftUI

struct BasketView: View {
    private enum Constants {
        static let choosePlanPrompt = "Please choose plan"
        static let chosenPlanPrompt = "You choosed"
        static let checkAndPayMessage = "Please check and pay the selected tariff"
        static let buyButtonTitle = "Buy"
        static let purchaseAlertTitle = "Приобретено"
        static let purchaseAlertButton = "Ок"
        static let purchaseSuccessMessage = "Вы приобрели тариф %@ за %d RUB"
        static let genericPurchaseMessage = "Вы приобрели новый тариф тариф"
    }
    
    @Binding var option: SubscriptionOption?
    @Binding var selectedOptionIndex: Int?
    
    var body: some View {
        VStack(spacing: 0) {
            Text(option == nil ? Constants.choosePlanPrompt : Constants.chosenPlanPrompt)
                .font(.system(size: 24))
            if let option {
                Spacer()
                    .frame(height: 22)
                Text(Constants.checkAndPayMessage)
                    .font(.system(size: 16))
                Spacer()
                    .frame(height: 25)
                createSelectedOptionView(option: option)
                Spacer()
                    .frame(height: 65)
                buyButton
            }
        }
        .foregroundStyle(.white)
        .padding([.horizontal, .top], 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.black)
    }
    
    @State private var isSwhowingPurchaseAlert = false
    
    private var buyButton: some View {
        Button {
            isSwhowingPurchaseAlert = true
        } label: {
            Text(Constants.buyButtonTitle)
                .font(.system(size: 16))
                .frame(maxWidth: .infinity, maxHeight: 48)
        }
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous).fill(.blue)
        )
        .alert(Constants.purchaseAlertTitle, isPresented: $isSwhowingPurchaseAlert) {
            Button(Constants.purchaseAlertButton, role: .cancel) {
                selectedOptionIndex = nil
            }
        } message: {
            if let option {
                Text(String(format: Constants.purchaseSuccessMessage, option.name, option.cost))
            } else {
                Text(Constants.genericPurchaseMessage)
            }
        }
    }
    
    private func createSelectedOptionView(option: SubscriptionOption) -> some View {
        HStack(spacing: 8) {
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
                .multilineTextAlignment(.center)
                .frame(maxWidth: 180)
        }
    }
}


