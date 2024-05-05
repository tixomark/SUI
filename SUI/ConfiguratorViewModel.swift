//
//  ConfiguratorViewModel.swift
//  SUI
//
//  Created by Tixon Markin on 03.05.2024.
//

import Foundation

final class ConfiguratorViewModel: ObservableObject {
    @Published var selectedCarIndex = 0
    @Published var cars = Car.cars
    @Published var includeCasco = false
    
    var selectedConfigurationIndex: Float = 0
    var configurationOptions = ["Joy", "Lifestyle", "Ultimate", "Active", "Supreme"]
    var totalCost: String {
        let cost = cars[selectedCarIndex].cost + 
        Int(selectedConfigurationIndex) * 190_000 +
        (includeCasco ? 99_000 : 0)
        return numberFormatter.string(from: NSNumber(value: cost)) ?? ""
    }
    
    private let numberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "руб"
        formatter.currencyGroupingSeparator = " "
        formatter.maximumFractionDigits = 0
        formatter.usesGroupingSeparator = true
        return formatter
    }()
}
