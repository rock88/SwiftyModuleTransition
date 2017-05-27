//
//  ModuleTransitionHandler.swift
//  SwiftyModuleTransition
//
//  Created by rock88 on 27/05/2017.
//  Copyright © 2017 rock88. All rights reserved.
//

import UIKit

public protocol ModuleTransitionHandler: class {
    func openModule<View: ModuleView>(factory: ModuleFactory<View>) -> ModuleConfigurator
    func openModule<View: ModuleView>(factory: ModuleFactory<View>) -> ModuleTransition
}

extension UIViewController: ModuleTransitionHandler {
    public func openModule<View: ModuleView>(factory: ModuleFactory<View>) -> ModuleConfigurator {
        let view = factory.instantiateModuleTransitionHandler()
        return ModuleConfiguratorImpl(source: self, view: view)
    }
    
    public func openModule<View: ModuleView>(factory: ModuleFactory<View>) -> ModuleTransition {
        let view = factory.instantiateModuleTransitionHandler()
        return ModuleTransitionImpl(source: self, destination: view)
    }
}
