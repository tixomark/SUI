//
//  ContentView.swift
//  SUI
//
//  Created by Tixon Markin on 29.04.2024.
//

import SwiftUI

// MARK: - Constants
private enum Constants {
    static let constantExample = ""
}

struct ContentView: View {
    
    private enum Constants {
        static let navigationTitle = "Настройки"
        static let profileCaption = "Apple ID, iCloud, контент и покупки"
        static let appleIDOffers = "Предложения Apple ID"
        static let iOSUpdateAvailable = "IOS 17.2: уже доступно"
        static let airplaneMode = "Авиарежим"
        static let wifi = "Wi-Fi"
        static let wifiOptions = ["Вкл.", "Выкл.", "Не подключено"]
        static let bluetooth = "Bluetooth"
        static let bluetoothOptions = ["Вкл.", "Выкл."]
        static let cellular = "Сотовая связь"
        static let hotspot = "Режим модема"
        static let hotspotOptions = ["Вкл.", "Выкл."]
        static let vpn = "VPN"
    }
    
    var userName = "Evgeny"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink {
                    } label: {
                        UserProfileView(
                            image: .profile,
                            name: userName,
                            caption: Constants.profileCaption
                        )
                    }
                    NavigationLink {
                    } label: {
                        FormView(title: Constants.appleIDOffers) {
                            createBadgeView(color: .red, number: 3)
                                .padding(.trailing, 16)
                        }
                    }
                }
                Section {
                    NavigationLink {
                    } label: {
                        FormView(title: Constants.iOSUpdateAvailable) {
                            createBadgeView(color: .red, number: 3)
                                .padding(.trailing, 16)
                        }
                    }
                }
                Section {
                    ToggleFormView(image: .plane, iconBackground: .orange, title: Constants.airplaneMode)
                    PickerFormView(
                        selection: 2,
                        options: Constants.wifiOptions,
                        image: .wifi,
                        iconBackground: .blue,
                        title: Constants.wifi
                    )
                    PickerFormView(
                        options: Constants.bluetoothOptions,
                        image: .bluetooth,
                        iconBackground: .blue,
                        title: Constants.bluetooth
                    )
                    FormView(title: Constants.cellular, image: .cellular, iconBackground: .green) {
                        NavigationLink("") {}
                    }
                    PickerFormView(
                        selection: 1,
                        options: Constants.hotspotOptions,
                        image: .hotspot,
                        iconBackground: .green,
                        title: Constants.hotspot
                    )
                    ToggleFormView(image: .globe, iconBackground: .blue, title: Constants.vpn)
                }
            }
            .navigationTitle(Constants.navigationTitle)
        }
    }
    
    private func createBadgeView(color: Color, number: Int) -> some View {
        Text(number.description)
            .foregroundStyle(.white)
            .font(.system(size: 14, weight: .bold))
            .background(
                Circle()
                    .fill(.red)
                    .frame(width: 25, height: 25)
            )
    }
}

#Preview {
    ContentView()
}
