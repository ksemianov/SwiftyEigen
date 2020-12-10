//
//  ViewController.swift
//  SwiftyEigen
//
//  Created by ksemianov on 12/03/2020.
//  Copyright (c) 2020 ksemianov. All rights reserved.
//

import UIKit
import SwiftyEigen

class ViewController: UIViewController{
    @IBOutlet weak var matrixTable: UICollectionView!
    @IBOutlet weak var invertButton: UIButton!

    @IBAction func didTapInvert(_ sender: Any) {
        matrix = matrix.inverse()
        matrixTable.reloadData()
    }

    var matrix = EIGMatrix.identity(rows: 2, cols: 2)
    let formatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        invertButton.layer.cornerRadius = 6.0
        invertButton.dropShadow()

        matrixTable.delegate = self
        matrixTable.dataSource = self

        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return matrix.cols
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return matrix.rows
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = matrixTable.dequeueReusableCell(withReuseIdentifier: "cell",
                                                   for: indexPath) as! Cell

        cell.indexPath = indexPath
        let value = matrix[indexPath]
        cell.textField.text = self.formatter.string(from: NSNumber(value: value))
        cell.textField.delegate = self

        return cell
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.size
        return CGSize(width: size.width / CGFloat(matrix.cols),
                      height: size.height / CGFloat(matrix.rows))
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let cell = textField.superview!.superview! as! Cell
        let indexPath = cell.indexPath
        if let text = textField.text,
           let value = formatter.number(from: text)?.floatValue {
            matrix[indexPath] = value
        }
        let value = matrix[indexPath]
        cell.textField.text = self.formatter.string(from: NSNumber(value: value))
    }
}

extension EIGMatrix {
    subscript(_ indexPath: IndexPath) -> Float {
        get { return self[indexPath.section, indexPath.row] }
        set { self[indexPath.section, indexPath.row] = newValue }
    }
}
