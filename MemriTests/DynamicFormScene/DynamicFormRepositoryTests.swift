//
//  DynamicFormRepositoryTests.swift
//  MemriTests
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import XCTest
@testable import Memri

class RemoteDynamicFormRepositoryTests: XCTestCase {
    private var mockURLSession: MockURLSession!
    private var repository: RemoteDynamicFormRepository!
    
    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        repository = RemoteDynamicFormRepository(urlSession:mockURLSession )
    }
    
    func test_when_getCalledAndRequestFailed_expect_errorReturns() {
        mockURLSession.returnError = true
        let expectation = expectation(description: "wait for test")
        repository.get { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, MemriError.decodingFailure.localizedDescription)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func test_when_getCalledSucceeds_expect_FormReturns() {
        mockURLSession.returnError = false
        let expectation = expectation(description: "wait for test")
        repository.get { result in
            switch result {
            case .success(let form):
                XCTAssertEqual(form.count, 2)
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}

class MockURLSession: URLSessionProtocol {
    var returnError = false
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        if returnError {
            completionHandler(nil, nil, MemriError.decodingFailure)
        } else {
            let data = Data("[{\"type\":\"Image\",\"height\":\"100em\",\"width\":\"100em\",\"url\":\"https://memri.io/assets/images/memri_01.png\"},{\"type\":\"Row\",\"alignment\":\"trailing\",\"height\":\"100em\",\"width\":\"100em\",\"data\":[\"https://memri.io/assets/images/memri_01.png\",\"https://memri.io/assets/images/memri_components.svg\"]}]".utf8)
            completionHandler(data, nil, nil)
        }
        return MockURLSessionDataTask()
    }
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    func resume() {}
}
