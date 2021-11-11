//
//  ViewController.swift
//  InterestingTests
//
//  Created by AZHD on 31.08.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tests: UICollectionView!
    
    var testDataSource = [(UIImage, String)]()
    
    var currentTest: String = " "
    
    func addImages(){
        testDataSource.append((UIImage(named: "Smesharik")!, "What smesharik are you?"))
        testDataSource.append((UIImage(named: "Gay")!, "Are you a gay?"))
        testDataSource.append((UIImage(named: "Reptiloid")!, "Are you a reptiloid?"))
        testDataSource.append((UIImage(named: "Billy")!, "Who are you from gachi?"))
        testDataSource.append((UIImage(named: "dalton")!, "Do you have daltonism or not?"))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTestsCollectionView()
        addImages()
        // Do any additional setup after loading the view.
    }
    
    func setupTestsCollectionView(){
        tests.dataSource = self
        tests.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var testVC: StartATestViewController = segue.destination as! StartATestViewController
        testVC.currentTest = currentTest
    }
    

}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testDataSource.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = tests.dequeueReusableCell(withReuseIdentifier: "test cell", for: indexPath) as? TestCell{
            cell.updateName(with: testDataSource[indexPath.item].1)
            cell.updateImage(with: testDataSource[indexPath.item].0)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = tests.cellForItem(at: indexPath) as? TestCell{
            currentTest = cell.testName.text!
            self.performSegue(withIdentifier: "go to test", sender: self)
        }
    }
    
}

