//
//  TestCell.swift
//  InterestingTests
//
//  Created by AZHD on 1.09.21.
//

import Foundation
import UIKit

class TestCell: UICollectionViewCell{
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var testName: UILabel!

    
    func updateName(with name: String){
        testName.text = name
    }
    func updateImage(with image: UIImage){
        testImage.image = image
    }
    
    
}
