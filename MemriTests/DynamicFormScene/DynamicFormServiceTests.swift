//
//  DynamicFormServiceTests.swift
//  MemriTests
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import XCTest
@testable import Memri

class DynamicFormServiceTests: XCTestCase {
    
    private var service: DynamicFormService!
    private var repository: MockDynamicFormRepository!
    override func setUp() {
        super.setUp()
        repository = MockDynamicFormRepository()
        service = DynamicFormService(repository: repository)
    }
    
    func test_when_getFormCalled_Expect_repositoryGetCalled() {
        service.getForm { _ in
            // implementation not needed
        }
        XCTAssertTrue(repository.getCalled)
    }
}

class MockDynamicFormRepository: DynamicFormRepository {
    var getCalled = false
    func get(completion: @escaping (Result<Form, MemriError>) -> Void) {
        getCalled = true
    }
    
    
}
