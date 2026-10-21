//
//  SessionFeature.swift
//  TCA_TOY
//
//  Created by martin on 10/21/26.
//

import SwiftUI
import ComposableArchitecture

enum SessionPhase: Equatable{
    case idle, uploading
    case uploadFailed(reason: String)
    case separating
    case separationFailed(reason: String)
    case downloading
    case downloadFailed(reason: String)
    case ready
}

enum ServerStatus: Equatable{
    case searching
    case connected(name: String)
    case notFound
}


@Reducer
struct SessionFeature{
    @ObservableState
    struct State: Equatable{
        var phase: SessionPhase = .idle
        var selectedFileURL: URL?
        var separationJobID: String?
        var tracks: [SongTrack]
        var songBPM : Double = 120
        var firstBeatOffset: TimeInterval = 0
        var serverURL: URL?
        var serverStatuss: ServerStatus = .searching
        var sharedSongJobID: String?
        var cachedSongJobID: String?
    }
    
    @Dependency(\.separationClient) var separationClient
    @Dependency(\.songCacheClient) var SongCacheClient
    
    enum Action: Equatable{
        case task
        case serverDetected(URL?)
        case serverURLEntered(URL)
        case fileSelected(fileURL: URL)
        case songInfoEntered(bpm: Double, firstBeat: TimeInterval)
        case startSeparationTapped
        case uploadSuccessResponse(jobID: String)
        case uploadFailureResponse(reason: String)
        case statusPolled(JobStatus)
        case separationSuccessResponse
        case separationFailureResponse(reason: String)
        case downloadSuccessResponse(tracks: [SongTrack])
        case downloadFailureResponse(reason: String)
        case openSavedSongTapped
        case sharedSongChanged(jobID: String, bpm: Double, firstBeatOffset:TimeInterval)
        case retryTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                
            }
        }
    }
    
    
    
}
