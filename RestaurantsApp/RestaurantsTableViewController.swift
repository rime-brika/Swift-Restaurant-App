//
//  RestaurantsTableViewController.swift
//  RestaurantsApp
//
//  Created by rime.brika on 9/17/21.
//

import Foundation
import UIKit
import RxSwift
import SnapKit
class RestaurantsTableViewController: UITableViewController {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        NSLog("sections")
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("rows")
        return 3
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        NSLog("get cell")
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.textLabel!.text = "foo"
        return cell
    }
}
