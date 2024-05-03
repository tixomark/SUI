//
//  ContentView.swift
//  SUI
//
//  Created by Tixon Markin on 29.04.2024.
//

import SwiftUI

struct ContentView: View {
    private enum Constants {
        static let progressSliderTest = "Track progress slider"
    }
    
    @ObservedObject var model = PlayerViewModel()
    
    var body: some View {
        VStack {
            Image(model.currentTrack.albumCoverImage)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .aspectRatio(1, contentMode: .fit)
                .padding(.horizontal, 39)
            Spacer()
                .frame(maxHeight: 48)
            TrackInfoView(track: $model.currentTrack)
            Spacer()
                .frame(maxHeight: 25)
            sliderView
            Spacer()
                .frame(maxHeight: 54)
            ControlsView(isPlaying: $model.isPlaying) {
                model.previousTrack()
            } onNextTap: {
                model.nextTrack()
            }
            Spacer()
        }
        .offset(y: 61)
        .padding(.horizontal, 16)
        .background(.playerBackground)
    }
    
    var sliderView: some View {
        HStack(spacing: 16) {
            Slider(value: $model.trackProgress, in: 0...1, step: 0.001) {
                Text(Constants.progressSliderTest)
            } onEditingChanged: { editing in
                model.isEditing = editing
            }
            .tint(.white)
            .onAppear {
                UISlider.appearance().setThumbImage(UIImage.circle(diameter: 8), for: .normal)
            }
            Text(model.remainingTimeText ?? "")
                .frame(maxWidth: 50, alignment: .leading)
                .font(.system(size: 16))
                .lineLimit(1)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
