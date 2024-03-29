//
//  ResultViewController.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 10/07/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var gameData = [GameInSearch]()
    var gameId: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
         
    }
    
    func something(gameId: String) {
        self.gameId = gameId
        fetchGamesOnSearch(gameId) { game in
            self.gameData.append(contentsOf: game)
            DispatchQueue.main.async {
                print(self.gameData.count)
                self.tableView.reloadData()
            }
        }
        
    }

    
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func fetchGamesOnSearch(_ query: String, onCompletion: @escaping ([GameInSearch])-> Void)  {
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        var components = URLComponents(string: "https://api.rawg.io/api/games")!
        
        components.queryItems = [
            URLQueryItem(name: "search", value: query),
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var gamesTotal = [GameInSearch]()
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let games = try? decoder.decode(GamesSearch.self, from: data) as GamesSearch {
                    gamesTotal.append(contentsOf: games.games)
                }
                onCompletion(gamesTotal)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }

}
extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier, for: indexPath) as? ResultTableViewCell {
            if gameData.count > 1 {
                let game = gameData[indexPath.row]
                cell.gameTitle.text = game.name
                if let image = game.backgroundImage {
                    let imageUrl = URL(string: image)
                    cell.coverImage.kf.setImage(with: imageUrl)
                } else {
                    print("image kosong")
                }
                
            }
            return cell
        } else {
            print("kosong")
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detail = DetailGameViewController()
        detail.gameFromSearch = gameData[indexPath.row]
//        detail.game = gameData[indexPath.row]
        
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
