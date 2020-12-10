//
//  Cell.swift
//  SwiftyEigen_Example
//
//  Created by Konstantin Semianov on 03.12.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    @IBOutlet weak var textField: UITextField! {
        didSet { textField.addDoneToolbar() }
    }
    var indexPath = IndexPath(row: -1, section: -1)
}
