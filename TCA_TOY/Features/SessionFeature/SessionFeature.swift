//
//  SessionFeature.swift
//  TCA_TOY
//
//  Created by martin on 10/21/26.
//

/**
 Attributes (State)
 - phase: SessionPhase = .idle
 - selectedFileURL: URL?
 - separationJobID: String?
 - tracks: [SongTrack] = []
 - songBPM: Double = 120   입력값 → Song
 - firstBeatOffset: TimeInterval = 0  입력값
 - serverURL: URL?
 - serverStatus: ServerStatus
 - sharedSongJobID: String?
 - cachedSongJobID: String?
 - @Dependency separationClient
 - @Dependency songCacheClient
 Operations (Action)
 - task          서버 찾기 · 저장된 곡 확인
 - serverDetected(URL?)
 - serverURLEntered(URL)
 - fileSelected(fileURL: URL)
 - songInfoEntered(bpm, firstBeat)
 - startSeparationTapped
 - uploadSuccessResponse(jobID)
 - uploadFailureResponse(reason)
 - statusPolled(JobStatus)
 - separationSuccessResponse
 - separationFailureResponse(reason)
 - downloadSuccessResponse(tracks)
 - downloadFailureResponse(reason)
 - openSavedSongTapped
 - sharedSongChanged(jobID, bpm,
     firstBeatOffset)
   이미 열린 곡이면 무시
 - retryTapped
 Delegate (알림)
 - songReady(Song)
 - serverChanged(URL)
 */
import SwiftUI
import ComposableArchitecture

@Reducer
struct SessionFeature{
    enum SessionPhase{
        case idle, uploading,uploadFailed, separating, separtationFaile, downloading, downloadFailed,ready
    }
    var selectedFileURL: URL?
    var separationJobID: String?
    var tracks: SongTrack
    var songBPM : Double = 120
    var firstBeatOffset: TimeInterval = 0
    var serverURL: URL?
    enum ServerStatus{
        case searching, connected, notFound
    }
    var sharedSongJobID: String?
    var cachedSongJobID: String?
    
    @Dependency
    var separationClient
    
    @Dependency
    var songCacheclient
    
}
