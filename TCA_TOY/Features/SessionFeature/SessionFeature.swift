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
    
    @ObservableState
    struct State: Equatable{
        var phase: SessionPhase = .idle
        var selectedFileURL: URL?
        var separationJobID: String?
        var tracks: [SongTrack] = []
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
        
        case delegate(Delegate)
        enum Delegate: Equatable{
            case songReady(Song)
            case serverChanged(URL)
        }
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .task:
                return .none
            case .serverDetected(<#T##URL?#>):
                return .none
            case .serverURLEntered(<#T##URL#>):
                return .none
            case . fileSelected(fileURL: <#T##URL#>):
                return .none
            case .songInfoEntered(bpm: <#T##Double#>, firstBeat: <#T##TimeInterval#>):
                return .none
            case .startSeparationTapped:
                return .none
            case .uploadSuccessResponse(jobID: <#T##String#>):
                return .none
            case .uploadFailureResponse(reason: <#T##String#>):
                return .none
            case .statusPolled(<#T##JobStatus#>):
                return .none
            case .separationSuccessResponse:
                return .none
            case .separationFailureResponse(reason: <#T##String#>):
                return .none
            case .downloadSuccessResponse(tracks: <#T##[SongTrack]#>):
                return .none
            case .downloadFailureResponse(reason: <#T##String#>):
                return .none
            case .openSavedSongTapped:
                return .none
            case .sharedSongChanged(jobID: <#T##String#>, bpm: <#T##Double#>, firstBeatOffset: <#T##TimeInterval#>):
                return .none
            case .retryTapped:
                return .none
            case .delegate:
                return .none
            }
        }
    }
    
    
    
}
