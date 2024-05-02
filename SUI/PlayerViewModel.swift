//
//  PlayerViewModel.swift
//  SUI
//
//  Created by Tixon Markin on 02.05.2024.
//

import Foundation
import AVFoundation

class PlayerViewModel: NSObject, ObservableObject {
    @Published var remainingTimeText: String? 
    @Published var trackProgress: Float {
        didSet {
            updateTimeText()
        }
    }
    @Published var currentTrack: Track! {
        didSet {
            makePlayer()
            if isPlaying {
                resume()
            }
        }
    }
    @Published var isEditing: Bool = false {
        willSet {
            if !newValue {
                player.currentTime = player.duration * Double(trackProgress)
            }
        }
    }
    @Published var isPlaying: Bool = false {
        willSet {
            newValue ? resume() : pause()
        }
    }
    
    // MARK: - Private Properties
    
    private let tracks = Track.tracks
    private var player: AVAudioPlayer!
    private lazy var timer = CADisplayLink(target: self, selector: #selector(updateProgress))
    
    // MARK: - Life Cycle
    
    init(trackProgress: Float = 0) {
        self.trackProgress = trackProgress
        super.init()
        self.currentTrack = Track.tracks[0]
        timer.add(to: .main, forMode: .default)
        timer.isPaused = !isPlaying
    }
    
    deinit {
        timer.invalidate()
        player = nil
    }
    
    // MARK: - Public Methods
    
    func previousTrack() {
        guard let currentTrackIndex = tracks.firstIndex(of: currentTrack) else { return }
        let previousTrackIndex = (currentTrackIndex - 1 + tracks.count) % tracks.count
        currentTrack = tracks[previousTrackIndex]
    }
    
    func nextTrack() {
        guard let currentTrackIndex = tracks.firstIndex(of: currentTrack) else { return }
        let nextTrackIndex = (currentTrackIndex + 1) % tracks.count
        currentTrack = tracks[nextTrackIndex]
    }
    
    // MARK: - Private Methods
    
    private func makePlayer() {
        guard  let trackURL = Bundle.main.url(forResource: currentTrack.name, withExtension: "mp3")
        else { return }
        do {
            player = nil
            player = try AVAudioPlayer(contentsOf: trackURL)
            trackProgress = 0
            player.delegate = self
            player.prepareToPlay()
            player.currentTime = player.duration * Double(trackProgress)
        } catch {}
    }
    
    private func pause() {
        player.pause()
        timer.isPaused = true
    }
    
    private func resume() {
        player.play()
        timer.isPaused = false
    }
    
    private func updateTimeText() {
        let seconds = Int((1 - Double(trackProgress)) * player.duration)
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        remainingTimeText = String(format: "%02d:%02d", minutes, remainingSeconds)
    }
    
    @objc private func updateProgress() {
        if !isEditing {
            trackProgress = Float(player.currentTime / player.duration)
        }
    }
}

extension PlayerViewModel: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        nextTrack()
    }
}
