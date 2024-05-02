//
//  TrackInfoView.swift
//  SUI
//
//  Created by Tixon Markin on 02.05.2024.
//

import SwiftUI

struct TrackInfoView: View {
    private enum Constants {
        static let downloadSavedMessage = "\"%@\" сохранен в папку загрузки"
        static let downloadAlertOk = "Ok"
        static let sharePrompt = "Поделиться?"
        static let shareNo = "Нет"
        static let shareYes = "Да"
    }

    @Binding var track: Track
    
    @State private var isShowingShareAlert = false
    @State private var isShowingDownloadAlert = false
    
    var body: some View {
        HStack(spacing: 8) {
            Image(track.albumCoverImage)
                .resizable()
                .clipShape(Circle())
                .aspectRatio(1, contentMode: .fit)
            VStack(alignment: .leading, spacing: 0) {
                Text(track.name)
                    .font(.system(size: 14, weight: .bold))
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .foregroundStyle(.white)
                Text(track.artist)
                    .font(.system(size: 14))
                    .foregroundStyle(.lightWhite)
                    .frame(height: 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            HStack(spacing: 4) {
                downloadButton
                shareButton
            }
            .padding(.top, 3)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
    }
    
    private var downloadButton: some View {
        Button {
            isShowingDownloadAlert = true
        } label: {
            Image(.download)
        }
        .confirmationDialog(String(format: Constants.downloadSavedMessage, track.name), isPresented: $isShowingDownloadAlert, titleVisibility: .visible) {
            Button(Constants.downloadAlertOk, role: .cancel) {}
        }
    }
    
    private var shareButton: some View {
        Button {
            isShowingShareAlert = true
        } label: {
            Image(.share)
        }
        .alert(Constants.sharePrompt, isPresented: $isShowingShareAlert) {
            Button(Constants.shareNo, role: .cancel) {}
            Button(Constants.shareYes) {}
                .keyboardShortcut(.defaultAction)
        }
    }
}

