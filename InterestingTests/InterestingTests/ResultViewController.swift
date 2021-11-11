//
//  ResultViewController.swift
//  InterestingTests
//
//  Created by AZHD on 5.09.21.
//

import Foundation
import UIKit

class ResultViewController: UIViewController{
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    var resultText = ""
    var resultImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "You are " + resultText + "!"
        image.image = resultImage
        
    }
}
