//
//  ViewController.swift
//  RxCounterApp
//
//  Created by ken.phanith on 2019/03/11.
//  Copyright © 2019 ken.phanith. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, View {
    
    typealias Reactor = ViewControllerReactor
    
    var disposeBag: DisposeBag = DisposeBag()
    
    /// create UI elm
    let incrementBtn: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let decrementBtn: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let counterLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 30))

}


// MARK: - Reactor
extension ViewController {
    
    func bind(reactor: ViewControllerReactor) {
        
        self.incrementBtn.rx.tap
            .map { Reactor.Action.increment }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.decrementBtn.rx.tap
            .map { Reactor.Action.decrement }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.reactor?.state
            .map { String($0.counter) }
            .bind(to: self.counterLabel.rx.text)
            .disposed(by: self.disposeBag)
        
    }
    
}


// MARK: - LIFECYCLE
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // positioning
        self.incrementBtn.center = CGPoint(x: (self.view.frame.size.width / 2) + 50, y: self.view.frame.size.height / 2)
        self.decrementBtn.center = CGPoint(x: (self.view.frame.size.width / 2) - 50, y: self.view.frame.size.height / 2)
        self.counterLabel.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        
        /// set btn title
        self.incrementBtn.setTitle("+", for: .normal)
        self.decrementBtn.setTitle("-", for: .normal)
        self.counterLabel.text = "0"
        
        /// set btn background
        self.incrementBtn.backgroundColor = UIColor.gray
        self.decrementBtn.backgroundColor = UIColor.gray
        
        /// add subviews
        self.view.addSubview(incrementBtn)
        self.view.addSubview(decrementBtn)
        self.view.addSubview(counterLabel)
        
        self.reactor = ViewControllerReactor()
    }
    
}
