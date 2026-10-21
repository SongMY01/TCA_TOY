//
//  JobStatus.swift
//  TCA_TOY
//
//  Created by martin on 10/21/26.
//

class JobStatus{
    var state: JobStatusState
    var stems: [SessionID]
    var error: String?
    
    init(state: JobStatusState, stems: [SessionID], error: String? = nil) {
        self.state = state
        self.stems = stems
        self.error = error
    }
}
