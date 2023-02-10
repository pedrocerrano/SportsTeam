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
    
    
    //MARK: - PROPERTIES
    var teamReceiver: Team?
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
    } //: DID LOAD

    
    //MARK: - ACTIONS
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let teamName      = teamNameTextField.text,
              let teamRank      = teamRankingTextField.text,
              let playerCount   = playerCountTextField.text else { return }
        
        TeamController.sharedInstance.createTeam(teamName: teamName, playerCount: Int(teamRank) ?? 0, teamRanking: Int(playerCount) ?? 0)
        
    } //: SAVE BUTTON
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
    } //: CLEAR BUTTON
    
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
    } //: DELETE BUTTON
    
} //: CLASS

