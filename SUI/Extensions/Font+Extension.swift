//
//  Font+Extension.swift
//  SUI
//
//  Created by Tixon Markin on 30.04.2024.
//

import SwiftUI

/// Расширение для предоставления пользовательских шрифтов из коллекции шрифтов Inter.
extension Font {
    /// Создает экземпляр шрифта Inter с жирным начертанием.
    /// - Parameter size: Размер шрифта в точках.
    /// - Returns: Шрифт с жирным начертанием или `nil`, если такой шрифт не найден.
    static func interBold(size: CGFloat) -> Font? {
        Font.custom("Inter-Bold", size: size)
    }
    
    /// Создает экземпляр шрифта Inter со средним начертанием.
    /// - Parameter size: Размер шрифта в точках.
    /// - Returns: Шрифт со средним начертанием или `nil`, если такой шрифт не найден.
    static func interMedium(size: CGFloat) -> Font? {
        Font.custom("Inter-Medium", size: size)
    }
    
    /// Создает экземпляр шрифта Inter с обычным начертанием.
    /// - Parameter size: Размер шрифта в точках.
    /// - Returns: Шрифт с обычным начертанием или `nil`, если такой шрифт не найден.
    static func inter(size: CGFloat) -> Font? {
        Font.custom("Inter-Regular", size: size)
    }
    
    /// Создает экземпляр шрифта Inter с легким начертанием.
    /// - Parameter size: Размер шрифта в точках.
    /// - Returns: Шрифт с легким начертанием или `nil`, если такой шрифт не найден.
    static func interLight(size: CGFloat) -> Font? {
        Font.custom("Inter-Light", size: size)
    }
}
