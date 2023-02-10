//
//  Team.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/8/23.
//

import Foundation

class Team {
    var name: String
    var ranking: Int
    var playerCount: Int
    let uuid = UUID()
    
    init(name: String, ranking: Int, playerCount: Int) {
        self.name = name
        self.ranking = ranking
        self.playerCount = playerCount
    } //: MEMBER-WISE INITIALIZER
} //: CLASS


extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.uuid == rhs.uuid
    } //: func EQUALtoSELF
} //: EXTENSION
