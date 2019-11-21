//
//  MainController.swift
//  Facebook
//
//  Created by Rufus on 01/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation
import UIKit

class HomeController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemRed
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(refreshChanged), for: .valueChanged)
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            flowLayout.headerReferenceSize = CGSize(width:0, height: 200)
            flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        }
        
        collectionView.register(Postcell.self, forCellWithReuseIdentifier:String(describing: Postcell.self))
        collectionView.register(StoryHeader.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StoryHeader")
        
        collectionView.dataSource = self
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
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StoryHeader", for: indexPath) as! StoryHeader
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:String(describing: Postcell.self), for: indexPath) as! Postcell
        cell.width = collectionView.frame.width
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5000
    }
    
    @objc func refreshChanged(sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            sender.endRefreshing()
        })
    }
}

import SwiftUI

struct MainPreview: PreviewProvider {
    struct ContainerView : UIViewControllerRepresentable {
        typealias UIViewControllerType = HomeController
        
        func updateUIViewController(_ uiViewController: HomeController, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> MainPreview.ContainerView.UIViewControllerType {
            return HomeController()
        }
    }
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
}
