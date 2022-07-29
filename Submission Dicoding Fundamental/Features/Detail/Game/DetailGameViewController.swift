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
    var gameFromSearch: GameInSearch?
    private var genreData = [Genre]()
    private var platformData = [Platforms]()
    private var developerData = [Developer]()
    private var publisherData = [Publisher]()
    private var desc: String = ""
    private var metacritic: String = ""
    private var date: String = ""
    private var imageUrl: String = ""
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FirstRowTableViewCell.self, forCellReuseIdentifier: FirstRowTableViewCell.identifier)
        tableView.register(DescTableViewCell.self, forCellReuseIdentifier: DescTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        fetchMetacritic { metacritic in
            self.metacritic.append(contentsOf: metacritic)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        fetchDate { date in
            self.date.append(contentsOf: date)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        fetchImage { imageUrl in
            self.imageUrl.append(contentsOf: imageUrl)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
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
    func fetchMetacritic(onCompletion: @escaping (String)-> Void) {
//        guard let gameSearch = gameFromSearch else {
//            return
//        }
        
        var id = ""
        if let game = game {
            id = String(game.id)
        } else if let gameFromSearch = gameFromSearch {
            id = String(gameFromSearch.id)
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        
        var components = URLComponents(string: "https://api.rawg.io/api/games/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var metacritic = ""
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let gamesDetail = try? decoder.decode(GameDetail.self, from: data) as GameDetail {
                    metacritic.append(contentsOf: String(gamesDetail.metacritic))
                } else {
                    print("nilai metacritic kosong")
                }
                onCompletion(metacritic)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchDate(onCompletion: @escaping (String)-> Void) {
        var id = ""
        if let game = game {
            id = String(game.id)
        } else if let gameFromSearch = gameFromSearch {
            id = String(gameFromSearch.id)
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        
        var components = URLComponents(string: "https://api.rawg.io/api/games/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var date = ""
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let gamesDetail = try? decoder.decode(GameDetail.self, from: data) as GameDetail {
                    date.append(contentsOf: gamesDetail.released)
                    
                } else {
                    print("nilai date kosong")
                }
                onCompletion(date)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchImage(onCompletion: @escaping (String)-> Void) {
        var id = ""
        if let game = game {
            id = String(game.id)
        } else if let gameFromSearch = gameFromSearch {
            id = String(gameFromSearch.id)
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        
        var components = URLComponents(string: "https://api.rawg.io/api/games/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var image = ""
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let gamesDetail = try? decoder.decode(GameDetail.self, from: data) as GameDetail {
                    image.append(contentsOf: gamesDetail.background_image)
                    
                } else {
                    print("nilai image kosong")
                }
                onCompletion(image)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchDescription(onCompletion: @escaping (String)-> Void) {
        var id = ""
        if let game = game {
            id = String(game.id)
        } else if let gameFromSearch = gameFromSearch {
            id = String(gameFromSearch.id)
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        
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
                    print("nilai description kosong")
                }
                onCompletion(desc)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchGenre(onCompletion: @escaping ([Genre])-> Void) {
        var id = ""
        if let game = game {
            id = String(game.id)
        } else if let gameFromSearch = gameFromSearch {
            id = String(gameFromSearch.id)
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
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
                } else {
                    print("nilai genre kosong")
                }
                onCompletion(genreTotal)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchPlatform(onCompletion: @escaping ([Platforms])-> Void) {
        var id = ""
        if let game = game {
            id = String(game.id)
        } else if let gameFromSearch = gameFromSearch {
            id = String(gameFromSearch.id)
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
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
                    
                } else {
                    print("nilai platform kosong")
                }
                onCompletion(platformTotal)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchDeveloper(onCompletion: @escaping ([Developer])-> Void) {
        var id = ""
        if let game = game {
            id = String(game.id)
        } else if let gameFromSearch = gameFromSearch {
            id = String(gameFromSearch.id)
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
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
                    
                } else {
                    print("nilai developer kosong")
                }
                onCompletion(developerTotal)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchPublisher(onCompletion: @escaping ([Publisher])-> Void) {
        var id = ""
        if let game = game {
            id = String(game.id)
        } else if let gameFromSearch = gameFromSearch {
            id = String(gameFromSearch.id)
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
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
                } else {
                    print("nilai publisher kosong")
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
                if let image = detail.backgroundImage {
                    let imageUrl = URL(string: image)
                    cell.imagePoster.kf.setImage(with: imageUrl)
                }
                cell.titleLabel.text = detail.name
            } else if let detailFromSearch = gameFromSearch {
                cell.titleLabel.text = detailFromSearch.name
                let imageUrl = URL(string: detailFromSearch.backgroundImage ?? "")
                cell.imagePoster.kf.setImage(with: imageUrl)
            }
            cell.selectionStyle = .none
            return cell
        }
        if indexPath.row == 1 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: DescTableViewCell.identifier) as! DescTableViewCell
            if let detail = game {
                let platformName = platformData.map({ $0.platform })
                let platformDetail = platformName.map({ $0.name }).joined(separator: ", ")
                let genreText = genreData.map({ $0.name }).joined(separator: ", ")
                let developerText = developerData.map({ $0.name }).joined(separator: ", ")
                let publisherText = publisherData.map({ $0.name }).joined(separator: ", ")
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let contentAbout = desc.html2String
                print(contentAbout.count)
                cell2.aboutContent.text = contentAbout
                cell2.platformsContent.text = platformDetail
                cell2.genreContent.text = genreText
                cell2.developerContent.text = developerText
                cell2.publisherContent.text = publisherText
                if let metacritic = detail.metacritic {
                    if metacritic > 80 {
                        cell2.metaCriticScoreContent.textColor = .green
                    } else if metacritic >= 60 && metacritic < 80 {
                        cell2.metaCriticScoreContent.textColor = .yellow
                    } else {
                        cell2.metaCriticScoreContent.textColor = .red
                    }
                    cell2.metaCriticScoreContent.text = String(metacritic)
                }
                if let date = detail.released {
                    cell2.releaseDateContent.text = dateFormatter.string(from: date)
                }
            } else if let detailFromSearch = gameFromSearch {
                let platformName = platformData.map({ $0.platform })
                let platformDetail = platformName.map({ $0.name }).joined(separator: ", ")
                let genreText = genreData.map({ $0.name }).joined(separator: ", ")
                let developerText = developerData.map({ $0.name }).joined(separator: ", ")
                let publisherText = publisherData.map({ $0.name }).joined(separator: ", ")
                let contentAbout = desc.html2String
                print(contentAbout.count)
                cell2.aboutContent.text = contentAbout
                cell2.platformsContent.text = platformDetail
                cell2.genreContent.text = genreText
                cell2.developerContent.text = developerText
                cell2.publisherContent.text = publisherText
                cell2.releaseDateContent.text = date
                if let metacritic = detailFromSearch.metacritic {
                    if metacritic > 80 {
                        cell2.metaCriticScoreContent.textColor = .green
                    } else if metacritic >= 60 && metacritic <= 80 {
                        cell2.metaCriticScoreContent.textColor = .yellow
                    } else {
                        cell2.metaCriticScoreContent.textColor = .red
                    }
                    cell2.metaCriticScoreContent.text = String(metacritic)
                } else {
                    if Int(metacritic) ?? 0 > 80 {
                        cell2.metaCriticScoreContent.textColor = .green
                    } else if Int(metacritic) ?? 0 >= 60 && Int(metacritic) ?? 0 <= 80 {
                        cell2.metaCriticScoreContent.textColor = .yellow
                    } else {
                        cell2.metaCriticScoreContent.textColor = .red
                    }
                    cell2.metaCriticScoreContent.text = String(metacritic)
                }
                
            }
            cell2.selectionStyle = .none
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
                if game.name.count < 16 {
                    return 300
                }
            }
            
            return 350
        }
        if indexPath.row == 1 {
            if desc.count > 1000 && desc.count < 1500 {
                return 1300
            } else if desc.count > 1500 && desc.count < 1800 {
                return 1550
            } else if desc.count > 1800 && desc.count < 2000 {
                return 1670
            } else if desc.count > 2000 && desc.count < 2300 {
                return 1800
            } else if desc.count > 2300 && desc.count < 2500 {
                return 2200
            } else if desc.count > 2500 && desc.count < 2800 {
                return 3000
            } else if desc.count > 2800 {
                return 4000
            }
            return 1100
        }
        return 300
    }
     
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

