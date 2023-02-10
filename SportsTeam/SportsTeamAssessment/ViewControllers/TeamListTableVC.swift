//
//  TeamListTableVC.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/8/23.
//

import UIKit

class TeamListTableVC: UITableViewController {
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

    } //: DidLoad
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    } //: WillAppear

    
    // MARK: - TableView Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TeamController.sharedInstance.teams.count
    } //: #ROWS

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? TeamTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        let teamIndex = TeamController.sharedInstance.teams[indexPath.row]
        cell.updateCell(with: teamIndex)

        return cell
    } //: CONFIG CELL


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteTeam = TeamController.sharedInstance.teams[indexPath.row]
            TeamController.sharedInstance.deleteTeam(teamToDelete: deleteTeam)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //: DELETE
    } //: EDIT STYLE


    // MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTeamDetailVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? TeamDetailVC {
                    let teamToSend = TeamController.sharedInstance.teams[indexPath.row]
                    destinationVC.teamReceiver = teamToSend
                } //: DESTINATION
            } //: INDEX
        } //: IDENTIFIER
    } //: SEGUE

    
    //MARK: - HELPER
    func updateTableView() {
        self.tableView.reloadData()
    } //: HELPER
    
} //: CLASS
