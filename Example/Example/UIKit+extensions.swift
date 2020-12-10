//
//  UIKit+extensions.swift
//  SwiftyEigen_Example
//
//  Created by Konstantin Semianov on 03.12.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

extension UIView {
    // only works for rounded rects
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 8
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}

extension UITextField {
    func addDoneToolbar() {
        let size = CGSize(width: UIScreen.main.bounds.width,
                          height: 32)
        let rect = CGRect(origin: .zero,
                          size: size)
        let toolbar = UIToolbar(frame: rect)
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Done", style: .done,
                            target: nil, action: #selector(done))
        ]
        toolbar.sizeToFit()

        self.inputAccessoryView = toolbar
    }

    @objc fileprivate func done() {
        self.resignFirstResponder()
    }
}
