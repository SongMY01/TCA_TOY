//
//  SepartionClient.swift
//  TCA_TOY
//
//  Created by martin on 10/21/26.
//

import ComposableArchitecture
import Foundation

@DependencyClient
struct SeparationClient {
    var health: (_ baseURL: URL) async throws -> Bool
    var upload: (_ file: Data,_ baseURL: URL) async throws -> String
    var status: (_ jobID: String, _ baseURL: URL) async throws -> JobStatus
    var downloadStem: (_ jobID: String, _ stem: SessionID) async throws -> Data
}

// Conform to DependencyKey to provide a live implementation of
// the interface.
extension SeparationClient: DependencyKey{
    static let liveValue = Self(
        health: { _ in
            try? await Task.sleep(for: .milliseconds(500))
            return true
        },
        upload: { _, _ in
            try? await Task.sleep(for: .milliseconds(500))
            return "2"
        },
        status: { _, _ in
            try? await Task.sleep(for: .milliseconds(500))
            return JobStatus(
                state: .done,
                stems: [.vocal, .drums, .bass, .guitar, .piano]
            )
        },
        downloadStem: { _, _ in
            try? await Task.sleep(for: .milliseconds(500))
            return Data()
        }
    )
}

// Register the dependency within DependencyValues.
extension DependencyValues {
  var separationClient: SeparationClient {
    get { self[SeparationClient.self] }
    set { self[SeparationClient.self] = newValue }
  }
}
