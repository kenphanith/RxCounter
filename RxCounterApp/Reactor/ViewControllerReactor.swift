//
//  ViewControllerReactor.swift
//  RxCounterApp
//
//  Created by ken.phanith on 2019/03/11.
//  Copyright © 2019 ken.phanith. All rights reserved.
//

import Foundation
import RxSwift
import ReactorKit

class ViewControllerReactor: Reactor {
    
    enum Action {
        case increment
        case decrement
    }
    
    enum Mutation {
        case increment
        case decrement
    }
    
    struct State {
        var counter: Int
    }
    
    var initialState: ViewControllerReactor.State = State(
        counter: 0
    )
    
    init() {
        
    }
    
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {
            
        case .increment:
            return Observable.just(Mutation.increment)
            
        case .decrement:
            return Observable.just(Mutation.decrement)
            
        }
    }
    
    func reduce(state: ViewControllerReactor.State, mutation: ViewControllerReactor.Mutation) -> ViewControllerReactor.State {
        
        var newState = state
        switch mutation {
            
        case .increment:
            newState.counter += 1
            break
        
        case .decrement:
            newState.counter -= 1
            break
        }
        return newState
    }
}
