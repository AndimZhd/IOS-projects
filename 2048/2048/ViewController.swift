//
//  ViewController.swift
//  2048
//
//  Created by AZHD on 27.08.21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var topGameBoardConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomGameBoardConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var board: UICollectionView!
    
    @IBOutlet weak var scoreLabel: ScoreLabel!
    
    var gameBoard: Board = Board()
    
    override func viewDidLoad() {
        gameBoard.placeANewNumber()
        gameBoard.placeANewNumber()
        super.viewDidLoad()
        setupCollectionView()
        setupGestures()
        setupScoreLabel()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupBoardSize()
        print(self.view.safeAreaLayoutGuide.layoutFrame)
    }
    
    func setupCollectionView() {
        board.dataSource = self
        setupCells()
    }
    
    func setupBoardSize(){
        topGameBoardConstraint.constant = (self.view.safeAreaLayoutGuide.layoutFrame.height - self.view.safeAreaLayoutGuide.layoutFrame.width)*0.4
        bottomGameBoardConstraint.constant = -(self.view.safeAreaLayoutGuide.layoutFrame.height - self.view.safeAreaLayoutGuide.layoutFrame.width)*0.6
        
    }
    
    func setupCells(){
        if let layout = board.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.itemSize = CGSize(width: self.view.bounds.size.width/4.2, height: self.view.bounds.size.width/4.2)
            layout.minimumLineSpacing = self.view.bounds.size.width/98
            layout.minimumInteritemSpacing = self.view.bounds.size.width/98
            //layout.collectionViewContentSize
        }
    }
    
    func setupScoreLabel(){
    }
    
    func setupGestures(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func swipeFunc(gesture: UISwipeGestureRecognizer){
        if gesture.direction == .right{
            gameBoard.moveRight()
            print("right")
        }
        else if gesture.direction == .left{
            gameBoard.moveLeft()
            print("left")
        }
        else if gesture.direction == .up{
            gameBoard.moveUp()
            print("up")
        }
        else if gesture.direction == .down{
            gameBoard.moveDown()
            print("down")
        }
        if gameBoard.isChanged{
            gameBoard.placeANewNumber()
        }
        board.reloadData()
        scoreLabel.updateScore(with: gameBoard.score)
        if gameBoard.isAlreadyLost(){
            alertAboutLoss()
        }
        if !gameBoard.hasWon{
            if gameBoard.hasJustWon {
                gameBoard.hasWon = true
                alertAboutWin()
            }
        }
    }
    
    @IBAction func startNewGame(_ sender: Any) {
        let alert = UIAlertController(title: "Be careful!", message: "Do you really want to restart? Current progress will be lost", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yep, I'm sure", style: .default, handler: {_ in self.restart() }))
        alert.addAction(UIAlertAction(title: "Fuck, go back", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func exitTheGame(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure?", message: "Do you really want to exit? Current progress will be lost", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yep, I'm sure", style: .default, handler: {_ in exit(0)}))
        alert.addAction(UIAlertAction(title: "Wait, I changed my mind", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    func alertAboutLoss(){
        let alert = UIAlertController(title: "You've lost", message: "You tried hard, but unfortunately you've lost :( ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK, start new game", style: .default, handler: {_ in self.restart() }))
        alert.addAction(UIAlertAction(title: "Exit the game", style: .cancel, handler: {_ in exit(0)}))

        self.present(alert, animated: true, completion: nil)
    }
    
    func alertAboutWin(){
        let alert = UIAlertController(title: "You've won", message: "Congrats, you've managed to win!! Do you want to continue playing?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "I want to continue!", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "I'm tired of it!", style: .cancel, handler: {_ in exit(0)}))

        self.present(alert, animated: true, completion: nil)
    }
    func restart(){
        for n in 0...3{
            for m in 0...3{
                gameBoard.board_[n][m] = 0
            }
        }
        gameBoard.score = 0
        gameBoard.placeANewNumber()
        gameBoard.placeANewNumber()
        board.reloadData()
        scoreLabel.updateScore(with: gameBoard.score)
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = board.dequeueReusableCell(withReuseIdentifier: "gameBoardCell", for: indexPath) as? GameBoardCell{
            let indexTuple = gameBoard.detectTheCell(with: indexPath.item)
            cell.updateLabel(with:String(gameBoard.board_[indexTuple.0][indexTuple.1]))
            //cell.layer.borderColor = UIColor.lightGray.cgColor
            //cell.layer.borderWidth = 0.1
            return cell
        }
        return UICollectionViewCell()
    }
}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.view.frame.width, height: self.view.frame.width)
//    }
//}



