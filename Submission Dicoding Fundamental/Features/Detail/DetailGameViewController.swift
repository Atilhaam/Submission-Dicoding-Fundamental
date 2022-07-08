//
//  DetailGameViewController.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 13/06/22.
//
import UIKit
import Kingfisher

class DetailGameViewController: UIViewController {
    
    var game: Game?
    private var genreData = [Genre]()
    private var platformData = [Platforms]()
    private var developerData = [Developer]()
    private var publisherData = [Publisher]()
    private var desc: String = ""
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FirstRowTableViewCell.self, forCellReuseIdentifier: FirstRowTableViewCell.identifier)
        tableView.register(DescTableViewCell.self, forCellReuseIdentifier: DescTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        fetchDescription { desc in
            self.desc.append(contentsOf: desc)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        fetchGenre { genre in
            self.genreData.append(contentsOf: genre)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print(self.genreData.count)
        }
        
        fetchPlatform { platform in
            self.platformData.append(contentsOf: platform)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        fetchDeveloper { platform in
            self.developerData.append(contentsOf: platform)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        fetchPublisher { publisher in
            self.publisherData.append(contentsOf: publisher)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        

        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
//        tableView.estimatedRowHeight = 1000
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func fetchDescription(onCompletion: @escaping (String)-> Void) {
        guard let game = game else {
            return
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        let id = game.id
        print(id)
        var components = URLComponents(string: "https://api.rawg.io/api/games/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var desc = ""
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let gamesDetail = try? decoder.decode(GameDetail.self, from: data) as GameDetail {
                    desc.append(contentsOf: gamesDetail.description)
                    
                } else {
                    print("nil")
                }
                onCompletion(desc)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchGenre(onCompletion: @escaping ([Genre])-> Void) {
        guard let game = game else {
            return
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        let id = game.id
        var components = URLComponents(string: "https://api.rawg.io/api/games/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var genreTotal = [Genre]()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let gamesDetail = try? decoder.decode(GameDetail.self, from: data) as GameDetail {
                    genreTotal.append(contentsOf: gamesDetail.genres)
                    
                }
                onCompletion(genreTotal)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchPlatform(onCompletion: @escaping ([Platforms])-> Void) {
        guard let game = game else {
            return
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        let id = game.id
        var components = URLComponents(string: "https://api.rawg.io/api/games/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var platformTotal = [Platforms]()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let gamesDetail = try? decoder.decode(GameDetail.self, from: data) as GameDetail {
                    platformTotal.append(contentsOf: gamesDetail.platforms)
                    
                }
                onCompletion(platformTotal)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchDeveloper(onCompletion: @escaping ([Developer])-> Void) {
        guard let game = game else {
            return
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        let id = game.id
        var components = URLComponents(string: "https://api.rawg.io/api/games/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var developerTotal = [Developer]()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let gamesDetail = try? decoder.decode(GameDetail.self, from: data) as GameDetail {
                    developerTotal.append(contentsOf: gamesDetail.developers)
                    
                }
                onCompletion(developerTotal)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchPublisher(onCompletion: @escaping ([Publisher])-> Void) {
        guard let game = game else {
            return
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        let id = game.id
        var components = URLComponents(string: "https://api.rawg.io/api/games/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var publisherTotal = [Publisher]()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let gamesDetail = try? decoder.decode(GameDetail.self, from: data) as GameDetail {
                    publisherTotal.append(contentsOf: gamesDetail.publishers)
                    
                }
                onCompletion(publisherTotal)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }

}

extension DetailGameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstRowTableViewCell.identifier) as! FirstRowTableViewCell
        if indexPath.row == 0 {
            if let detail = game {
                let imageUrl = URL(string: detail.backgroundImage)
                cell.imagePoster.kf.setImage(with: imageUrl)
                cell.titleLabel.text = detail.name
            }
//            cell.selectionStyle = .none
            return cell
        }
        if indexPath.row == 1 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: DescTableViewCell.identifier) as! DescTableViewCell
            if let detail = game {
                let platformName = platformData.map({ $0.platform })
                let platformDetail = platformName.map({ $0.name }).joined(separator: ", ")
//                let platofrmText = platformData.map({"\($0)"}).joined(separator: ",")
                let genreText = genreData.map({ $0.name }).joined(separator: ", ")
                let developerText = developerData.map({ $0.name }).joined(separator: ", ")
                let publisherText = publisherData.map({ $0.name }).joined(separator: ", ")
                print(publisherText)
                cell2.aboutContent.text = desc.html2String
                cell2.platformsContent.text = platformDetail
                cell2.genreContent.text = genreText
                cell2.developerContent.text = developerText
                cell2.publisherContent.text = publisherText
                cell2.metaCriticScoreContent.text = String(detail.metacritic)
                cell2.releaseDateContent.text = detail.released
            }
//            cell2.selectionStyle = .none
            return cell2
        }
        return cell
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            if let game = game {
                if game.name.count < 10 {
                    return 300
                }
            }
            
            return 350
        }
        if indexPath.row == 1 {
            return 1100
        }
        return 300
    }
     
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

