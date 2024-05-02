//
//  Track.swift
//  SUI
//
//  Created by Tixon Markin on 02.05.2024.
//

import Foundation

/// Описывает экземпляр музыкального трека
struct Track: Equatable {
    var albumCoverImage: String
    var name: String
    var artist: String
}

extension Track {
    /// Массив содержаций все треки
    static var tracks = [
        Track(
            albumCoverImage: "valleyOfTheDammedCover",
            name: "Valley Of The Damned",
            artist: "Dragonforce"
        ),
        Track(
            albumCoverImage: "standaloneComplexCover",
            name: "Lithium Flower",
            artist: "Scott Matthew"
        ),
        Track(
            albumCoverImage: "longRoadOutOfEdenCover",
            name: "Long Road Out Of Eden",
            artist: "Eagles"
        ),
        Track(
            albumCoverImage: "novocaineForTheSoulCover",
            name: "Novocaine For The Soul",
            artist: "eels"
        ),
        Track(albumCoverImage: "MLPCover", name: "The Magic of Friendship Grows", artist: "Mane Six"),
        Track(albumCoverImage: "berserkerCover", name: "Ghost In the Rain", artist: "Beast In Black")
    ]
}
