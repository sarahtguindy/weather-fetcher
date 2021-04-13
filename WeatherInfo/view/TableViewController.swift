//
//  TableViewController.swift
//  WeatherInfo
//
//  Created by Sarah Guindy on 2021-04-08.
//

import UIKit
import Combine

class TableViewController: UITableViewController {

    private let launchesFetcher = LaunchesFetcher.getInstance()
    private var launchList : [Launch] = [Launch]()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.launchesFetcher.fetchDataFromAPI()
        self.receiveChanges()
        
        self.tableView.rowHeight = 210
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.launchList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! TableViewCell
        
        // Configure the cell...
        
        print(#function,self.launchList[indexPath.row] )
        
//        cell.lblMissionName.text = ""
//        cell.tvStatusDetails.text = ""
//        cell.tvFailureReason.text = ""

        return cell
    }
    
    private func receiveChanges(){
        self.launchesFetcher.$launchList.receive(on: RunLoop.main)
            .sink{ (launch) in
                print(#function, "Received Launch : ", launch)
                self.launchList.removeAll()
                self.launchList.append(contentsOf: launch)
                self.tableView.reloadData()
            }
            .store(in : &cancellables)
    }
}
