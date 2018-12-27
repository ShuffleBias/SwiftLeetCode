//: [Previous](@previous)

import Foundation

func numIslands(_ grid: [[Character]]) -> Int {
    guard !grid.isEmpty else {
        return 0
    }
    
    var map = grid
    var numIslands = 0
    
    for y in 0..<grid.count {
        for x in 0..<grid[0].count {
            if map[y][x] == "1" {
                checkGrid(&map, x, y)
                numIslands += 1
            }
        }
    }
    return numIslands
}

/// DFS
func checkGrid(_ grid: inout [[Character]], _ x: Int, _ y: Int) {
    guard grid[y][x] == "1" else {
        return
    }
    
    grid[y][x] = "0"
    
    if x + 1 < grid[0].count {
        checkGrid(&grid, x + 1, y)
    }
    if y + 1 < grid.count {
        checkGrid(&grid, x, y + 1)
    }
    if x > 0{
        checkGrid(&grid, x - 1, y)
    }
    if y > 0 {
        checkGrid(&grid, x, y - 1)
    }
    
}

let test1: [[Character]] = [["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","1","1"]]
numIslands(test1) // 2
