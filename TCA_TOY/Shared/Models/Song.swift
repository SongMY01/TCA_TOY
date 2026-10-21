//
//  Song.swift
//  TCA_TOY
//
//  Created by martin on 10/21/26.
//

/**
 
 
 Attributes
 - id: String
 - tracks: [SongTrack]
 - bpm: Double = 120   (추가) 곡 BPM 기준
 - firstBeatOffset: TimeInterval (추가)
 사용: Session.songReady → Player.songLoaded
       (Player가 beatGrid · practice로 넘김)
 
 */
import SwiftUI

class Song{
    var id: String
    var tracks: SongTrack
    var bpm : Double = 120
    var firstBeatOffset : TimeInterval
    
    init(id: String, tracks: SongTrack,bpm:Double, firstbeatOffset: TimeInterval){
        self.id = id
        self.tracks = tracks
        self.bpm = bpm
        self.firstBeatOffset = firstbeatOffset
    }
}
