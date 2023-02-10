//
//  TeamController.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/8/23.
//

import Foundation

class TeamController {
    static let sharedInstance = TeamController()
    var teams: [Team] = []
    
    // CRUD FUNCTIONS
    //MARK: - CREATE
    func createTeam(teamName: String, teamRanking: Int, playerCount: Int) {
        let newTeam = Team(name: teamName, ranking: teamRanking, playerCount: playerCount)
        teams.append(newTeam)
        
        save()
    } //: func CREATE
    
    
    //MARK: - UDATE
    func updateTeam(teamToUpdate: Team, newName: String, newRanking: Int, newPlayerCount: Int) {
        teamToUpdate.name           = newName
        teamToUpdate.ranking        = newRanking
        teamToUpdate.playerCount    = newPlayerCount
        
        save()
    } //: func UPDATE
    
    
    //MARK: - DELETE
    func deleteTeam(teamToDelete: Team) {
        guard let index = teams.firstIndex(of: teamToDelete) else { return }
        teams.remove(at: index)
        
        save()
    } //: func DELETE
    
    
    // PERSISTENCE
    //MARK: - SAVE
    func save() {
        
    } //: SAVE
    
    
    //MARK: - LOAD
    func load() {
        
    } //: LOAD
    
} //: CLASS
