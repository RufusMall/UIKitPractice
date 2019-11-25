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
    init() {
        super.init(frame: .zero)
        self.setTitleColor(.gray, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

class FacebookButtonPreview: HomeControllerPreview, PreviewProvider {
}
