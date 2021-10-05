//
//  CategoriesPresenter.swift
//  ChuckNorrisJokes
//
//  Created Evgeniy Nosko on 5.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: Presenter -
protocol CategoriesPresenterProtocol {
	var view: CategoriesViewProtocol? { get set }
    func viewDidLoad()
}

class CategoriesPresenter: CategoriesPresenterProtocol {

    weak var view: CategoriesViewProtocol?

    func viewDidLoad() {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/categories") else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(
            with: request
        ) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let categories = try? decoder.decode([String].self, from: data)
            print(categories)
        }.resume()
    }
}
