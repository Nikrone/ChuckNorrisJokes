//
//  JokePresenter.swift
//  ChuckNorrisJokes
//
//  Created Evgeniy Nosko on 5.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation



// MARK: Presenter -
protocol JokePresenterProtocol {
    var view: JokeViewProtocol? { get set }
    func viewDidLoad()
}

class JokePresenter: JokePresenterProtocol {
    
    weak var view: JokeViewProtocol?
    
    private let category: String
    private var joke: Joke?
    
    init (category: String) {
        self.category = category
    }
    
    func viewDidLoad() {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random?category=\(category)") else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(
            with: request
        ) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let joke = try?
            decoder.decode(Joke.self, from: data)
            self.joke = joke
            
            DispatchQueue.main.async {
                self.view?.updateImageView(
                    with: try! Data(
                        contentsOf: URL(
                            string: joke!.iconURL
                        )!
                    )
                )
                self.view?.updateJokeLabel(with: joke?.value ?? "")
            }
        }.resume()
        
        DispatchQueue.global().async {
            let group = DispatchGroup()
            
            for index in 0..<3 {
            group.enter()
                print("\(index) enter")
                guard let url = URL(string: "https://api.chucknorris.io/jokes/random?category=\(self.category)") else {
                    return
                }
                let request = URLRequest(url: url)
                URLSession.shared.dataTask(
                    with: request
                ) { data, response, error in
                    group.leave()
                    print("\(index) leave")
                }.resume()
            }
            group.wait()
            print("finished")
        }
    }
}
