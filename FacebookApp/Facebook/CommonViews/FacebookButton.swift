//
//  FacebookButton.swift
//  Facebook
//
//  Created by Rufus on 23/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation
import UIKit

class FacebookButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                let color: CGFloat = 2.5/3
                self.backgroundColor = UIColor(red: color, green: color, blue: color, alpha: 1.0)
            } else {
                self.backgroundColor = UIColor.systemBackground
            }
        }
    }
    
    init() {
        super.init(frame: .zero)
        self.setTitleColor(.gray, for: .normal)
        
        self.layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

class FacebookButtonPreview: HomePreviewProvider, PreviewProvider {
}
