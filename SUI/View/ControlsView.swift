//
//  ControlsView.swift
//  SUI
//
//  Created by Tixon Markin on 02.05.2024.
//

import SwiftUI

struct ControlsView: View {
    @Binding var isPlaying: Bool
    
    var onPreviousTap: (() -> ())
    var onNextTap: (() -> ())
    
    var body: some View {
        HStack(spacing: 32) {
            Button {
                onPreviousTap()
            } label: {
                Image(.skipPrevious)
            }
            Button {
                isPlaying.toggle()
            } label: {
                Image(isPlaying ? .pauseCircleFilled : .playCircleFilled)
            }
            Button {
                onNextTap()
            } label: {
                Image(.skipNext)
            }
        }
    }
}
