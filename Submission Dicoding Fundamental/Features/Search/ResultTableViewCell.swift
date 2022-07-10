//
//  ResultTableViewCell.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 10/07/22.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    static let identifier = "ResultTableViewCell"
    
    let coverImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()
    
    let gameTitle: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.textAlignment = .center
        title.numberOfLines = 2
        return title
    }()
    
    let releaseDateContent: UILabel = {
        let releaseDate = UILabel()
        releaseDate.textColor = .white
        releaseDate.textAlignment = .center
        return releaseDate
    }()
    
    let metaCriticScoreContent: UILabel = {
        let score = UILabel()
        score.textColor = .white
        score.textAlignment = .center
        return score
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraint()
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraint() {
        addSubview(coverImage)
        addSubview(gameTitle)
        addSubview(releaseDateContent)
        addSubview(metaCriticScoreContent)
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        gameTitle.translatesAutoresizingMaskIntoConstraints = false
        releaseDateContent.translatesAutoresizingMaskIntoConstraints = false
        metaCriticScoreContent.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            coverImage.heightAnchor.constraint(equalToConstant: contentView.frame.size.height-100),
            coverImage.widthAnchor.constraint(equalToConstant: contentView.frame.size.width-10),
            coverImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameTitle.topAnchor.constraint(equalTo: coverImage.bottomAnchor),
            gameTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gameTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            gameTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            releaseDateContent.topAnchor.constraint(equalTo: gameTitle.bottomAnchor),
            releaseDateContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            releaseDateContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            metaCriticScoreContent.topAnchor.constraint(equalTo: releaseDateContent.bottomAnchor),
            metaCriticScoreContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            metaCriticScoreContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            metaCriticScoreContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        ])
    }

}
