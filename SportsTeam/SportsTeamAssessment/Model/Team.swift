//
//  Team.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/8/23.
//

import Foundation

// Declares a new data type
class Team {
    // Creates three new properties with a unique identifier for each instance
    var name: String
    var ranking: Int
    var playerCount: Int
    let uuid = UUID()
    
    // Adds the member-wise initializer, which creates the instance/blueprint of the class and initializes the declared properties
    init(name: String, ranking: Int, playerCount: Int) {
        self.name = name
        self.ranking = ranking
        self.playerCount = playerCount
    } //: MEMBER-WISE INITIALIZER
} //: CLASS


// Extends class Team to conform to Equatable protocol, to be able to perform firstIndex(of:)
extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.uuid == rhs.uuid
    } //: func EQUALtoSELF
} //: EXTENSION
