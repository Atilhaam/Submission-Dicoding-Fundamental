//
//  CreatorViewController.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 10/06/22.
//

import UIKit
import Kingfisher

class CreatorViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CreatorCollectionViewCell.self, forCellWithReuseIdentifier: CreatorCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private var creatorData = [Creator]()
    private var positionData = [Position]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Creator"
        setupCollectionView()
        
        fetchCreator { creator in
            self.creatorData.append(contentsOf: creator)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    private func setupCollectionView() {
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
    
    func fetchCreator(onCompletion: @escaping ([Creator])-> Void) {
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        var components = URLComponents(string: "https://api.rawg.io/api/creators")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var creatorsTotal = [Creator]()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let creator = try? decoder.decode(Creators.self, from: data) as Creators {
                    creatorsTotal.append(contentsOf: creator.creators)
                }
                onCompletion(creatorsTotal)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchCreatorGames(onCompletion: @escaping ([GameCreator])-> Void) {
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        var components = URLComponents(string: "https://api.rawg.io/api/creators")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var creatorGamesTotal = [GameCreator]()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let creator = try? decoder.decode(Creator.self, from: data) as Creator {
                    creatorGamesTotal.append(contentsOf: creator.games)
                }
                onCompletion(creatorGamesTotal)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
}

extension CreatorViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return creatorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let detail = DetailCreatorViewController()
        detail.creator = creatorData[indexPath.row]        
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreatorCollectionViewCell.identifier, for: indexPath) as? CreatorCollectionViewCell {
            let creator = creatorData[indexPath.row]
            let imageUrl = URL(string: creator.image)
            cell.coverImage.kf.setImage(with: imageUrl)
            cell.creatorTitle.text = creator.name
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
