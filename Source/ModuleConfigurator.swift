//
//  ModuleConfigurator.swift
//  SwiftyModuleTransition
//
//  Created by rock88 on 27/05/2017.
//  Copyright © 2017 rock88. All rights reserved.
//

import UIKit

public protocol ModuleConfigurator: ModuleTransition {
    func configure<Input>(handler: (Input) -> Void) -> ModuleTransition
}

struct ModuleConfiguratorImpl: ModuleConfigurator {
    let source: UIViewController
    let destination: UIViewController
    let output: Any?
    
    func configure<Input>(handler: (Input) -> Void) -> ModuleTransition {
        if let input = output as? Input {
            handler(input)
        }
        
        return ModuleTransitionImpl(source: source, destination: destination)
    }
    
    public func transition(handler: (UIViewController, UIViewController) -> Void) {
        let transition = ModuleTransitionImpl(source: source, destination: destination)
        transition.transition(handler: handler)
    }
}
