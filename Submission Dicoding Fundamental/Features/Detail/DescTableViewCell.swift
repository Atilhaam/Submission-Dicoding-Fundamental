//
//  DescTableViewCell.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 06/07/22.
//

import UIKit

class DescTableViewCell: UITableViewCell {

    static let identifier = "DescTableViewCell"
    
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
//        title.text = "<p>Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. <br />\nSimultaneous storytelling from three unique perspectives: <br />\nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. <br />\nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.</p>"
        title.numberOfLines = 30
        title.font = UIFont.boldSystemFont(ofSize: 16)
        return title
    }()
    
    let platformsLabel: UILabel = {
        let platforms = UILabel()
        platforms.textAlignment = .left
        platforms.text = "Platforms"
        platforms.font = UIFont.boldSystemFont(ofSize: 20.0)
        return platforms
    }()

    let platformsContent: UILabel = {
        let platforms = UILabel()
        platforms.textAlignment = .left
        platforms.font = UIFont.boldSystemFont(ofSize: 16)
        platforms.numberOfLines = 0
//        platforms.text = "PlayStation 5, Xbox Series S/X, PlayStation 4, PC, Xbox One"
        return platforms
    }()

    let metacriticScoreLabel: UILabel = {
        let score = UILabel()
        score.text = "Metacritic"
        score.font = UIFont.boldSystemFont(ofSize: 20.0)
        score.textAlignment = .left
        return score
    }()

    let metaCriticScoreContent: UILabel = {
        let score = UILabel()
        score.textAlignment = .left
        score.font = UIFont.boldSystemFont(ofSize: 16)
//        score.text = "95"
        return score
    }()
    
    let genreLabel: UILabel = {
        let genre = UILabel()
        genre.text = "Genre"
        genre.font = UIFont.boldSystemFont(ofSize: 20)
        return genre
    }()

    let genreContent: UILabel = {
        let genre = UILabel()
//        genre.text = "Action,RPG"
        genre.textAlignment = .left
        genre.numberOfLines = 0
        genre.font = UIFont.boldSystemFont(ofSize: 16)
        return genre
    }()

    let releaseDateLabel: UILabel = {
        let releaseDate = UILabel()
        releaseDate.text = "Release Date"
        releaseDate.font = UIFont.boldSystemFont(ofSize: 20)
        releaseDate.textAlignment = .left
        return releaseDate
    }()

    let releaseDateContent: UILabel = {
        let releaseDate = UILabel()
//        releaseDate.text = "2013-09-17"
        releaseDate.font = UIFont.boldSystemFont(ofSize: 16)
        releaseDate.textAlignment = .left
        return releaseDate
    }()

    let developerLabel: UILabel = {
        let developer = UILabel()
        developer.text = "Developer"
        developer.font = UIFont.boldSystemFont(ofSize: 20)
        developer.textAlignment = .left
        return developer
    }()

    let developerContent: UILabel = {
        let developer = UILabel()
//        developer.text = "Rockstar North"
        developer.font = UIFont.boldSystemFont(ofSize: 16)
        developer.textAlignment = .left
        developer.numberOfLines = 0
        return developer
    }()

    let publisherLabel: UILabel = {
        let publisher = UILabel()
        publisher.text = "Publisher"
        publisher.font = UIFont.boldSystemFont(ofSize: 20)
        return publisher
    }()

    let publisherContent: UILabel = {
        let publisher = UILabel()
//        publisher.text = "Rockstar"
        publisher.font = UIFont.boldSystemFont(ofSize: 16)
        publisher.numberOfLines = 0
        publisher.textAlignment = .left
        return publisher
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraint()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraint() {
        addSubview(aboutLabel)
        addSubview(aboutContent)
        addSubview(platformsLabel)
        addSubview(platformsContent)
        addSubview(metacriticScoreLabel)
        addSubview(metaCriticScoreContent)
        addSubview(genreLabel)
        addSubview(genreContent)
        addSubview(releaseDateLabel)
        addSubview(releaseDateContent)
        addSubview(developerLabel)
        addSubview(developerContent)
        addSubview(publisherLabel)
        addSubview(publisherContent)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutContent.translatesAutoresizingMaskIntoConstraints = false
        platformsLabel.translatesAutoresizingMaskIntoConstraints = false
        platformsContent.translatesAutoresizingMaskIntoConstraints = false
        metacriticScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        metaCriticScoreContent.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreContent.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateContent.translatesAutoresizingMaskIntoConstraints = false
        developerLabel.translatesAutoresizingMaskIntoConstraints = false
        developerContent.translatesAutoresizingMaskIntoConstraints = false
        publisherLabel.translatesAutoresizingMaskIntoConstraints = false
        publisherContent.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: topAnchor),
            aboutLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            aboutLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            aboutContent.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor),
            aboutContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            aboutContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            platformsLabel.topAnchor.constraint(equalTo: aboutContent.bottomAnchor, constant: 8),
            platformsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            platformsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            platformsContent.topAnchor.constraint(equalTo: platformsLabel.bottomAnchor),
            platformsContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            platformsContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            metacriticScoreLabel.topAnchor.constraint(equalTo: platformsContent.bottomAnchor, constant: 16),
            metacriticScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            metacriticScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            metaCriticScoreContent.topAnchor.constraint(equalTo: metacriticScoreLabel.bottomAnchor),
            metaCriticScoreContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            metaCriticScoreContent.leadingAnchor.constraint(equalTo: leadingAnchor),

            genreLabel.topAnchor.constraint(equalTo: metaCriticScoreContent.bottomAnchor, constant: 16),
            genreLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            genreContent.topAnchor.constraint(equalTo: genreLabel.bottomAnchor),
            genreContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            genreContent.trailingAnchor.constraint(equalTo: trailingAnchor),

            releaseDateLabel.topAnchor.constraint(equalTo: genreContent.bottomAnchor, constant: 16),
            releaseDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            releaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            releaseDateContent.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor),
            releaseDateContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            releaseDateContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            developerLabel.topAnchor.constraint(equalTo: releaseDateContent.bottomAnchor, constant: 16),
            developerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            developerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            developerContent.topAnchor.constraint(equalTo: developerLabel.bottomAnchor),
            developerContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            developerContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            publisherLabel.topAnchor.constraint(equalTo: developerContent.bottomAnchor, constant: 16),
            publisherLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            publisherLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            publisherContent.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor),
            publisherContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            publisherContent.leadingAnchor.constraint(equalTo: leadingAnchor),
//            publisherContent.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }

}
