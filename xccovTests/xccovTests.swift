//
//  xccovTests.swift
//  xccovTests
//
//  Created by Peter Sobkowski on 2018-04-21.
//  Copyright © 2018 BioConnect. All rights reserved.
//

import XCTest
@testable import xccov

class xccovTests: XCTestCase {
    
    var testSubject: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: Bundle.main)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        testSubject = navigationController.topViewController as! ViewController
        
        UIApplication.shared.keyWindow!.rootViewController = testSubject
        
        XCTAssertNotNil(navigationController.view)
        XCTAssertNotNil(testSubject.view)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewContainsFiveLabels() {
        XCTAssertEqual(testSubject.view.subviews.count, 5)
        
        testSubject.view.subviews.forEach { (view) in
            XCTAssertTrue(view.isKind(of: UILabel.self))
        }
    }
    
    
}
