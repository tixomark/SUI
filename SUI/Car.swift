//
//  Car.swift
//  SUI
//
//  Created by Tixon Markin on 03.05.2024.
//

import Foundation

struct Car {
    var name: String
    var model: String
    var imageName: String
    var cost: Int
}

extension Car: CustomStringConvertible {
    var description: String {
        "\(name) \(model)"
    }
}

extension Car {
    static let cars = [
        Car(name: "OMODA", model: "C5", imageName: "omoda_C5", cost: 2_189_900),
        Car(name: "OMODA", model: "S5", imageName: "omoda_S5", cost: 1_889_900),
        Car(name: "OMODA", model: "S5 GT", imageName: "omoda_S5GT", cost: 2_189_900)
    ]
}
