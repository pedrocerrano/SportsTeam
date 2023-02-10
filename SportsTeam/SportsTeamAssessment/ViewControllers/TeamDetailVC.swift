//
//  ViewController.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/8/23.
//

import UIKit

class TeamDetailVC: UIViewController {

    //MARK: - OUTLETS
    
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var teamRankingTextField: UITextField!
    @IBOutlet weak var playerCountTextField: UITextField!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    //MARK: - PROPERTIES
    var teamReceiver: Team?
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    } //: DID LOAD

    
    //MARK: - ACTIONS
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let teamName      = teamNameTextField.text,
              let teamRank      = teamRankingTextField.text,
              let playerCount   = playerCountTextField.text else { return }
        
        if let team = teamReceiver {
            TeamController.sharedInstance.updateTeam(teamToUpdate: team, newName: teamName, newRanking: Int(teamRank) ?? 0, newPlayerCount: Int(playerCount) ?? 0)
        } else {
            TeamController.sharedInstance.createTeam(teamName: teamName, teamRanking: Int(teamRank) ?? 0, playerCount: Int(playerCount) ?? 0)
        }
        
        navigationController?.popViewController(animated: true)
    } //: SAVE BUTTON
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        resetView()
    } //: CLEAR BUTTON
    
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        guard let teamReceiver = teamReceiver else { return }
        TeamController.sharedInstance.deleteTeam(teamToDelete: teamReceiver)
        navigationController?.popViewController(animated: true)
    } //: DELETE BUTTON
    
    
    //MARK: - HELPER FUNCTIONS
    func updateView() {
        guard let teamReceiver = teamReceiver else { return }
        teamNameTextField.text      = teamReceiver.name
        teamRankingTextField.text   = "\(teamReceiver.ranking)"
        playerCountTextField.text   = "\(teamReceiver.playerCount)"
    } //: UPDATE VIEW
    
    func resetView() {
        teamNameTextField.text      = ""
        teamRankingTextField.text   = ""
        playerCountTextField.text   = ""
    } //: RESET
    
} //: CLASS

