//
//  DynamicFormInteractorTests.swift
//  MemriTests
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import XCTest
@testable import Memri

class DynamicFormInteractorTests: XCTestCase {
    
    private var interator: DynamicFormInteractor!
    private var service: MockService!
    private var presenter: MockPresenter!

    override func setUp() {
        super.setUp()
        service = MockService()
        presenter = MockPresenter()
        interator = DynamicFormInteractor(service: service, presenter: presenter)
    }
    
    func test_when_fetchFormSucceeds_expect_preseterFetchFormSucceedsCalled() {
        interator.fetchForm()
        XCTAssertTrue(presenter.fetchFormSucceedsCalled)
    }
    
    func test_when_fetchFormFails_expect_presenterDidFailToFetchFormCalled() {
        service.returnFailure = true
        interator.fetchForm()
        XCTAssertTrue(presenter.didFailToFetchFormCalled)
    }
}

class MockService: DynamicFormServiceProtocol {
    var returnFailure = false
    func getForm(completion: @escaping (Result<Form, MemriError>) -> Void) {
        if returnFailure {
            completion(.failure(.fileNotFound))
        } else {
            completion(.success([]))
        }
    }
    
    
}

class MockPresenter: DynamicFormPresenterProtocol {
    var fetchFormSucceedsCalled = false
    var didFailToFetchFormCalled = false
    func didFailToFetchForm(error: MemriError) {
        didFailToFetchFormCalled = true
    }
    
    func fetchFormSucceeds(form: Form) {
        fetchFormSucceedsCalled = true
    }
    
    
}
