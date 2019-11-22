//
//  UIView+Constraints.swift
//  Facebook
//
//  Created by Rufus on 21/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import UIKit

extension UIView {
    func constrainPinningEdgesToSuperview() {
        guard let superview = self.superview  else {
            fatalError("constrainPinningEdgesToSuperview requires a valid superview")
        }
        constrainPinningEdges(to: superview)
    }
    
    func constrainPinningEdges(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
