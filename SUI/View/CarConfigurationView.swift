//
//  CarDetailView.swift
//  SUI
//
//  Created by Tixon Markin on 03.05.2024.
//

import SwiftUI

struct CarConfigurationView: View {
    private enum Constants {
        static let carInfoTitle = "Информация об автомобиле"
        static let engineTitle = "Двигатель"
        static let engineDetails = "1.6 Turbo"
        static let driveTitle = "Привод"
        static let driveDetails = "AWD"
        static let configuratorTitle = "Комплектация"
        static let cascoTitle = "ОМОДА Каско"
        static let cascoAlertTitle = "ОМОДА Каско"
        static let cascoAlertDecline = "Нет, не нужно"
        static let cascoAlertAccept = "Да"
        static let cascoAlertMessage = "Подключить Каско на выгодных условиях?"
        static let priceTitle = "Цена"
        static let orderButtonTitle = "Заказать"
        static let orderConfirmationTitle = "Заказ совершен"
        static let orderConfirmationButton = "Готово"
        static let orderConfirmationMessage = "Благодарим за заказ. Наш менеджер свяжется с Вами в рабочее время для уточнения деталей."
    }
    
    @State var value: Float = 0.5
    @State var isEditing = false {
        didSet {
            if !isEditing {
                viewModel.selectedConfigurationIndex = value.rounded(.down)
                withAnimation(.linear) {
                    value = viewModel.selectedConfigurationIndex + 0.5
                }
            }
        }
    }
    @State var isCascoAlertPresented = false
    @State var isOrderButtonTapped = false
    
    @ObservedObject var viewModel: ConfiguratorViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text(Constants.carInfoTitle)
                .font(.verdanaBold(size: 18))
                .padding(.top, 25)
            InfoFieldView(title: Constants.engineTitle) {
                Text(Constants.engineDetails)
            }
            .padding(.top, 4)
            InfoFieldView(title: Constants.driveTitle) {
                Text(Constants.driveDetails)
            }
            complectationModificatorView
            cascoSelectionView
            costView
                .padding(.top, 16)
            orderButton
                .padding(.top, 12)
            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .background(Color.white.padding(.top, 16))
        .background(.white, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    
    var complectationModificatorView: some View {
        VStack {
            Text(Constants.configuratorTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            Slider(value: $value, in: 0...4.99, step: 0.01) {
                Text("")
            } onEditingChanged: { editing in
                isEditing = editing
            }
            .tint(.black)
            .onAppear() {
                UISlider.appearance().setThumbImage(.circle(diameter: 8, ofColor: .black), for: .normal)
            }
            HStack(spacing: 0) {
                ForEach(viewModel.configurationOptions, id: \.self) {
                    Text($0).frame(maxWidth: .infinity)
                }
            }
            .font(.verdana(size: 12))
            .padding(.horizontal, 4)
        }
    }
    
    var cascoSelectionView: some View {
        InfoFieldView(title: Constants.cascoTitle) {
            Toggle("", isOn: $viewModel.includeCasco)
                .alert(Constants.cascoAlertTitle, isPresented: $isCascoAlertPresented) {
                    Button(Constants.cascoAlertDecline) {
                        viewModel.includeCasco = false
                    }
                    Button(Constants.cascoAlertAccept) {
                        viewModel.includeCasco = true
                    }
                } message: {
                    Text(Constants.cascoAlertMessage)
                }
                .onChange(of: viewModel.includeCasco) { newValue in
                    if newValue {
                        isCascoAlertPresented = newValue
                    }
                }
        }
    }
    
    var costView: some View {
        HStack {
            Text(Constants.priceTitle)
            Text(viewModel.totalCost.description)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .font(.verdanaBold(size: 18))
    }
    
    var orderButton: some View {
        Button {
            isOrderButtonTapped = true
        } label: {
            Text(Constants.orderButtonTitle)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .font(.verdanaBold(size: 18))
        }
        .tint(.white)
        .background(.mainBackground, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
        .shadow(color: .black.opacity(0.25), radius: 4, y: 4)
        .confirmationDialog(Constants.orderConfirmationTitle, isPresented: $isOrderButtonTapped, titleVisibility: .visible) {
            Button(Constants.orderConfirmationButton, role: .cancel) {}
        } message: {
            Text(Constants.orderConfirmationMessage)
        }
    }
}

