//
//  SwiftyModuleTransitionTests.swift
//  SwiftyModuleTransitionTests
//
//  Created by rock88 on 27/05/2017.
//  Copyright © 2017 rock88. All rights reserved.
//

import XCTest
@testable import SwiftyModuleTransition

class Presenter {
    weak var view: AnyObject?
}

class View: UIViewController, ModuleView {
    var output: Any!
}

class SwiftyModuleTransitionTests: XCTestCase {
    
    let factory = ModuleFactory { () -> View in
        let view = View()
        let presenter = Presenter()
        presenter.view = view
        view.output = presenter
        return view
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFactory() {
        let view = factory.instantiateModuleTransitionHandler()
        let presenter = view.output as? Presenter
        
        XCTAssertNotNil(presenter)
        XCTAssertNotNil(presenter?.view)
    }
}
