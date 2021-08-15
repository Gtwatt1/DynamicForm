//
//  DynamicFormPresenterTests.swift
//  MemriTests
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import XCTest
@testable import Memri

class DynamicFormPresenterTests: XCTestCase {
    
    private var presenter: DynamicFormPresenter!
    private var mockView: MockView!
    
    override func setUp() {
        mockView = MockView()
        presenter = DynamicFormPresenter(view: mockView)
    }
    
    func test_when_didFailToFetchFormCalled_expect_viewDisplayErrorCalled() {
        presenter.didFailToFetchForm(error: .fileNotFound)
        XCTAssertTrue(mockView.displayErrorCalled)
    }
    
    func test_when_fetchFormSucceedsCalled_expect_viewDisplayFormCalled() {
        presenter.fetchFormSucceeds(form: [])
        XCTAssertTrue(mockView.displayFormCalled)
    }
    
}

class MockView: DynamicFormViewProtocol {
    var displayErrorCalled = false
    var displayFormCalled = false
    func displayForm(_ form: Form) {
        displayFormCalled = true
    }
    
    func displayError(_ error: String) {
        displayErrorCalled = true
    }
    
    
}
