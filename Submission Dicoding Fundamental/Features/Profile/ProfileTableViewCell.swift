//
//  ProfileTableViewCell.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 10/07/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    static let identifier = "ProfileTableViewCell"
    
    let imagePoster: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ilham")
        return image
    }()
    
    let creatorLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.text = "Ilham Wibowo"
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
        title.text = "Computer Science Graduate. I Have experience in Mobile Application Development, both in native Android and iOS. Experienced in working on iOS and Android platform and frameworks and customizing it as per requirements. I also have strong experience in Agile development methodology. I love to learn new things, and always try to do better and improve as a person."
        title.numberOfLines = 30
        title.font = UIFont.boldSystemFont(ofSize: 16)
        return title
    }()
    
    let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return emailLabel
    }()

    let emailContent: UILabel = {
        let emailContent = UILabel()
        emailContent.text = "ilham.wayne@gmail.com"
        emailContent.textAlignment = .left
        emailContent.numberOfLines = 0
        emailContent.font = UIFont.boldSystemFont(ofSize: 16)
        return emailContent
    }()
    
    let phoneNumberLabel: UILabel = {
        let phoneNumberLabel = UILabel()
        phoneNumberLabel.text = "Phone Number"
        phoneNumberLabel.font = UIFont.boldSystemFont(ofSize: 20)
        phoneNumberLabel.textAlignment = .left
        return phoneNumberLabel
    }()
//
    let phoneNumberContent: UILabel = {
        let phoneNumberContent = UILabel()
        phoneNumberContent.text = "082233804087"
        phoneNumberContent.font = UIFont.boldSystemFont(ofSize: 16)
        phoneNumberContent.textAlignment = .left
        phoneNumberContent.numberOfLines = 0
        return phoneNumberContent
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
        addSubview(emailLabel)
        addSubview(emailContent)
        addSubview(phoneNumberLabel)
        addSubview(phoneNumberContent)
        imagePoster.translatesAutoresizingMaskIntoConstraints = false
        creatorLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutContent.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailContent.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberContent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            imagePoster.heightAnchor.constraint(equalToConstant: 200),
            imagePoster.widthAnchor.constraint(equalToConstant: 300),
            imagePoster.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            creatorLabel.topAnchor.constraint(equalTo: imagePoster.bottomAnchor, constant: 22),
            creatorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            creatorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
//            creatorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            aboutLabel.topAnchor.constraint(equalTo: creatorLabel.bottomAnchor),
            aboutLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            aboutLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            aboutContent.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor),
            aboutContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            aboutContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: aboutContent.bottomAnchor, constant: 8),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            emailContent.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            emailContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: emailContent.bottomAnchor, constant: 16),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            phoneNumberContent.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor),
            phoneNumberContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            phoneNumberContent.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        
    }

}
