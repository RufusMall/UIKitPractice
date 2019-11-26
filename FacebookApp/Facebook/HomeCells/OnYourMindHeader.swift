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
        let liveButton = FacebookButton()
        liveButton.translatesAutoresizingMaskIntoConstraints = false
        liveButton.setTitle("Live", for: .normal)
        
        let photoButton = FacebookButton()
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        photoButton.setTitle("Photo", for: .normal)
        
        
        let checkInButton = FacebookButton()
        checkInButton.translatesAutoresizingMaskIntoConstraints = false
        checkInButton.setTitle("Check In", for: .normal)
        
        buttonStack.addArrangedSubview(liveButton)
        buttonStack.addArrangedSubview(photoButton)
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
        onYourMindStack.layoutMargins = UIEdgeInsets(top: margin * 2, left: margin, bottom: margin * 2, right: margin)
        
        let onYourMindButton = FacebookButton()
        onYourMindButton.translatesAutoresizingMaskIntoConstraints = false
        onYourMindButton.setTitle("What's on your mind?", for: .normal)
        onYourMindButton.titleLabel?.textAlignment = .left
        onYourMindButton.contentHorizontalAlignment = .left
        onYourMindButton.contentEdgeInsets = .init(top: 8, left: 16, bottom: 8, right: 8)

        let diameter = CGFloat(46)
        let profileImageView = CircleImageView(image: UIImage(named:"rufusbeach"), diameter: diameter)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.widthAnchor.constraint(equalToConstant: diameter).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: diameter).isActive = true
        
        onYourMindStack.addArrangedSubview(profileImageView)
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

class OnYourMindHeaderPreview: HomePreviewProvider, PreviewProvider {
}
