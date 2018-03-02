//
//  LongPressButton.swift
//  LongPressButtonDemo
//
//  Created by CxDtreeg on 2018/3/2.
//  Copyright © 2018年 CxDtreeg. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LongPressButton: UIButton {
    let disposeBag:DisposeBag = DisposeBag()
    var timeDisposeBag:DisposeBag? = DisposeBag()
    var longPress:PublishSubject<UIButton> = PublishSubject<UIButton>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let observe =  Observable.merge([self.rx.controlEvent(.touchUpInside).asObservable(),self.rx.controlEvent(.touchUpOutside).asObservable(),self.rx.controlEvent(.touchCancel).asObservable()])
        observe.subscribe(onNext: {[unowned self] (_) in
            self.timeDisposeBag = nil
        }).disposed(by: self.disposeBag)
        
        self.rx.controlEvent(.touchDown).subscribe(onNext: {[unowned self] (_) in
            self.startTimer()
        }).disposed(by: self.disposeBag)
    }
    
    func startTimer() {
        timeDisposeBag = DisposeBag()
        Observable<Int>
            .interval(0.05, scheduler: MainScheduler.instance)
            .subscribe(onNext: {[unowned self] (_) in
                self.longPress.onNext(self)
            })
            .disposed(by: self.timeDisposeBag!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
