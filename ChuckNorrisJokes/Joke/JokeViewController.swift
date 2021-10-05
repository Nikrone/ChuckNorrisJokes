//
//  JokeViewController.swift
//  ChuckNorrisJokes
//
//  Created Evgeniy Nosko on 5.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: View -
protocol JokeViewProtocol: AnyObject {

}

class JokeViewController: UIViewController {

	var presenter: JokePresenterProtocol = JokePresenter()

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
    }

}
