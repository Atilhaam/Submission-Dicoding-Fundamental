//
//  ProfileViewController.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 10/07/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        setupView()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        tableView.estimatedRowHeight = 700
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
    }
    
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier) as! ProfileTableViewCell
        if indexPath.row == 0 {
            cell.selectionStyle = .none
            return cell
        }
        return cell
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 650
    }
     
     
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
