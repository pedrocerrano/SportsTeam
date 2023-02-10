//
//  TeamListTableVC.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/8/23.
//

import UIKit

class TeamListTableVC: UITableViewController {
    
    //MARK: - LIFECYCLE
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.reloadData()
//    } //: DID LOAD
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    } //: willAPPEAR

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TeamController.sharedInstance.teams.count
    } //: #ROWS

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    } //: ROW HEIGHT

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? TeamTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        let teamIndex = TeamController.sharedInstance.teams[indexPath.row]
        cell.updateCell(with: teamIndex)

        return cell
    } //: CONFIG CELL


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    } //: EDIT CELL


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditTeamDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? TeamDetailVC {
                    let editTeam = TeamController.sharedInstance.teams[indexPath.row]
                    destinationVC.teamReceiver = editTeam
                } //: DESTINATION
            } //: INDEX
        } //: IDENTIFIER
    } //: SEGUE

    
    //MARK: - HELPER
    func updateTableView() {
        self.tableView.reloadData()
    } //: HELPER
    
} //: CLASS
