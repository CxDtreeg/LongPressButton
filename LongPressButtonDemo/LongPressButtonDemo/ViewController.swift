//
//  ViewController.swift
//  LongPressButtonDemo
//
//  Created by CxDtreeg on 2018/3/2.
//  Copyright © 2018年 CxDtreeg. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    var num:Int = 0
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = LongPressButton(type: .custom)
        button.setTitle("tap", for: .normal)
        button.backgroundColor = .blue
        button.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        button.longPress
            .subscribe(onNext: {[unowned self] (button) in
                self.num += 1
                print("\(self.num)")
            })
            .disposed(by: self.disposeBag)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

