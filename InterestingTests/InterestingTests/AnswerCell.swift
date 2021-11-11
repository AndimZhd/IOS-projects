//
//  AnswerCellCollectionViewCell.swift
//  InterestingTests
//
//  Created by AZHD on 5.09.21.
//

import UIKit

class AnswerCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    func updateLabel(with text: String){
        label.text = text
    }
}
