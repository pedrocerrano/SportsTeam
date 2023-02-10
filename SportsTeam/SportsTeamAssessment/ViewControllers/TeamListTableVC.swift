//
//  TeamListTableVC.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/8/23.
//

import UIKit

// Creates TableViewController to manage the List View
class TeamListTableVC: UITableViewController {
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    } //: DidLoad
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Calls the helper function that reloads the TableView
        updateTableView()
    } //: WillAppear

    
    // MARK: - TableView Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Dynamically returns the count of objects in the collection created by the Singleton which is the Model Controller
        return TeamController.sharedInstance.teams.count
    } //: #ROWS

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Guards against any issues when Type Casting the cell to a custom cell
        // Updates the Identifier to the same value from the Storyboard
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? TeamTableViewCell else { return UITableViewCell() }
        // Prevents the cell from highlighting when the user touches it
        cell.selectionStyle = .none
        
        // Creates a constant with the value assigned to the correct address for each item in the collection
        let teamIndex = TeamController.sharedInstance.teams[indexPath.row]
        // Calls the func from the custom cell to update and display data
        cell.updateCell(with: teamIndex)

        return cell
    } //: CONFIG CELL


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Creates a constant with the value assigned to the correct address for each item in the collection
            let deleteTeam = TeamController.sharedInstance.teams[indexPath.row]
            // Passes that constant to the delete function from the model controller
            TeamController.sharedInstance.deleteTeam(teamToDelete: deleteTeam)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //: DELETE
    } //: EDIT STYLE


    // MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Conditionally checks to see if the segue identifier matches "toTeamDetailVC"
        if segue.identifier == "toTeamDetailVC" {
            // Discovers what row the user has seleceted
            if let indexPath = tableView.indexPathForSelectedRow {
                // Verifies the segue destination is set correctly.
                if let destinationVC = segue.destination as? TeamDetailVC {
                    // Creates constant that allows access to the properties on that VC
                    let teamToSend = TeamController.sharedInstance.teams[indexPath.row]
                    // Sets the value of the optional receiver on the destination to the constant above
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
