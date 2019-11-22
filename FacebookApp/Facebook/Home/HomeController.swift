//
//  MainController.swift
//  Facebook
//
//  Created by Rufus on 01/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation
import UIKit

class HomeController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView! = nil
    let onYourMindReuseID = "OnYourMindHeader"
    let StoryHeaderReuseID = "StoryHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemRed
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(refreshChanged), for: .valueChanged)
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            flowLayout.headerReferenceSize = CGSize(width: 0,height: 50)
        }
        
        collectionView.register(Postcell.self, forCellWithReuseIdentifier:String(describing: Postcell.self))
        collectionView.register(StoryHeader.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: StoryHeaderReuseID)
        collectionView.register(OnYourMindHeader.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: onYourMindReuseID)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        collectionView.backgroundColor = .tertiarySystemGroupedBackground
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var header: UICollectionReusableView! = nil
        
        if indexPath.section == 0 {
            header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: onYourMindReuseID, for: indexPath) as! OnYourMindHeader
        } else if indexPath.section == 1 {
            header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StoryHeaderReuseID, for: indexPath) as! StoryHeader
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:String(describing: Postcell.self), for: indexPath) as! Postcell
        cell.width = collectionView.frame.width
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return 5000
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: 0, height: 90)
        } else {
            return CGSize(width: 0, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    @objc func refreshChanged(sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            sender.endRefreshing()
        })
    }
}

import SwiftUI

class HomeControllerPreview {
    struct ContainerView : UIViewControllerRepresentable {
        typealias UIViewControllerType = HomeController
        
        func updateUIViewController(_ uiViewController: HomeController, context: UIViewControllerRepresentableContext<HomeControllerPreview.ContainerView>) {
            
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<HomeControllerPreview.ContainerView>) -> HomeControllerPreview.ContainerView.UIViewControllerType {
            return HomeController()
        }
    }
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
}

class HomeControllerPreviewProvider: HomeControllerPreview, PreviewProvider {
}

