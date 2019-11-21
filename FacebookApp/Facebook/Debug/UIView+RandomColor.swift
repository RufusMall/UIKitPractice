//
//  UIView+RandomColor.swift
//  Facebook
//
//  Created by Rufus on 07/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

extension UIView {
    func randomColorViews() {
        backgroundColor = getRandomColor()
        subviews.forEach({$0.randomColorViews()})
    }
    
    func getRandomColor() -> UIColor {
        let randomRed: CGFloat = CGFloat(drand48())
        let randomGreen: CGFloat = CGFloat(drand48())
        let randomBlue: CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha:1.0)
    }
}
