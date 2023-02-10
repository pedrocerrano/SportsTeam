//
//  Team.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/8/23.
//

import Foundation

class Team {
    var name: String
    var playerCount: Int
    var ranking: Int
    let uuid = UUID()
    
    init(name: String, playerCount: Int, ranking: Int) {
        self.name = name
        self.playerCount = playerCount
        self.ranking = ranking
    } //: MEMBER-WISE INITIALIZER
} //: CLASS


extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.uuid == rhs.uuid
    } //: func EQUALtoSELF
} //: EXTENSION
