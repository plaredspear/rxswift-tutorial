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

class TableViewController : UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    let items = Variable<[String]>([
        "wow",
        "line",
        "brothers"
        ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.asObservable().bindTo(self.tableView.rx_itemsWithCellIdentifier("Cell")) { (row, item, cell: UITableViewCell) in
            
            cell.textLabel?.text = item
            
        }.addDisposableTo(disposeBag)
    }
}
