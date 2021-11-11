//
//  TestViewController.swift
//  InterestingTests
//
//  Created by AZHD on 2.09.21.
//

import UIKit

class TestViewController: UIViewController {
    
    var test: Test!
    
    @IBOutlet weak var goBackButton: UIButton!
    
    @IBOutlet weak var question: Question!
    
    @IBOutlet weak var answersCollectionView: UICollectionView!
    
    var recievedString:String = ""
    
    var currentAnswerDataSource = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        switch recievedString {
        case "Do you have daltonism or not?":
            break
        case "Are you a gay?":
            break
        case "Are you a reptiloid?":
            break
        case "What smesharik are you?":
            test = SmesharikTest()
        case "Who are you from gachi?":
            break
        default:
            break
        }
        print(test.getCurrentQuestion())
        currentAnswerDataSource =  test.getCurrentAnswerOptions()
        print(currentAnswerDataSource)
        question.label.text = test.getCurrentQuestion()
        question.image.image = test.getCurrentImage()
        setupCollectionView()
    }
    
    func setupCollectionView(){
        answersCollectionView.dataSource = self
        answersCollectionView.delegate = self
        setCellSize()
    }
    
    func setCellSize(){
        if let layout = answersCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.itemSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.width/15)
            layout.minimumLineSpacing = 0
            //layout.collectionViewContentSize
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if segue.identifier == "go back"{
            var testVC: ViewController = segue.destination as! ViewController
        }
        else{
            var resultVC: ResultViewController = segue.destination as! ResultViewController
            let result = test.countResult()
            resultVC.resultText = result.0
            resultVC.resultImage = result.1
            test.clear()
            
        }
    }
}

extension TestViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return test.getCurrentAnswerOptions().count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = answersCollectionView.dequeueReusableCell(withReuseIdentifier: "answer", for: indexPath) as? AnswerCell{
            currentAnswerDataSource = test.getCurrentAnswerOptions()
            cell.updateLabel(with: currentAnswerDataSource[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension TestViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = answersCollectionView.cellForItem(at: indexPath) as? AnswerCell{
            test.processNewInformation(index: indexPath.item)
            if test.isOver(){
                performSegue(withIdentifier: "showResult", sender: nil)
            }
            answersCollectionView.reloadData()
            setCellSize()
            setupCollectionView()
            question.label.text = test.getCurrentQuestion()
            question.image.image = test.getCurrentImage()
        }
    }
}

