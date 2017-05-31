//
//  ModuleConfigurator.swift
//  SwiftyModuleTransition
//
//  Created by rock88 on 27/05/2017.
//  Copyright © 2017 rock88. All rights reserved.
//

import UIKit

struct ModuleConfigurator<View: ModuleView> where View: UIViewController {
    let source: UIViewController
    let view: View
    
    func configure<View: ModuleView>(handler: (View.Output) -> Void) -> ModuleTransition<View> {
        if let input = view.output as? View.Output {
            handler(input)
        }
        
        return ModuleTransition(source: source, destination: view)
    }
}
