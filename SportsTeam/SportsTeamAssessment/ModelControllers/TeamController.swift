//
//  TeamController.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/8/23.
//

import Foundation

// Creates a Controller to manage the Team Model state
class TeamController {
    
    //MARK: - PROPERTIES
    // Creates a Singleton to ensure that the app will access the same instance of the TeamContoller class.
    // static shares the property globally with the project
    // () initializes the TeamController
    static let sharedInstance = TeamController()
    // Creates a Single Source of Truth collection
    var teams: [Team] = []
    
    
    // CRUD FUNCTIONS
    //MARK: - CREATE
    // Declares a function to add items to the collection above
    func createTeam(teamName: String, teamRanking: Int, playerCount: Int) {
        // Initializes a new Team object and passed the function parameters into it
        let newTeam = Team(name: teamName, ranking: teamRanking, playerCount: playerCount)
        // Appends the newly created Team object to the collection
        teams.append(newTeam)
        
        save()
    } //: func CREATE
    
    
    //MARK: - UDATE
    // Declares a function to edit items already in the collection above
    func updateTeam(teamToUpdate: Team, newName: String, newRanking: Int, newPlayerCount: Int) {
        teamToUpdate.name           = newName
        teamToUpdate.ranking        = newRanking
        teamToUpdate.playerCount    = newPlayerCount
        
        save()
    } //: func UPDATE
    
    
    //MARK: - DELETE
    // Declares a function to delete items
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
