//
//  DetailCreatorViewController.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 09/07/22.
//

import UIKit

class DetailCreatorViewController: UIViewController {
    
    var creator: Creator?
    var gameData = [GameCreator]()
    private var positionData = [Position]()
    private var desc = ""
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DetailCreatorTableViewCell.self, forCellReuseIdentifier: DetailCreatorTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchPosition { position in
            self.positionData.append(contentsOf: position)
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
        print(gameData)

        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        view.addSubview(tableView)
        tableView.estimatedRowHeight = 1500
        tableView.rowHeight = UITableView.automaticDimension
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }

    func fetchPosition(onCompletion: @escaping ([Position])-> Void) {
        guard let creator = creator else {
            return
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        let id = creator.id
        var components = URLComponents(string: "https://api.rawg.io/api/creators/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var positionTotal = [Position]()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let creator = try? decoder.decode(CreatorDetail.self, from: data) as CreatorDetail {
                    positionTotal.append(contentsOf: creator.positions)
                }
                onCompletion(positionTotal)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func fetchDescription(onCompletion: @escaping (String)-> Void) {
        guard let creator = creator else {
            return
        }
        let apiKey = "fec28c04ac1b4d7da35bf4d9802e4d36"
        let id = creator.id
        var components = URLComponents(string: "https://api.rawg.io/api/creators/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let request = URLRequest(url: components.url!)
        var description = ""
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                if let creator = try? decoder.decode(CreatorDetail.self, from: data) as CreatorDetail {
                    description.append(contentsOf: creator.description)
                    print(description.count)
                }
                onCompletion(description)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
}

extension DetailCreatorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCreatorTableViewCell.identifier) as! DetailCreatorTableViewCell
        if indexPath.row == 0 {
            if let detail = creator {
                let position = positionData.map({ $0.name }).joined(separator: ", ")
                let gameContentText = detail.games.map({ $0.name }).joined(separator: ", ")
                let imageUrl = URL(string: detail.image)
                cell.imagePoster.kf.setImage(with: imageUrl)
                cell.positionContent.text = position
                cell.gameContent.text = gameContentText
                cell.creatorLabel.text = detail.name
                cell.aboutContent.text = desc.html2String
            }
            cell.selectionStyle = .none
            return cell
        }
        return cell
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if desc.count > 500{
            return 1250
        }
        return 900
    }
     
     
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
