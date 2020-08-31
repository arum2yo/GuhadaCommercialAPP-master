//
//  TimeDealPageTableViewController.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/26.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

let timedeal1 = "timedeal1"
let timedeal2 = "timedeal2"
let timedeal3 = "timedeal3"

class TimeDealPageTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.estimatedRowHeight = 100
        
        self.tableView.register(TimeDeal_1TableViewCell.self, forCellReuseIdentifier: timedeal1)
        
        self.tableView.register(UINib(nibName: "TimeDeal_2TableViewCell", bundle: nil), forCellReuseIdentifier: timedeal2)
        self.tableView.register(UINib(nibName: "TimeDeal_3TableViewCell", bundle: nil), forCellReuseIdentifier: timedeal3)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier:timedeal1, for: indexPath) as! TimeDeal_1TableViewCell
            
            cell.selectionStyle = .none
            
            return cell
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: timedeal2, for: indexPath) as! TimeDeal_2TableViewCell
            
            cell.selectionStyle = .none
            
            cell.d_dayFormat()
            
            let date = cell.expireDate
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let components = Calendar.current.dateComponents([.day, .hour], from: Date(), to: date)
            var remain = components.day!
            
            if 0 < components.hour!{
                remain += 1
            }
            
            cell.time1line_dday.text = "D- \(remain) days"
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: timedeal3, for: indexPath) as! TimeDeal_3TableViewCell
            
            cell.selectionStyle = .none
            
            cell.d_dayFormat()
            
            let date = cell.expireDate
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let components = Calendar.current.dateComponents([.day, .hour], from: Date(), to: date)
            var remain = components.day!
            
            if 0 < components.hour!{
                remain += 1
            }
            
            cell.time1line_dday.text = "D- \(remain) days"
            
            return cell
        }
        return UITableViewCell()
    }
}
