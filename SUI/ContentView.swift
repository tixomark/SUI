//
//  ContentView.swift
//  SUI
//
//  Created by Tixon Markin on 29.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    private enum Constants {
        static let alertTitle = "Alert"
        static let actionSheetTitle = "Action Sheet"
        static let alertMessage = "This is Alert"
        static let alertWithTwoButtonsMessage = "This is Alert with two buttons"
        static let actionSheetMessage = "This is Action Sheet"
        static let actionSheetWithTwoButtonsMessage = "This is Action Sheet with 2 buttons"
        static let doneButtonTitle = "Done"
        static let changeTextButtonTitle = "Change text"
        static let dismissButtonTitle = "Dismiss"
        static let titleLabel = "Alert & ActionSheet"
        static let firstAlertLabel = "Пример Alert"
        static let secondAlertLabel = "Пример Alert с 2 кнопками и логикой"
        static let thirdAlertLabel = "Пример ActionSheet"
        static let fourthAlertLabel = "Пример ActionSheet кнопками и логикой"
    }
    
    @State var isPresentedFirstAlert = false
    @State var isPresentedSecondAlert = false
    @State var isPresentedThirdAlert = false
    @State var isPresentedFourthAlert = false
    
    @State var title: String = Constants.titleLabel
    
    var body: some View {
        VStack(spacing: 60) {
            Text(title)
                .font(.interBold(size: 20))
            VStack(spacing: 24) {
                createAlertView()
                createAlertWithLogicView()
                createConfirmationDialogView()
                createConfirmationDialogWithLogicView()
            }
        }
        .padding([.leading, .trailing], 16)
        .padding(.top, 42)
        Spacer()
    }
    
    private func createAlertView() -> some View {
        AlertView(label: Constants.firstAlertLabel, isPresented: $isPresentedFirstAlert)
            .alert(Constants.alertTitle, isPresented: $isPresentedFirstAlert) {
                Button(Constants.doneButtonTitle, role: .cancel) {
                    self.title = Constants.alertTitle
                }
            } message: {
                Text(Constants.alertMessage)
            }
    }
    
    private func createAlertWithLogicView() -> some View {
        AlertView(label: Constants.secondAlertLabel, isPresented: $isPresentedSecondAlert)
            .alert(Constants.alertTitle, isPresented: $isPresentedSecondAlert) {
                Button(Constants.changeTextButtonTitle, role: .destructive) {
                    self.title = Constants.alertWithTwoButtonsMessage
                }
                Button(Constants.doneButtonTitle, role: .cancel) {}
            } message: {
                Text(Constants.alertWithTwoButtonsMessage)
            }
    }
    
    private func createConfirmationDialogView() -> some View {
        AlertView(label: Constants.thirdAlertLabel, isPresented: $isPresentedThirdAlert)
            .confirmationDialog(Constants.actionSheetTitle, isPresented: $isPresentedThirdAlert, titleVisibility: .visible) {
                Button(Constants.dismissButtonTitle, role: .cancel) {}
            } message: {
                Text(Constants.actionSheetMessage)
            }
    }
    
    private func createConfirmationDialogWithLogicView() -> some View {
        AlertView(label: Constants.fourthAlertLabel, isPresented: $isPresentedFourthAlert)
            .confirmationDialog(Constants.actionSheetTitle, isPresented: $isPresentedFourthAlert, titleVisibility: .visible) {
                Button(Constants.changeTextButtonTitle, role: .destructive) {
                    title = Constants.actionSheetTitle
                }
                Button(Constants.dismissButtonTitle, role: .cancel) {}
            } message: {
                Text(Constants.actionSheetWithTwoButtonsMessage)
            }
    }
}


#Preview {
    ContentView()
}
