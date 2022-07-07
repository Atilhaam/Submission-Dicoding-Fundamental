//
//  GameCollectionViewCell.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 10/06/22.
//

import UIKit
class GameCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GameCollectionViewCell"
    
     public let coverImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    public let gameTitle: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.textAlignment = .center
        title.numberOfLines = 2
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        layer.cornerRadius = 5
        addSubview(coverImage)
        addSubview(gameTitle)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gameTitle.frame = CGRect(x: 5,
                             y: contentView.frame.size.height-50,
                             width: contentView.frame.size.width-10,
                             height: 50)
        coverImage.frame = CGRect(x: 5,
                             y: 10,
                             width: contentView.frame.size.width-10,
                             height: contentView.frame.size.height-50)
    }
    
    
}
