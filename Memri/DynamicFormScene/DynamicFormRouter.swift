//
//  DynamicFormRouter.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import UIKit

class DynamicFormRouter {
    
    func assembleScene() -> UIViewController {
        let viewController = DynamicFormViewController()
        let repository = RemoteDynamicFormRepository()
        let service = DynamicFormService(repository: repository)
        let presenter = DynamicFormPresenter(view: viewController)
        let interactor = DynamicFormInteractor(service: service, presenter: presenter)
        viewController.interactor = interactor
        return UINavigationController(rootViewController: viewController)
    }
}
