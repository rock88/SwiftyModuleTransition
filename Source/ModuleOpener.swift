//
//  ModuleOpener.swift
//  SwiftyModuleTransition
//
//  Created by rock88 on 31/05/2017.
//  Copyright © 2017 rock88. All rights reserved.
//

import UIKit

public struct ModuleOpener<View: ModuleView> where View: UIViewController {
    internal let source: UIViewController
    internal let view: View
    
    func configure(handler: (View.Output) -> Void) -> ModuleTransition<View> {
        let configurator = ModuleConfigurator(source: source, view: view)
        return configurator.configure(handler: handler)
    }
    
    func transition(handler: (UIViewController, UIViewController) -> Void) {
        let transition = ModuleTransition<View>(source: source, destination: view)
        return transition.transition(handler: handler)
    }
}
