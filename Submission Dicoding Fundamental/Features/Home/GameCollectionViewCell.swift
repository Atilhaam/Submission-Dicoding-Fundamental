//
//  GameCollectionViewCell.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 10/06/22.
//

import UIKit
class GameCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GameCollectionViewCell"
    
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
//        releaseDate.text = "2013-09-17"
//        releaseDate.font = UIFont.boldSystemFont(ofSize: 16)
        releaseDate.textAlignment = .center
        return releaseDate
    }()
    
    let metaCriticScoreContent: UILabel = {
        let score = UILabel()
        score.textColor = .white
        score.textAlignment = .center
//        score.font = UIFont.boldSystemFont(ofSize: 16)
//        score.text = "95"
        return score
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        layer.cornerRadius = 5
        
//        addSubview(coverImage)
//        addSubview(gameTitle)
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
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        gameTitle.frame = CGRect(x: 5,
//                             y: contentView.frame.size.height-50,
//                             width: contentView.frame.size.width-10,
//                             height: 50)
//        coverImage.frame = CGRect(x: 5,
//                             y: 10,
//                             width: contentView.frame.size.width-10,
//                             height: contentView.frame.size.height-50)
//    }
    
    
    
    
}
