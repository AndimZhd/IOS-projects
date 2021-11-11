//
//  TestClasses.swift
//  InterestingTests
//
//  Created by AZHD on 3.09.21.
//

import Foundation
import UIKit

class Question: UIView{
    
    @IBOutlet weak var label:UILabel!

    @IBOutlet weak var image: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupQuestion(){
        image.frame.size.height = self.frame.height*0.6
        image.frame.size.width = self.frame.height*0.6
    }
}


