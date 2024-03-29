//
//  ViewController.swift
//  Checklists
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit


class ChecklistViewController: UITableViewController {
    var items: [ChecklistItem]
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        let row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)
        let row1item = ChecklistItem()
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)
        let row2item = ChecklistItem()
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)
        let row3item = ChecklistItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)
        let row4item = ChecklistItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  func configureCheckmark(for cell: UITableViewCell,
                           with item: ChecklistItem) {
      if item.checked {
        cell.accessoryType = .checkmark
    } else {
        cell.accessoryType = .none
      }
    }
    func configureText(for cell: UITableViewCell,
                      with item: ChecklistItem) {
      let label = cell.viewWithTag(1000) as! UILabel
      label.text = item.text
    }
    override func tableView(_ tableView: UITableView,
       numberOfRowsInSection section: Int) -> Int {
        return items.count }
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
      if let cell = tableView.cellForRow(at: indexPath) {
        let item = items[indexPath.row]
        item.toggleChecked()
        configureCheckmark(for: cell, with: item)
    }
      tableView.deselectRow(at: indexPath, animated: true)
    }
        
    override func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath)
                 -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(
                            withIdentifier: "ChecklistItem",
                                       for: indexPath)
      let item = items[indexPath.row]
      configureText(for: cell, with: item)
      configureCheckmark(for: cell, with: item)
      return cell
    }
}



