//
//  Board.swift
//  2048
//
//  Created by AZHD on 27.08.21.
//

class Board {
    var score:Int = 0
    var board_ = [[Int]]()
    var isChanged = false
    var hasJustWon = false
    var hasWon = false
    init(){
        for i in 0...3{
            board_.append([Int]())
            for _ in 1...4{
                board_[i].append(0)
            }
        }
    }
    func printTheBoard(){
        for n in 0...3{
            for m in 0...3{
                print(board_[n][m]==0 ? " " : board_[n][m])
            }
        }
    }
    
    
    func moveUp(){
        isChanged = false
        for m in 0...3{
            for n in 0...2{
                for i in n+1...3 {
                    if board_[i][m]==0{
                        continue
                    }
                    if board_[n][m]==0{
                        let helpingBox = board_[i][m]
                        board_[i][m] = board_[n][m]
                        board_[n][m] = helpingBox
                        isChanged = true
                    }
                    if board_[i][m]==board_[n][m]{
                        board_[n][m]*=2
                        board_[i][m] = 0
                        score+=board_[n][m]
                        isChanged = true
                        if !hasWon{
                            if board_[n][m] == 2048{
                                hasJustWon = true
                            }
                        }
                        break
                    }
                }
            }
        }
    }
    
    func moveDown(){
        isChanged = false
        for m in 0...3{
            for n in (1...3).reversed(){
                for i in (0...n-1).reversed(){
                    if board_[i][m]==0{
                        continue
                    }
                    if board_[n][m]==0{
                        let helpingBox = board_[i][m]
                        board_[i][m] = board_[n][m]
                        board_[n][m] = helpingBox
                        isChanged = true
                    }
                    if board_[i][m]==board_[n][m]{
                        board_[n][m]*=2
                        board_[i][m] = 0
                        score+=board_[n][m]
                        isChanged = true
                        if !hasWon{
                            if board_[n][m] == 2048{
                                hasJustWon = true
                            }
                        }
                        break
                    }
                }
            }
        }
    }
    
    func moveRight(){
        isChanged = false
        for n in 0...3{
            for m in (1...3).reversed(){
                for i in (0...m-1).reversed(){
                    if board_[n][i]==0{
                        continue
                    }
                    if board_[n][m]==0{
                        let helpingBox = board_[n][m]
                        board_[n][m] = board_[n][i]
                        board_[n][i] = helpingBox
                        isChanged = true
                    }
                    if board_[n][i]==board_[n][m]{
                        board_[n][m]*=2
                        board_[n][i]=0
                        score+=board_[n][m]
                        isChanged = true
                        if !hasWon{
                            if board_[n][m] == 2048{
                                hasJustWon = true
                            }
                        }
                        break
                    }
                    
                }
            }
        }
    }
    func moveLeft(){
        isChanged = false
        for n in 0...3{
            for m in 0...2{
                for i in (m+1)...3{
                    if board_[n][i]==0{
                        continue
                    }
                    if board_[n][m]==0{
                        let helpingBox = board_[n][m]
                        board_[n][m] = board_[n][i]
                        board_[n][i] = helpingBox
                        isChanged = true
                    }
                    if board_[n][i]==board_[n][m]{
                        board_[n][m]*=2
                        board_[n][i]=0
                        score+=board_[n][m]
                        isChanged = true
                        if !hasWon{
                            if board_[n][m] == 2048{
                                hasJustWon = true
                            }
                        }
                        break
                    }
                    
                }
            }
        }
    }
    
    func generateANumber()->Int{
        let twoOrFour = Int.random(in: 0...9)
        return twoOrFour == 0 ? 4 : 2
    }
    
    func detectFreeSpace()->Int{
        var numberOfFreeCells = 0
        for n in 0...3{
            for m in 0...3{
                if board_[n][m] == 0{
                    numberOfFreeCells += 1
                }
            }
        }
        return numberOfFreeCells
    }
    func placeANewNumber(){
        if detectFreeSpace()==0 {return}
        let number = generateANumber()
        let position = Int.random(in: 1...detectFreeSpace())
        var currentPosition = 0
        for n in 0...3{
            for m in 0...3{
                if board_[n][m] == 0{
                    currentPosition+=1
                    if currentPosition == position{
                        board_[n][m] = number
                        return
                    }
                }
            }
        }
    }
    func isAlreadyLost() -> Bool{
        if detectFreeSpace() != 0 {return false}
        for n in 0...3{
            for m in 0...3{
                if n<3{
                    if board_[n+1][m]==board_[n][m]{return false}
                }
                if m<3{
                    if board_[n][m+1]==board_[n][m]{return false}
                }
            }
        }
        return true
    }
    func detectTheCell(with index: Int)->(Int, Int){
        return (index/4, index%4)
    }
}

