//
//  DynamicFormRepository.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import Foundation

protocol DynamicFormRepository {
    func get(completion: @escaping (Result<Form, MemriError>) -> Void)
}

struct LocalDynamicFormRepository: DynamicFormRepository {
    func get(completion: @escaping (Result<Form, MemriError>) -> Void) {
        // TODO: Implement a form of cache for better user experience
    }
}

struct RemoteDynamicFormRepository: DynamicFormRepository {
    private let urlSession: URLSessionProtocol
    private let urlString = "https://gist.githubusercontent.com/chaitanyapandit/daede3d24d0f31541af1242e5454f39e/raw/86068da9ef2f043b06c4a0817047ec7865dd1d02/demo.json"
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func get(completion: @escaping (Result<Form, MemriError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.network("invalid URL")))
            return
        }
        urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.network(error.localizedDescription)))
            } else if let data = data {
                do {
                    let form =  try JSONDecoder().decode(Form.self, from: data)
                    completion(.success(form))
                } catch {
                    completion(.failure(.decodingFailure))
                }
            }
        }.resume()
    }
}


protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        dataTask(with: url, completionHandler: completionHandler) as URLSessionDataTask
    }
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
