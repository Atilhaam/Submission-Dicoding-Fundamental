//
//  HomeViewController.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 10/06/22.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.identifier)
        return collectionView
    }()
    
    let searchController = UISearchController(searchResultsController: ResultViewController())
    private var id = ""
    private var gameData = [Game]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        setupSearchbar()
        fetchGames { game in
            self.gameData.append(contentsOf: game)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private func setUpCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func fetchGames(onCompletion: @escaping ([Game])-> Void)  {
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        let pageSize = "30"
        var components = URLComponents(string: "https://api.rawg.io/api/games")!
        
        components.queryItems = [
            URLQueryItem(name: "page_size", value: pageSize),
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var gamesTotal = [Game]()
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let games = try? decoder.decode(Games.self, from: data) as Games {
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let detail = DetailGameViewController()
        detail.game = gameData[indexPath.row]
        
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as? GameCollectionViewCell {
            let game = gameData[indexPath.row]
            if let image = game.backgroundImage {
                let imageUrl = URL(string: image)
                cell.coverImage.kf.setImage(with: imageUrl)
            }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYY"
            cell.gameTitle.text = game.name
            if let date = game.released {
                cell.releaseDateContent.text = "(\(dateFormatter.string(from: date)))"
            }
            if let metacritic = game.metacritic {
                cell.metaCriticScoreContent.text = String(metacritic)
                if metacritic > 80 {
                    cell.metaCriticScoreContent.textColor = .green
                } else if metacritic >= 60 && metacritic < 80 {
                    cell.metaCriticScoreContent.textColor = .yellow
                } else {
                    cell.metaCriticScoreContent.textColor = .red
                }
            }
            return cell
        } else {
            print("kosong")
            return UICollectionViewCell()
        }
    }
     
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - layout.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: 250)
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func setupSearchbar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchController.searchBar.text {
            
            let resultVC = searchController.searchResultsController as? ResultViewController
            resultVC?.gameId = text
            resultVC?.gameData.removeAll()
            self.navigationController?.pushViewController(resultVC!, animated: true)
            resultVC?.something(gameId: text)
            print(text)
        } else {
            print("masi kosong")
        }
    }
}

