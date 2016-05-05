//
//  TableViewController.swift
//  rxswift-tutorial
//
//  Created by Youngsoo Lim on 4/26/16.
//  Copyright © 2016 example. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var addText: UIButton!
    
    let disposeBag = DisposeBag()
    
    let items = Variable<[String]>([
        "wow",
        "line",
        "brothers"
        ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rx_setDataSource(self)
        
        self.items.asObservable().subscribeNext { _ in
            self.tableView.reloadData()
        }.addDisposableTo(disposeBag)
        
        addText.rx_tap.subscribeNext { _ in
            self.items.value.append("Random \(rand() % 1000)")
        }.addDisposableTo(disposeBag)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.value.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = self.items.value[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        cell?.textLabel?.text = row
        
        return cell!
    }
    
    func tableView(tableView: UITableView,
                     viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableCellWithIdentifier("SectionHeader")?.contentView
    }
}
