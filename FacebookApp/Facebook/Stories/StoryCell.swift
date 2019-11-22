//
//  StoryCells.swift
//  Facebook
//
//  Created by Rufus on 08/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation
import UIKit

class StoryCell: UICollectionViewCell {
    
    var highlightView: UIView
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                let scale = CGFloat(0.95)
                UIView.animate(withDuration: 0.1, animations: {self.transform =
                    CGAffineTransform(scaleX: scale, y: scale)
                    self.highlightView.isHidden = false
                })
                
            } else {
                let scale = CGFloat(1.0)
                UIView.animate(withDuration: 0.1, animations: {
                    self.transform = CGAffineTransform(scaleX: scale, y: scale)
                    self.highlightView.isHidden = true
                })
            }
        }
    }
    
    override init(frame: CGRect) {
        highlightView = UIView()
        
        super.init(frame: frame)
        
        let imageView = UIImageView(image: UIImage(named:"rufusbeach165_300"))
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .black
        
        imageView.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7, 1.2]
        
        let profileCircleContainerView = UIView()
        
        let profileCircleImage = UIImageView(image:UIImage(named: "rufusbeach50"))
        profileCircleContainerView.addSubview(profileCircleImage)
        profileCircleImage.translatesAutoresizingMaskIntoConstraints = false
        profileCircleImage.backgroundColor = .blue
        profileCircleImage.clipsToBounds = true
        profileCircleImage.layer.borderColor = UIColor.blue.cgColor
        profileCircleImage.layer.borderWidth = 3.0
        
        let size: CGFloat = 36.0
        let circleInset: CGFloat = 6.0
        profileCircleImage.leftAnchor.constraint(equalTo: profileCircleContainerView.leftAnchor, constant: circleInset).isActive = true
        profileCircleImage.topAnchor.constraint(equalTo: profileCircleContainerView.topAnchor, constant: circleInset).isActive = true
        
        profileCircleImage.widthAnchor.constraint(equalToConstant: size).isActive = true
        profileCircleImage.heightAnchor.constraint(equalToConstant: size).isActive = true
        profileCircleImage.layer.cornerRadius = size / 2
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let nameLabel = UILabel()
        
        nameLabel.textColor = .white
        nameLabel.text = "Rufus Mall"
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 2
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        
        stackView.axis = .vertical
        stackView.addArrangedSubview(profileCircleContainerView)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(nameLabel)
        contentView.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.addSubview(highlightView)
        highlightView.translatesAutoresizingMaskIntoConstraints = false
        highlightView.backgroundColor = .black
        highlightView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        highlightView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        highlightView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        highlightView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        highlightView.alpha = 0.4
        highlightView.clipsToBounds = true
        highlightView.isHidden = true
        highlightView.layer.cornerRadius = imageView.layer.cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let gradientLayer = CAGradientLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        
    }
}


import SwiftUI

class StoryCellPreview: HomeControllerPreview, PreviewProvider {
}


