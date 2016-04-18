//
//  ViewController.swift
//  rxswift-tutorial
//
//  Created by Youngsoo Lim on 4/16/16.
//  Copyright © 2016 example. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    func bindSourceToLabel(source: PublishSubject<String?>, label: UILabel) {
        source
            .subscribeNext { text in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    label.text = text
                })
            }
            .addDisposableTo(disposeBag)
    }
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var outputText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Bindin the UI
        bindSourceToLabel(viewModel.title, label: outputText)
        bindSourceToLabel(viewModel.titleLabel, label: outputText)
        
        inputText.rx_text.subscribeNext { text in
            self.viewModel.searchText = text
        }
        .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
