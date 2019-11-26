//
//  PostCell.swift
//  Facebook
//
//  Created by Rufus on 07/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation
import UIKit

class PostHeaderView: UIView {
    let imageView: UIView = {
        let size = CGFloat(50)
        let imageView = CircleImageView(image:UIImage(named:"rufusbeach150"), diameter: size)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return  imageView
    }()
    
    let titlelabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Rufus Mall"
        label.font = UIFont.preferredFont(forTextStyle:.headline)
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "22/01/1990"
        label.font = UIFont.preferredFont(forTextStyle:.caption2)
        label.textColor = .init(red: 0.8, green: 0.8, blue: 0.8, alpha:1.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        let spacerView = UIView()
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        let labelStack = UIStackView(arrangedSubviews: [titlelabel, subTitleLabel])
        labelStack.axis = .vertical
        labelStack.isLayoutMarginsRelativeArrangement = true
        
        let postInfoStack = UIStackView(arrangedSubviews: [imageView, labelStack, spacerView])
        postInfoStack.translatesAutoresizingMaskIntoConstraints = false
        postInfoStack.axis = .horizontal
        postInfoStack.spacing = 8
        self.addSubview(postInfoStack)
        widthAnchor.constraint(equalTo: postInfoStack.widthAnchor).isActive = true
        
        heightAnchor.constraint(equalTo: postInfoStack.heightAnchor).isActive = true
        
        //        spacerView.randomColorViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Postcell : UICollectionViewCell {
    let contentImageView: UIImageView = {
        let imageView = UIImageView(image:UIImage(named:"rufusbeach"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let textLabel: UILabel = {
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud"
        textLabel.numberOfLines = 0
        return textLabel
    }()
    
    var widthConstraint: NSLayoutConstraint?
    var width: CGFloat {
        didSet {
            widthConstraint?.constant = width
            
            textLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud"
        }
    }
    
    override init(frame: CGRect) {
        self.width = 10
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        widthConstraint = widthAnchor.constraint(equalToConstant: 1)
        widthConstraint?.priority = .defaultHigh
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        widthConstraint?.isActive = true
        
        contentView.constrainPinningEdgesToSuperview()
        let postHeader = PostHeaderView(frame: .zero)
        
        let headerAndtextVStack = UIStackView(arrangedSubviews:[postHeader, textLabel])
        headerAndtextVStack.translatesAutoresizingMaskIntoConstraints = false
        headerAndtextVStack.axis = .vertical
        headerAndtextVStack.isLayoutMarginsRelativeArrangement = true
        headerAndtextVStack.spacing = 8
        headerAndtextVStack.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        let contentStack = UIStackView(arrangedSubviews: [headerAndtextVStack, contentImageView])
        contentStack.axis = .vertical
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentStack)
        
        let actionBtnTintColor = UIColor.darkGray
        let likeBtn = FacebookButton()
        likeBtn.translatesAutoresizingMaskIntoConstraints = false
        likeBtn.setTitle("Like", for: .normal)
        likeBtn.tintColor = actionBtnTintColor
        
        likeBtn.addTarget(self, action: #selector(likePressed), for: .touchUpInside)
        
        let commentBtn = FacebookButton()
        commentBtn.translatesAutoresizingMaskIntoConstraints = false
        commentBtn.setTitle("Comment", for: .normal)
        commentBtn.tintColor = actionBtnTintColor
        
        let shareBtn = FacebookButton()
        shareBtn.translatesAutoresizingMaskIntoConstraints = false
        shareBtn.setTitle("Share", for: .normal)
        shareBtn.tintColor = actionBtnTintColor
        
        let actionStackView = UIStackView(arrangedSubviews: [likeBtn, commentBtn, shareBtn])
        actionStackView.axis = .horizontal
        actionStackView.distribution = .fillEqually
        actionStackView.preservesSuperviewLayoutMargins = true
//        actionStackView.layoutMargins = .init(top: 0, left: 0, bottom: 6, right: 0)
        actionStackView.isLayoutMarginsRelativeArrangement = true
        contentStack.addArrangedSubview(actionStackView)
        contentStack.spacing = 12
//        contentStack.layoutMargins = .init(top: 8, left: 0, bottom: 8, right: 0)
        contentStack.isLayoutMarginsRelativeArrangement = true
        contentStack.constrainPinningEdgesToSuperview()
        backgroundColor = .systemBackground
//                randomColorViews()
    }
    
    @objc func likePressed(sender:UIButton) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        self.textLabel.text = ""
    }
}

import SwiftUI

class PostCellPreviewProvider: HomePreviewProvider, PreviewProvider {
}
