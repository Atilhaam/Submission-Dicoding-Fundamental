//
//  HomeViewController.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 10/06/22.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    private var gameData = [Game]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .darkGray
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        fetchGames { game in
            self.gameData.append(contentsOf: game)
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            print(self.gameData.count)
        }
        // Do any additional setup after loading the view.
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
//        NSLayoutConstraint.activate([
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        ])
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
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
            let imageUrl = URL(string: game.backgroundImage)
            cell.coverImage.kf.setImage(with: imageUrl)
            cell.gameTitle.text = game.name
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

