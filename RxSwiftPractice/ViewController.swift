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

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var viewModel: ViewModel?
    let disposebag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel(inputText: textField.rx.text.orEmpty.asDriver())
        
        viewModel?.outputText
            .drive(label.rx.text)
            .disposed(by: disposebag)
    }
}

class ViewModel {
    
    let outputText: Driver<String>
    
    init(inputText: Driver<String>) {
        self.outputText = inputText
    }
}

