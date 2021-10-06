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
    func updateImageView(with data: Data)
    func updateJokeLabel(with joke: String)
}

class JokeViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    
	var presenter: JokePresenterProtocol!

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
    }

}

extension JokeViewController: JokeViewProtocol {
    func updateImageView(with data: Data) {
        imageView.image = UIImage(data: data)
        imageView.isHidden = false
    }
    
    func updateJokeLabel(with joke: String) {
        textLabel.text = joke
        textLabel.isHidden = false

    }
    
    
}
