//
//  ModuleView.swift
//  SwiftyModuleTransition
//
//  Created by rock88 on 27/05/2017.
//  Copyright © 2017 rock88. All rights reserved.
//

import Foundation

private protocol ModuleInput: class {
    
}

public protocol ModuleView {
    associatedtype Output // Can't inherit from ModuleInput because currently Swift don't allow use other protocols for output var
    var output: Output! { get }
}
