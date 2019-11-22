//
//  StoryCollectionView.swift
//  Facebook
//
//  Created by Rufus on 08/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation
import UIKit

class StoryCollectionViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .systemBackground
        
        collectionView.delegate = self
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCell")
        
        collectionView.showsHorizontalScrollIndicator = false
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            flowLayout.scrollDirection = .horizontal
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath)
//        cell.randomColorViews()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
}


import SwiftUI

class StoryCollectionViewPreview: HomeControllerPreview, PreviewProvider {
}
