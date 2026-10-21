//
//  SessionFeature.swift
//  TCA_TOY
//
//  Created by martin on 10/21/26.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct SessionFeature: Reducer {

    @ObservableState
    struct State: Equatable {
        enum SessionPhase: Equatable {
            case idle
            case uploading
            case uploadFailed(reason: String)
            case separating
            case separationFailed(reason: String)
            case downloading
            case downloadFailed(reason: String)
            case ready
        }
        
        var phase: SessionPhase = .idle
        var selectedFileURL: URL?
        var separationJobID: String?
        var tracks: [SongTrack] = []
        var songBPM: Double = 120
        var firstBeatOffset: TimeInterval = 0
        var serverURL: URL?
        
        enum ServerStatus: Equatable {
            case idle
            case searching
            case connected(name: String)
            case notFound
        }
        
        var serverStatus: ServerStatus = .idle
        var sharedSongJobID: String?
        var cachedSongJobID: String?
    }
    
    struct Action: Equatable {
        
    }
//
//    @Dependency
//    var separationClient
//    
//    @Dependency
//    var songCacheclient
    
}
