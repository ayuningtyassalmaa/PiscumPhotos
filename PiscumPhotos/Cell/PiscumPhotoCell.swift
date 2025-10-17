//
//  PiscumPhotoCell.swift
//  PiscumPhotos
//
//  Created by Salma Ayuningtyas on 10/17/25.
//

import Foundation
import UIKit
import SDWebImage

class PiscumPhotoCell: UITableViewCell {
    static let identifier = "PiscumPhotoCell"
    
    //🍃 UI Components
    let stackView = UIStackView()
    let autorPhotoLabel = UILabel()
    let imageViewFeed = UIImageView()
    let downloadPhotoBtn = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupUI()
    }
    
    func setupUI() {
        
        imageViewFeed.sd_cancelCurrentImageLoad()
        
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill

        downloadPhotoBtn.setTitle("Download", for: .normal)
        downloadPhotoBtn.setTitleColor(.blue, for: .normal)
    
        let stackViewList: [UIView] = [autorPhotoLabel, downloadPhotoBtn]
        
        contentView.addSubview(stackView)
        contentView.addSubview(imageViewFeed)
        
        for insideStackView in stackViewList {
            insideStackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.translatesAutoresizingMaskIntoConstraints = false
            imageViewFeed.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.addArrangedSubview(insideStackView)
        }
            
            //constraints
            NSLayoutConstraint.activate([
                
                imageViewFeed.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
                imageViewFeed.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
                imageViewFeed.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -30),
                imageViewFeed.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
                
                stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
                stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
                
                imageViewFeed.widthAnchor.constraint(equalToConstant: 150),
                imageViewFeed.heightAnchor.constraint(equalToConstant: 120),
                downloadPhotoBtn.widthAnchor.constraint(equalToConstant: 100),
                downloadPhotoBtn.heightAnchor.constraint(equalToConstant: 50)
                
            ])
    }
    
    func configure(with authorname: String, with urlImage: String) {
        autorPhotoLabel.text = authorname
       
        guard let urlIMG = URL(string: urlImage) else {
            imageViewFeed.image = UIImage(systemName: "heart.fill")
            return
        }
        imageViewFeed.sd_setImage(with: urlIMG, completed: nil)
    }
}
