//
//  Dynamic.swift
//  DemoMVVM
//
//  Created by Git on 04/10/20.
//  Copyright © 2020 Github. All rights reserved.
//

import Foundation

class Dynamic<T> {
    // MARK: Properties
    typealias Listener = (T) -> Void
    var listener: [Listener] = []
    var value: T {
        didSet {
            listener.forEach({ $0(value) })
        }
    }
    
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = [listener]
    }
    
    
    func bindAndFire(listener: @escaping Listener) {
        self.listener = [listener]
        self.listener.first?(value)
    }
    
    func appendAndFire(listener: @escaping Listener) {
        self.listener.append(listener)
        listener(value)
    }
}
