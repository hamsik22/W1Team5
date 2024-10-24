//
//  TeamInfo_TableView_DataSource.swift
//  W1Team5
//
//  Created by t2023-m0072 on 10/23/24.
//

import UIKit

class TeamInfoTableViewDataSource: NSObject, UITableViewDataSource {
    
    let teamData = TeamData()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamData.info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let teamInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TeamInfoTableViewCell", for: indexPath) as? TeamInfoTableViewCell else {
            return TeamInfoTableViewCell()
        }
        
        guard self.teamData.info.count >= indexPath.row - 1 else {
            return TeamInfoTableViewCell()
        }
        
        let info = self.teamData.info[indexPath.row]
        teamInfoTableViewCell.setTeamInfo(info)
        
        return teamInfoTableViewCell
    }
}



