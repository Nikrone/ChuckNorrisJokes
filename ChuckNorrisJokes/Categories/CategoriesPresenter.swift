//
//  CategoriesPresenter.swift
//  ChuckNorrisJokes
//
//  Created Evgeniy Nosko on 5.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: View -
protocol CategoriesViewProtocol: class {

}

// MARK: Presenter -
protocol CategoriesPresenterProtocol: class {
	var view: CategoriesViewProtocol? { get set }
    func viewDidLoad()
}

class CategoriesPresenter: CategoriesPresenterProtocol {

    weak var view: CategoriesViewProtocol?

    func viewDidLoad() {

    }
}
