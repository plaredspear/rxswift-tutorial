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
    
    var title = PublishSubject<String?>()
    var titleLabel = PublishSubject<String?>()
    
    var searchText:String? {
        didSet {
            if let text = searchText {
                if text.characters.count > 0 {
                    titleLabel.on(.Next(text))
                } else {
                    titleLabel.on(.Next("Title"))
                }
            }
        }
    }
}
