//
//  ViewModel.swift
//  rxswift-tutorial
//
//  Created by Youngsoo Lim on 4/17/16.
//  Copyright © 2016 example. All rights reserved.
//

import RxCocoa
import RxSwift

class ViewModel {
    let disposeBag = DisposeBag()
    
    var task : Task? {
        didSet {
            if task?.title != nil {
                updateModel()
            }
        }
    }
    
    var title = PublishSubject<String?>()
    var titleLabel = PublishSubject<String?>()
    
    var searchText:String? {
        didSet {
            if let text = searchText {
                if text.characters.count > 0 {
                    self.task = Task(title: text)
                } else {
                    self.task = Task(title: "Title")
                }
            }
        }
    }
    
    private func updateModel() {
        titleLabel.on(.Next(task?.title))
    }
}
