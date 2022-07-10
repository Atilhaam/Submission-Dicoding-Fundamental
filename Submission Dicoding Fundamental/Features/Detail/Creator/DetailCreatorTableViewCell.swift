//
//  DetailCreatorTableViewCell.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 09/07/22.
//

import UIKit

class DetailCreatorTableViewCell: UITableViewCell {

    static let identifier = "DetailCreatorTableViewCell"
    
    let imagePoster: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let creatorLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 30.0)
        return title
    }()
    
    let aboutLabel: UILabel = {
        let title = UILabel()
        title.text = "About"
        title.textAlignment = .left
        title.numberOfLines = 1
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        return title
    }()
    
    let aboutContent: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .justified
        title.font = UIFont.boldSystemFont(ofSize: 16)
        return title
    }()
    
    let positionLabel: UILabel = {
        let genre = UILabel()
        genre.text = "Position"
        genre.font = UIFont.boldSystemFont(ofSize: 20)
        return genre
    }()

    let positionContent: UILabel = {
        let genre = UILabel()
//        genre.text = "Action,RPG"
        genre.textAlignment = .left
        genre.numberOfLines = 0
        genre.font = UIFont.boldSystemFont(ofSize: 16)
        return genre
    }()
    
    let gameLabel: UILabel = {
        let gameLabel = UILabel()
        gameLabel.text = "Games"
        gameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        gameLabel.textAlignment = .left
        return gameLabel
    }()
//
    let gameContent: UILabel = {
        let gameContent = UILabel()
        gameContent.font = UIFont.boldSystemFont(ofSize: 16)
        gameContent.textAlignment = .left
        gameContent.numberOfLines = 0
        return gameContent
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
        addSubview(creatorLabel)
        addSubview(aboutLabel)
        addSubview(aboutContent)
        addSubview(positionLabel)
        addSubview(positionContent)
        addSubview(gameLabel)
        addSubview(gameContent)
        imagePoster.translatesAutoresizingMaskIntoConstraints = false
        creatorLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutContent.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionContent.translatesAutoresizingMaskIntoConstraints = false
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameContent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            imagePoster.heightAnchor.constraint(equalToConstant: 200),
            imagePoster.widthAnchor.constraint(equalToConstant: 300),
            imagePoster.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            creatorLabel.topAnchor.constraint(equalTo: imagePoster.bottomAnchor, constant: 22),
            creatorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            creatorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
//            creatorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            aboutLabel.topAnchor.constraint(equalTo: creatorLabel.bottomAnchor, constant: 8),
            aboutLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            aboutLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            aboutContent.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor),
            aboutContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            aboutContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            positionLabel.topAnchor.constraint(equalTo: aboutContent.bottomAnchor, constant: 8),
            positionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            positionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            positionContent.topAnchor.constraint(equalTo: positionLabel.bottomAnchor),
            positionContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            positionContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            gameLabel.topAnchor.constraint(equalTo: positionContent.bottomAnchor, constant: 16),
            gameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            gameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            gameContent.topAnchor.constraint(equalTo: gameLabel.bottomAnchor),
            gameContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            gameContent.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        
    }

}
