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
    
    enum Action: Equatable {
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
        case sharedSongChanged(jobID: String, bpm: Double, firstBeatOffset: TimeInterval)
        case retryTapped
        case delegate(Delegate)
        
        enum Delegate: Equatable {
            case songReady(Song)
            case serverChanged(URL)
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .fileSelected(fileURL: url): // 1
                state.selectedFileURL = url
                return .none
                
            case let .songInfoEntered(bpm: bpm, firstBeat: firstBeat): // 2,3
                state.songBPM = bpm
                state.firstBeatOffset = firstBeat
                return .none
                
            case .startSeparationTapped: // 4,5,6
                guard let file = state.selectedFileURL else {
                    return .none
                }
                guard let baseURL = state.serverURL else {
                    return .none
                }
                guard case .connected = state.serverStatus else {
                    return .none
                }
                state.phase = .uploading
                return .run { send in
                    do {
                        let jobID = try await separationClient.upload(file, baseURL)
                        await send(.uploadSuccessResponse(jobID: jobID))
                    } catch {
                        await send(.uploadFailureResponse(reason: error.localizedDescription))
                    }
                }
            }
        }
    }
    
    //
    //    @Dependency
    //    var separationClient
    //
    //    @Dependency
    //    var songCacheclient
}
