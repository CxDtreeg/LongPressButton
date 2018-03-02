# LongPressButton
This is a custom button that responds to long press events using RxSwift

How to use

```
let button = LongPressButton(type: .custom)
button.longPress
      .subscribe(onNext: {(_) in
	      //Do something
       })
      .disposed(by: self.disposeBag)
```