//
//  CircleImageView.swift
//  Facebook
//
//  Created by Rufus on 22/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation
import UIKit

class CircleImageView: UIImageView {
    required init(image: UIImage?, diameter: CGFloat) {
        super.init(image: image)
        contentMode = .scaleAspectFill

        layer.cornerRadius = diameter / 2
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not Implemented")
    }
}
