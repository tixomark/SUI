//
//  vpnViewModel.swift
//  SUI
//
//  Created by Tixon Markin on 04.05.2024.
//

import Foundation


final class VpnViewModel: ObservableObject {
    @Published var options = SubscriptionOption.basicOptions
    @Published var selectedOptionIndex: Int? {
        willSet {
            if let newValue {
                selectedOption = options[newValue]
            } else {
                selectedOption = nil
            }
        }
    }
    @Published var selectedOption: SubscriptionOption? 
    
}
