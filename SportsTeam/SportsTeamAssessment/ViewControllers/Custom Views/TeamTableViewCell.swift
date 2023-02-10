//
//  TeamTableViewCell.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/9/23.
//

import UIKit

// Creates a custom TableViewCell
class TeamTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    // Creates outlets from the custom cell
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playerCountLabel: UILabel!
    @IBOutlet weak var teamRankLabel: UILabel!
    
    
    //MARK: - FUNCTIONS
    // Updates cell IBOutlets with Team properties
    func updateCell(with team: Team) {
        teamNameLabel.text      = team.name
        playerCountLabel.text   = "\(team.playerCount) Players on Roster"
        teamRankLabel.text      = "# \(team.ranking)"
    } //: func UPDATE
    
} //: CLASS
