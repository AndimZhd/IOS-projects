//
//  BoardCell.swift
//  2048
//
//  Created by AZHD on 27.08.21.
//

import UIKit

class GameBoardCell:UICollectionViewCell{
    
    
    @IBOutlet weak var label: UILabel!
    
    func updateLabel(with text:String){
        label.text = text == "0" ? "" : text
        label.textAlignment = NSTextAlignment.center
        setColor()
    }
    
    func setColor(){
        var color = UIColor()
        switch label.text {
        case "":
            color = UIColor.white
        case "2":
            color = UIColor(rgb: 0x93f1ff)
        case "4":
            color = UIColor(rgb: 0x90d3ff)
        case "8":
            color = UIColor(rgb: 0x8cbcfd)
        case "16":
            color = UIColor(rgb: 0x8797f9)
        case "32":
            color = UIColor(rgb: 0x9b54f3)
        case "64":
            color = UIColor(rgb: 0xb080f9)
        case "128":
            color = UIColor(rgb: 0xc354f3)
        case "256":
            color = UIColor(rgb: 0xea72c1)
        case "512":
            color = UIColor(rgb: 0xf45a84)
        case "1024":
            color = UIColor(rgb: 0xfa3f4d)
        case "2048":
            color = UIColor(rgb: 0xfa1f1f)
        default:
            color = UIColor.white
        }
        self.backgroundColor = color
    }
    
}


//extension UIColor{
//    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
//        self.init(
//            red: CGFloat(red) / 255.0,
//            green: CGFloat(green) / 255.0,
//            blue: CGFloat(blue) / 255.0,
//            alpha: a
//        )
//    }
//
//    convenience init(rgb: Int, a: CGFloat = 1.0) {
//        self.init(
//            red: (rgb >> 16) & 0xFF,
//            green: (rgb >> 8) & 0xFF,
//            blue: rgb & 0xFF,
//            a: a
//        )
//    }
//}
