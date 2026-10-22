//
//  SepartionClient.swift
//  TCA_TOY
//
//  Created by martin on 10/21/26.
//

import SwiftUI

struct JobStatus: Equatable {
    
    enum State: Equatable {
        case queued
        case processing
        case done
        case error
    }
    
    var state: State
    var stems: [SessionID]
    var error: String?
}
