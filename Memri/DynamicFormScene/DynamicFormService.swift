//
//  DynamicFormService.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import Foundation

protocol DynamicFormServiceProtocol {
    func getForm(completion: @escaping (Result<Form, MemriError>) -> Void)
}

struct DynamicFormService: DynamicFormServiceProtocol {
    let repository: DynamicFormRepository
    
    func getForm(completion: @escaping (Result<Form, MemriError>) -> Void) {
        repository.get(completion: completion)
    }
}
