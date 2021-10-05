//
//  CategoriesViewController.swift
//  ChuckNorrisJokes
//
//  Created Evgeniy Nosko on 5.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class CategoriesViewController: UIViewController, CategoriesViewProtocol {

	var presenter: CategoriesPresenterProtocol = CategoriesPresenter()

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
    }

}
