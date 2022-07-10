//
//  FirstRowTableViewCell.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 05/07/22.
//

import UIKit

class FirstRowTableViewCell: UITableViewCell {
    
    static let identifier = "FirstRowTableViewCell"
    
    let imagePoster: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 30.0)
        return title
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraint() {
        addSubview(imagePoster)
        addSubview(titleLabel)
        imagePoster.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            imagePoster.heightAnchor.constraint(equalToConstant: 200),
            imagePoster.widthAnchor.constraint(equalToConstant: 300),
            imagePoster.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imagePoster.bottomAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
}
