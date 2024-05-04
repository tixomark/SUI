//
//  vpnView.swift
//  SUI
//
//  Created by Tixon Markin on 04.05.2024.
//

import SwiftUI

struct VpnView: View {
    private enum Constants {
        static let franceLogoImageName = "franceLogo"
        static let ipAddressLabel = "IP Address"
        static let ipAddressCaption = "127.0.0.1"
        static let receivedLabel = "Received"
        static let receivedCaption = "0 MB"
        static let sentLabel = "Sent"
        static let sentCaption = "0 MB"
        static let serviceExpiryMessage = "Service will expire after 15 days."
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            Image(Constants.franceLogoImageName)
            Spacer().frame(height: 47)
            Toggle("", isOn: $isVpnOn)
                .labelsHidden()
            Spacer().frame(height: 53)
            createCaptionView(label: Constants.ipAddressLabel, caption: Constants.ipAddressCaption)
            createCaptionView(label: Constants.receivedLabel, caption: Constants.receivedCaption)
            createCaptionView(label: Constants.sentLabel, caption: Constants.sentCaption)
            Spacer()
            Text(Constants.serviceExpiryMessage)
                .font(.system(size: 18))
        }
        .foregroundStyle(.white)
        .padding(.bottom, 29).padding(.top, 80)
        .background(.black)
    }
    
    @State private var isVpnOn = false
    
    private func createCaptionView(label: String, caption: String) -> some View {
        HStack(spacing: 0) {
            Text(label)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(caption)
                .bold()
        }
        .font(.system(size: 18))
        .padding(.horizontal, 80)
        .padding(.bottom, 14)
    }
}
