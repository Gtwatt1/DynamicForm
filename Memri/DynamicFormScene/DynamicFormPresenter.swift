//
//  DynamicFormPresenter.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import Foundation

protocol DynamicFormPresenterProtocol {
    func didFailToFetchForm(error: MemriError)
    func fetchFormSucceeds(form: Form)
}

struct DynamicFormPresenter: DynamicFormPresenterProtocol {
    weak var view: DynamicFormViewProtocol?
    func didFailToFetchForm(error: MemriError) {
        view?.displayError(error.localizedDescription)
    }
    
    func fetchFormSucceeds(form: Form) {
        view?.displayForm(form)
    }
    
}
