//
//  ModuleFactory.swift
//  SwiftyModuleTransition
//
//  Created by rock88 on 27/05/2017.
//  Copyright © 2017 rock88. All rights reserved.
//

import UIKit

public struct ModuleFactory<View: ModuleView> where View: UIViewController {
    let handler: () -> View
    
    public init(handler: @escaping () -> View) {
        self.handler = handler
    }
    
    public func instantiateModuleTransitionHandler() -> View {
        return handler()
    }
}
