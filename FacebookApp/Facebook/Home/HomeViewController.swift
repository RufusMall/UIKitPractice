//
//  MainController.swift
//  Facebook
//
//  Created by Rufus on 01/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView! = nil
    let onYourMindReuseID = "OnYourMindHeader"
    let StoryHeaderReuseID = "StoryHeader"
    
    var titleView: UIView = {
        let contentStack = UIStackView()
        contentStack.isLayoutMarginsRelativeArrangement = true
        contentStack.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        let titleLabel = UILabel()
        titleLabel.text = "facebook"
        titleLabel.textColor = .systemBlue
        titleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 32.0)
        
        contentStack.addArrangedSubview(titleLabel)
        
        let searchButton = UIButton(type: .contactAdd)
        
        let messengerButton = UIButton(type: .close)
        
        contentStack.addArrangedSubview(searchButton)
        contentStack.addArrangedSubview(messengerButton)
        
        let containerView = UIView()
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(contentStack)
        
        contentStack.constrainPinningEdgesToSuperview()
        return containerView
    }()

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        titleView.leadingAnchor.constraint(equalTo: titleView.superview!.leadingAnchor, constant: systemMinimumLayoutMargins.leading).isActive = true
    }

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
        
        self.navigationItem.titleView = titleView
        
        if let navBar = navigationController?.navigationBar {
            navBar.shadowImage = UIImage()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y + self.view.safeAreaLayoutGuide.layoutFrame.minY
        offset = max(0, offset)
        
        let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        offset = min(statusBarHeight, offset)
        
        let alpha: CGFloat = 1.0 - (offset / statusBarHeight)
        
        if let navBar = self.navigationController?.navigationBar {
            navBar.transform = CGAffineTransform(translationX: 0, y: -offset)
            self.navigationItem.titleView?.alpha = alpha
        }
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
            return CGSize(width: 0, height: 122)
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
//            self.view.randomColorViews()
        })
    }
}

import SwiftUI

class HomeControllerPreviewProvider: HomePreviewProvider, PreviewProvider {
}

class HomePreviewProvider: ViewControllerPreviewProvider<HomeViewController> {
    override class func makeController() -> UIViewController {
        return UINavigationController(rootViewController: HomeViewController())
    }
}
