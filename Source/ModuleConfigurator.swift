//
//  ModuleConfigurator.swift
//  SwiftyModuleTransition
//
//  Created by rock88 on 27/05/2017.
//  Copyright © 2017 rock88. All rights reserved.
//

import UIKit

public protocol ModuleConfigurator {
    func configure<Input>(handler: (Input) -> Void) -> ModuleTransition
}

struct ModuleConfiguratorImpl<View: ModuleView>: ModuleConfigurator where View: UIViewController {
    let source: UIViewController
    let view: View
    
    func configure<Input>(handler: (Input) -> Void) -> ModuleTransition {
        if let input = view.output as? Input {
            handler(input)
        }
        
        return ModuleTransitionImpl(source: source, destination: view)
    }
}
