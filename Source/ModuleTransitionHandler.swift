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
    func close()
}

extension UIViewController: ModuleTransitionHandler {
    public func openModule<View: ModuleView>(factory: ModuleFactory<View>) -> ModuleConfigurator {
        let view = factory.instantiateModuleTransitionHandler()
        return ModuleConfiguratorImpl(source: self, destination: view, output: view.output)
    }
    
    public func close() {
        if let _ = presentingViewController {
            dismiss(animated: true, completion: nil)
        } else if let navigationController = navigationController, navigationController.viewControllers.count > 0 {
            navigationController.popViewController(animated: true)
        } else {
            view.removeFromSuperview()
        }
    }
}
