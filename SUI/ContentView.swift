//
//  ContentView.swift
//  SUI
//
//  Created by Tixon Markin on 29.04.2024.
//

import SwiftUI

struct ContentView: View {
    private enum Constants {
        static let vpnText = "VPN"
        static let purchaseText = "Purchase"
        static let basketText = "Basket"
    }
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            VpnView()
                .tabItem {
                    Image(.lock).renderingMode(.template)
                    Text(Constants.vpnText)
                }.tag(0)
            PurchaseView()
                .tabItem {
                    Image(.list).renderingMode(.template)
                    Text(Constants.purchaseText)
                }.tag(1)
            BasketView(option: $viewModel.selectedOption, selectedOptionIndex: $viewModel.selectedOptionIndex)
                .tabItem {
                    Image(.shoppingBasket).renderingMode(.template)
                    Text(Constants.basketText)
                }.tag(2)
            
        }
        .onAppear {
            UITabBar.appearance().barTintColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
            UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
        }
        
        .environmentObject(viewModel)
    }
    
    @State private var selectedIndex = 0
    @ObservedObject private var viewModel = VpnViewModel()
}



#Preview {
    ContentView()
}
