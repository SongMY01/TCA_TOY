//
//  Person.swift
//  TCA_TOY
//
//  Created by martin on 10/21/26.
//
import ComposableArchitecture
import Foundation

struct Person: Equatable{
    var id: UUID
    var name: String
    var part: SessionID
}
