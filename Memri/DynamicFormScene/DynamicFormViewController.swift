//
//  DynamicFormViewController.swift
//  Memri
//
//  Created by Olorunshola Godwin on 14/08/2021.
//

import UIKit

protocol DynamicFormViewProtocol: AnyObject {
    func displayForm(_ form: Form)
    func displayError(_ error: String)
}

class DynamicFormViewController: UITableViewController {

    private var form = Form()
    var interactor: DynamicFormInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Memri"
        interactor?.fetchForm()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CellFactory().getCell(cellType: form[indexPath.row].type)
        cell.setupCell(with: form[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return form.count
    }
}

extension DynamicFormViewController: DynamicFormViewProtocol {
    func displayForm(_ form: Form) {
        self.form = form
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func displayError(_ error: String) {
        // TODO: display alert dialog
    }
    
}














