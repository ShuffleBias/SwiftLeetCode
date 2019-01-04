//: [Previous](@previous)

import Foundation

func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rowSets = [Int:Set<Character>]()
    var colSets = [Int:Set<Character>]()
    var squareSets = [Int:Set<Character>]()
    
    for i in 0...8 {
        rowSets[i] = Set<Character>()
        colSets[i] = Set<Character>()
        squareSets[i] = Set<Character>()
    }
    
    var rowCounter = 0
    var colCounter = 0
    for row in 0...8 {
        if row != 0 && row % 3 == 0 {
            rowCounter += 3
        }
        for col in 0...8 {
            
            if col == 0 {
                colCounter = 0
            } else if col % 3 == 0 {
                colCounter += 1
            }
            
            let number = board[row][col]
            guard number != "." else {
                continue
            }
            
            let square: Int = colCounter + rowCounter
            
            guard !rowSets[row]!.contains(number) && !colSets[col]!.contains(number) && !squareSets[square]!.contains(number) else {
                print("\(row) \(col) \(square)")
                return false
            }
            
            rowSets[row]!.insert(number)
            colSets[col]!.insert(number)
            squareSets[square]!.insert(number)
        }

    }
    
    return true
}

isValidSudoku([["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]])
