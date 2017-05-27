//
//  ModuleTransition.swift
//  SwiftyModuleTransition
//
//  Created by rock88 on 27/05/2017.
//  Copyright © 2017 rock88. All rights reserved.
//

import UIKit

public protocol ModuleTransition {
    func transition(handler: (UIViewController, UIViewController) -> Void)
}

struct ModuleTransitionImpl: ModuleTransition {
    let source: UIViewController
    let destination: UIViewController
    
    func transition(handler: (UIViewController, UIViewController) -> Void) {
        handler(source, destination)
    }
}
