//
//  CreatorCollectionViewCell.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 08/07/22.
//

import UIKit

class CreatorCollectionViewCell: UICollectionViewCell {
    static let identifier = "CreatorCollectionViewCell"
    
    let coverImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        return image
    }()
    
    let creatorTitle: UILabel = {
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
        configureConstraint()
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraint() {
        addSubview(coverImage)
        addSubview(creatorTitle)
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        creatorTitle.translatesAutoresizingMaskIntoConstraints = false
       

        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            coverImage.heightAnchor.constraint(equalToConstant: contentView.frame.size.height-100),
            coverImage.widthAnchor.constraint(equalToConstant: contentView.frame.size.width-10),
            coverImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            creatorTitle.topAnchor.constraint(equalTo: coverImage.bottomAnchor),
            creatorTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            creatorTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            creatorTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
