//
//  UserInfoView.swift
//  SUI
//
//  Created by Tixon Markin on 01.05.2024.
//

import SwiftUI

/// Вью для отображения информации о профиле пользователя
struct UserProfileView: View {
    
    var image: ImageResource
    var name: String
    var caption: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(image)
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.primary)
                Text(caption)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.secondary)
            }
        }
    }
}
