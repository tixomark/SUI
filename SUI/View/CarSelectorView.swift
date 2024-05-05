//
//  CarSelectorView.swift
//  SUI
//
//  Created by Tixon Markin on 03.05.2024.
//

import SwiftUI

struct CarSelectorView: View {
    @State var isActivityPresent = false

    @Binding var selection: Int
    @Binding var cars: [Car]
    
    var body: some View {
        VStack(spacing: 22) {
            ZStack {
                Image(.omodaLogo)
                Button { isActivityPresent = true } label: { Image(.share) }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .sheet(isPresented: $isActivityPresent) {
                    ActivityView(activityItems: [cars[selection].description])
                }
            }
            Image(cars[selection].imageName)
                .frame(height: 180)
            Picker("", selection: $selection) {
                ForEach(0..<cars.count, id: \.self) {
                    Text(cars[$0].model)
                        .font(.verdana(size: 14))
                }
            }
            .pickerStyle(.segmented)
            .frame(maxHeight: 44)
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.white))
        }
        .overlay(alignment: .topTrailing) {
            
        }
    }
}
