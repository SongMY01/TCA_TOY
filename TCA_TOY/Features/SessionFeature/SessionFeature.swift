//
//  SessionFeature.swift
//  TCA_TOY
//
//  Created by martin on 10/21/26.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct SessionFeature{
    @ObservableState
    struct State: Equatable{
        enum SessionPhase{
            case idle, uploading,uploadFailed, separating, separtationFaile, downloading, downloadFailed,ready
        }
        var selectedFileURL: URL?
        var separationJobID: String?
        var tracks: [SongTrack]
        var songBPM : Double = 120
        var firstBeatOffset: TimeInterval = 0
        var serverURL: URL?
        enum ServerStatus{
            case searching, connected, notFound
        }
        var sharedSongJobID: String?
        var cachedSongJobID: String?
    }
    
    @Dependency(\.separationClient) var separationClient
    @Dependency(\.songCacheClient) var SongCacheClient
    
    enum Action: Equatable{
        
    }
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                
            }
        }
    }
    
    
    
}
