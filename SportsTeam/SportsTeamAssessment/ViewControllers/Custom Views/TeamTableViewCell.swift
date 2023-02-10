//
//  TeamTableViewCell.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/9/23.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playerCountLabel: UILabel!
    @IBOutlet weak var teamRankLabel: UILabel!
    
    
    //MARK: - FUNCTIONS
    func updateCell(with team: Team) {
        teamNameLabel.text = team.name
        playerCountLabel.text = "\(team.playerCount) Players on Roster"
        teamRankLabel.text = "# \(team.ranking)"
    } //: func UPDATE
    
} //: CLASS
