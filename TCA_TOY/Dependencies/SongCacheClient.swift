//
//  SongCacheClient.swift
//  TCA_TOY
//
//  Created by martin on 10/21/26.
//

import ComposableArchitecture
import Foundation

@DependencyClient
struct SongCacheClient {
    var cachedURL: (_ jobID: String,_ stem: SessionID) async throws -> URL?
    var isComplete: (_ jobID: Bool) async throws -> Bool
    var store: (_ tempFile: Data, _ jobID: String, _ stem: SessionID) async throws -> URL
    var lastJobID: () async throws -> String?
    var markOpened:(_ jobID: String) async throws -> Void
}

// Conform to DependencyKey to provide a live implementation of
// the interface.
extension SongCacheClient: DependencyKey{
    static let liveValue = Self()
}

// Register the dependency within DependencyValues.
extension DependencyValues {
  var songCacheClient: SongCacheClient {
    get { self[SongCacheClient.self] }
    set { self[SongCacheClient.self] = newValue }
  }
}
