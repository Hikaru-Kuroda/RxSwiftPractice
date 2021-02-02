//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by 黑田光 on 2021/02/02.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    let count = BehaviorRelay(value: 0)
    let disposebag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindButtonToValue()
        bindCountToText()
    }

    func bindButtonToValue() {
        button.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.count.accept((self?.count.value)! + 1)
            })
            .disposed(by: disposebag)
    }
    
    func bindCountToText() {
        count.asObservable()
            .subscribe(onNext: { [weak self] count in
                self?.label.text = String(count)
            })
            .disposed(by: disposebag)
    }

}

