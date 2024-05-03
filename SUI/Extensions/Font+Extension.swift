//
//  Font+Extension.swift
//  SUI
//
//  Created by Tixon Markin on 03.05.2024.
//

import SwiftUI

/// Расширение для предоставления пользовательских шрифтов
extension Font {
    /// Создает экземпляр шрифта Verdana с жирным начертанием.
    /// - Parameter size: Размер шрифта в точках.
    /// - Returns: Шрифт с жирным начертанием или `nil`, если такой шрифт не найден.
    static func verdanaBold(size: CGFloat) -> Font? {
        Font.custom("Verdana", size: size).weight(.bold)
    }
    
    /// Создает экземпляр шрифта Inter с жирным начертанием.
    /// - Parameter size: Размер шрифта в точках.
    /// - Returns: Шрифт с жирным начертанием или `nil`, если такой шрифт не найден.
    static func verdana(size: CGFloat) -> Font? {
        Font.custom("Verdana", size: size)
    }
}

