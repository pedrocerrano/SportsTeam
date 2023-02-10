//
//  ViewController.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/8/23.
//

import UIKit

// Creates ViewController to manage the details of an object
class TeamDetailVC: UIViewController {

    //MARK: - OUTLETS
    // Creates outlets from the Storyboard
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var teamRankingTextField: UITextField!
    @IBOutlet weak var playerCountTextField: UITextField!
    
    
    //MARK: - PROPERTIES
    // Creates a "landing pad" variable to receive the data from the segue
    var teamReceiver: Team?
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    } //: DID LOAD

    
    //MARK: - ACTIONS
    // Creates an IBAction for when the "Save" button is tapped
    @IBAction func saveButtonTapped(_ sender: Any) {
        // Creates new, safely unwrapped constants from the optional TextFields
        guard let teamName      = teamNameTextField.text,
              let teamRank      = teamRankingTextField.text,
              let playerCount   = playerCountTextField.text else { return }
        
        // Creates a conditon that determines whether this Team object was newly created or is being edited/passed in from the segue, and if it was passed in, it is safely unwrapped
        if let team = teamReceiver {
            TeamController.sharedInstance.updateTeam(teamToUpdate: team, newName: teamName, newRanking: Int(teamRank) ?? 0, newPlayerCount: Int(playerCount) ?? 0)
        } else {
            TeamController.sharedInstance.createTeam(teamName: teamName, teamRanking: Int(teamRank) ?? 0, playerCount: Int(playerCount) ?? 0)
        }
        
        // Pops the view to the previous view, after the Save button is tapped
        navigationController?.popViewController(animated: true)
    } //: SAVE BUTTON
    
    
    // Creates IBAction to clear all TextFields. Calls the helper function below.
    @IBAction func clearButtonTapped(_ sender: Any) {
        resetView()
    } //: CLEAR BUTTON
    
    
    // Creates IBAction to delete the Team object
    @IBAction func deleteButtonTapped(_ sender: Any) {
        guard let teamReceiver = teamReceiver else { return }
        TeamController.sharedInstance.deleteTeam(teamToDelete: teamReceiver)
        navigationController?.popViewController(animated: true)
    } //: DELETE BUTTON
    
    
    //MARK: - HELPER FUNCTIONS
    func updateView() {
        // Safely unwraps the data received from the segue and assigns it to the properties from the corresponding  outlets
        guard let teamReceiver = teamReceiver else { return }
        teamNameTextField.text      = teamReceiver.name
        teamRankingTextField.text   = "\(teamReceiver.ranking)"
        playerCountTextField.text   = "\(teamReceiver.playerCount)"
    } //: UPDATE VIEW
    
    
    // Sets all TextFields to empty Strings
    func resetView() {
        teamNameTextField.text      = ""
        teamRankingTextField.text   = ""
        playerCountTextField.text   = ""
    } //: RESET
    
} //: CLASS

