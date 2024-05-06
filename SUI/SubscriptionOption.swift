//
//  SubscriptionOption.swift
//  SUI
//
//  Created by Tixon Markin on 04.05.2024.
//

import Foundation

struct SubscriptionOption: Equatable {
    var name: String
    var duration: Int
    var cost: Int
}

extension SubscriptionOption: CustomStringConvertible {
    var description: String {
        var durationText = "\(name) (%@) \(cost) RUB"
        if duration % 30 == 0 {
            let months = duration / 30
            durationText = String(format: durationText, months == 1 ? "1 month" : "\(months) months")
        } else {
            durationText = String(format: durationText, duration == 1 ? "1 day" : "\(duration) days")
        }
        return durationText
    }
}


extension SubscriptionOption {
    static var basicOptions: [SubscriptionOption] = [
        .init(name: "Vacation", duration: 7, cost: 99),
        .init(name: "Standart", duration: 30, cost: 179),
        .init(name: "Standart+", duration: 90, cost: 279)
    ]
}
