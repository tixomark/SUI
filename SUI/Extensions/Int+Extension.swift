//
//  Int+Extension.swift
//  SUI
//
//  Created by Tixon Markin on 01.05.2024.
//

import Foundation

/// Расширение добавляющее функциональность форматирования числа в виде денежной суммы в рублях.
extension Int {
    func formatAsRubCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₽"
        formatter.currencyDecimalSeparator = ","
        formatter.currencyGroupingSeparator = " "
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.usesGroupingSeparator = true
        
        let number = Double(self)
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
}
