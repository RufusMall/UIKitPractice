//
//  StoryHeader.swift
//  Facebook
//
//  Created by Rufus on 08/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation
import UIKit

class StoryHeader: UICollectionReusableView {
    let storyController = StoryCollectionViewController(collectionViewLayout:UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let contentView = storyController.view!
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
