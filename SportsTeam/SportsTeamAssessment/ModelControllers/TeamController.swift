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
    func createTeam(teamName: String, playerCount: Int, teamRanking: Int) {
        let newTeam = Team(name: teamName, playerCount: playerCount, ranking: teamRanking)
        teams.append(newTeam)
        
        save()
    } //: func CREATE
    
    
    //MARK: - UDATE
    func updateTeam(teamToUpdate: Team, newName: String, newPlayerCount: Int, newRanking: Int) {
        teamToUpdate.name           = newName
        teamToUpdate.playerCount    = newPlayerCount
        teamToUpdate.ranking        = newRanking
        
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
