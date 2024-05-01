//
//  ContentView.swift
//  SUI
//
//  Created by Tixon Markin on 29.04.2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Constants
    private enum Constants {
        static let cardCaption1 = "MIR **0001"
        static let cardCaption2 = "MIR **0002"
        static let cardCaption3 = "MIR **0003"
        static let card1Title = "Карта1"
        static let topUp = "Пополнить"
        static let transfer = "Перевести"
        static let openCard = "Открыть карту"
        static let topUpAlertTitle = "Пополнение"
        static let topUpAlertMessage = "Баланс пополнен на 1000 р"
        static let transferAlertTitle = "Перевод"
        static let transferAlertMessage = "Перевести 1000 р на карту1?"
        static let walletToggleLabel = "Показать мой кошелек"
    }

    @State var isShowingSideBar = false
    @State var isShowingTopUpAlert = false
    @State var isShowingWithdrawAlert = false
    @State var mainViewOffset: CGFloat = 0
    @State var firstCardBalance = 50000
    @State var secondCardBalance = 100000
    @State var thirdCardBalance = 1000
    
    var body: some View {
        ZStack {
            HStack {
                VStack(spacing: 8) {
                    SideBarItemView(amount: $firstCardBalance, caption: Constants.cardCaption1)
                    SideBarItemView(amount: $secondCardBalance, caption: Constants.cardCaption2)
                    SideBarItemView(amount: $thirdCardBalance, caption: Constants.cardCaption3)
                }
                .padding([.leading, .trailing], 16)
                .frame(maxWidth: mainViewOffset, maxHeight: .infinity, alignment: .topLeading)
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(Constants.card1Title)
                    .font(.interBold(size: 20))
                    .foregroundStyle(.black)
                    .padding(.bottom, 30)
                CardView(amount: $firstCardBalance)
                    .padding(.bottom, 22)
                HStack(spacing: 14) {
                    createTopUpButton()
                    createTransferButton()
                    OperationView(image: .creditCardPlus, caption: Constants.openCard)
                }
                .background {
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.25), radius: 4, y: 4)
                }
                Spacer()
            }
            .padding([.leading, .trailing], 16).padding(.top, 40)
            .background(.userUltraLightGreen)
            .clipped()
            .offset(x: mainViewOffset)
            .onChange(of: isShowingSideBar) { newValue in
                withAnimation(.easeInOut) {
                    mainViewOffset = newValue ? 176 : 0
                }
            }
        }
        Spacer(minLength: 17)
        Toggle(Constants.walletToggleLabel, isOn: $isShowingSideBar)
            .padding(.leading, 13)
            .padding(.trailing, 36)
    }
    
    private func createTopUpButton() -> some View {
        OperationView(image: .walletArrowRight, caption: Constants.topUp) {
            self.firstCardBalance += 1000
            self.isShowingTopUpAlert = true
        }
        .alert(Constants.topUpAlertTitle, isPresented: $isShowingTopUpAlert) {
            Button("Ок", role: .cancel) {}
        } message: {
            Text(Constants.topUpAlertMessage)
        }
    }
    
    private func createTransferButton() -> some View {
        OperationView(image: .walletMinus, caption: Constants.transfer) {
            self.isShowingWithdrawAlert = true
        }
        .alert(Constants.transferAlertTitle, isPresented: $isShowingWithdrawAlert) {
            Button("Отмена", role: .cancel) {}
            Button("Ок") {
                self.firstCardBalance -= 1000
                self.secondCardBalance += 1000
            }
            .keyboardShortcut(.defaultAction)
        } message: {
            Text(Constants.transferAlertMessage)
        }
    }
}

#Preview {
    ContentView()
}
