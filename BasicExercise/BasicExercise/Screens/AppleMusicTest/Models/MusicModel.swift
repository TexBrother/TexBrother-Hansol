//
//  MusicModel.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/09/01.
//

import Foundation

// MARK - MusicModel

struct MusicModel {
    var musicAlbumTitle: String
    var musicTitle: String
    var singerName: String
    
    init() {
        self.musicAlbumTitle = ""
        self.musicTitle = ""
        self.singerName = ""
    }
    
    init(albumImage: String, musicTitle: String, singerName: String) {
        self.musicAlbumTitle = albumImage
        self.musicTitle = musicTitle
        self.singerName = singerName
    }
}
