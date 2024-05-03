//
//  ContentView.swift
//  SUI
//
//  Created by Tixon Markin on 29.04.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ConfiguratorViewModel()
    
    var body: some View {
        VStack(spacing: 32) {
            CarSelectorView(selection: $viewModel.selectedCarIndex, cars: $viewModel.cars)
                .padding(.horizontal, 22).padding(.top, 32)
            CarConfigurationView(viewModel: viewModel)
        }
        .background(.mainBackground)
        .ignoresSafeArea(edges: .bottom)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView()
}
