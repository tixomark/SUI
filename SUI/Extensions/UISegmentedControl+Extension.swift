//
//  UISegmentedControl+Extension.swift
//  SUI
//
//  Created by Tixon Markin on 03.05.2024.
//

import UIKit

extension UISegmentedControl {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setContentHuggingPriority(.defaultLow, for: .vertical) 
    }
}
