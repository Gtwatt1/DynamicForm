//
//  DynamicFormInteractor.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import Foundation

protocol DynamicFormInteractorProtocol {
    func fetchForm()
}

struct DynamicFormInteractor: DynamicFormInteractorProtocol {
    let service: DynamicFormServiceProtocol
    let presenter: DynamicFormPresenterProtocol
    
    func fetchForm() {
        service.getForm { result in
            switch result {
            case .success(let form):
                presenter.fetchFormSucceeds(form: form)
            case .failure(let error):
                presenter.didFailToFetchForm(error: error)
            }
        }
    }
}
