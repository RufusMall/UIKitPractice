//
//  OnYourMindHeader.swift
//  Facebook
//
//  Created by Rufus on 21/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation

class OnYourMindHeader: UICollectionReusableView {
    fileprivate func createButtonStack() -> UIStackView {
        
        let buttonStack = UIStackView()
        let liveButton = UIButton(type: .roundedRect)
        liveButton.translatesAutoresizingMaskIntoConstraints = false
        liveButton.setTitle("Live", for: .normal)
        
        let photoButton = UIButton(type: .roundedRect)
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        photoButton.setTitle("Photo", for: .normal)
        
        
        let checkInButton = UIButton(type: .roundedRect)
        checkInButton.translatesAutoresizingMaskIntoConstraints = false
        checkInButton.setTitle("Check In", for: .normal)
        
        buttonStack.addArrangedSubview(photoButton)
        buttonStack.addArrangedSubview(liveButton)
        buttonStack.addArrangedSubview(checkInButton)
        buttonStack.distribution = .fillEqually
        buttonStack.alignment = .fill
        
        return buttonStack
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let contentView = UIView()
        contentView.backgroundColor = .white
        
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
    
        contentView.constrainPinningEdgesToSuperview()
        
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        
        
        let onYourMindStack = UIStackView()
        onYourMindStack.isLayoutMarginsRelativeArrangement = true
        let margin = CGFloat(8)
        onYourMindStack.layoutMargins = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        let onYourMindButton = UIButton(type: .roundedRect)
        onYourMindButton.translatesAutoresizingMaskIntoConstraints = false
        onYourMindButton.setTitle("What's on your mind?", for: .normal)
        onYourMindButton.titleLabel?.textAlignment = .left
        onYourMindButton.contentHorizontalAlignment = .left
        onYourMindButton.contentEdgeInsets = .init(top: 8, left: 16, bottom: 8, right: 8)

        let imageView = UIImageView(image:UIImage(named:"rufusbeach150"))
        let size = CGFloat(46)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = size / 2
        imageView.widthAnchor.constraint(equalToConstant: size).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        onYourMindStack.addArrangedSubview(imageView)
        onYourMindStack.addArrangedSubview(onYourMindButton)
        
        mainStack.addArrangedSubview(onYourMindStack)
        
        let buttonStack = createButtonStack()
        
        mainStack.addArrangedSubview(buttonStack)
        
        contentView.addSubview(mainStack)
        mainStack.constrainPinningEdgesToSuperview()
        
//        self.randomColorViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

class OnYourMindHeaderPreview: HomeControllerPreview, PreviewProvider {
}