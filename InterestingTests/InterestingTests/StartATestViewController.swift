//
//  StartATestViewController.swift
//  InterestingTests
//
//  Created by AZHD on 5.09.21.
//

import UIKit

class StartATestViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var button: UIButton!
    
    var currentTest = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = currentTest
        switch currentTest {
        case "Do you have daltonism or not?":
            break
        case "Are you a gay?":
            break
        case "Are you a reptiloid?":
            break
        case "What smesharik are you?":
            image.image = UIImage(named: "zastavka")!
        case "Who are you from gachi?":
            break
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var testVC: TestViewController = segue.destination as! TestViewController
        testVC.recievedString = currentTest
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
