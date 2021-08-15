//
//  DynamicFormRouterTests.swift
//  MemriTests
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import XCTest
@testable import Memri

class DynamicFormRouterTests: XCTestCase {
    
    func test_assembleScene() {
        let router = DynamicFormRouter()
        guard let navigationController = router.assembleScene() as? UINavigationController else {
            XCTFail("")
            return
        }
        guard let viewController = navigationController.viewControllers.first as? DynamicFormViewController else {
            XCTFail("")
            return
        }
        guard let interactor = viewController.interactor as? DynamicFormInteractor else {
            XCTFail("")
            return
        }
        
        guard let service = interactor.service as? DynamicFormService else {
            XCTFail("")
            return
        }
        
        XCTAssertTrue(interactor.presenter is DynamicFormPresenter )
        XCTAssertTrue(service.repository is RemoteDynamicFormRepository )

    }
}
