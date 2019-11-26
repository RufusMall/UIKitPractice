//
//  UIKitPreview.swift
//  Facebook
//
//  Created by Rufus on 26/11/2019.
//  Copyright © 2019 Rufus. All rights reserved.
//

import Foundation
import SwiftUI

struct ViewControllerContainerView : UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerContainerView>) -> UIViewControllerType {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerContainerView>) {
    }
}

class ViewControllerPreviewProvider<T: UIViewController> {
    static var previews: some View {
        return ViewControllerContainerView(viewController: makeController())
    }
    
    class func makeController() -> UIViewController {
        return T()
    }
}
