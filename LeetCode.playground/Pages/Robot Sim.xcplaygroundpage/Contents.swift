//: [Previous](@previous)

import Foundation

enum Direction {
    
    case north, east, south, west
    
    var vector: (Int, Int) {
        switch self {
        case .north:
            return (0, 1)
        case .south:
            return (0, -1)
        case .west:
            return (-1, 0)
        case .east :
            return (1, 0)
        }
    }
    
    var right: Direction {
        switch self {
        case .north:
            return .east
        case .south:
            return .west
        case .west:
            return .north
        case .east :
            return .south
        }
    }
    
    var left: Direction {
        switch self {
        case .north:
            return .west
        case .south:
            return .east
        case .west:
            return .south
        case .east :
            return .north
        }
    }
    
}

func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
    var obstacleSet = Set<[Int]>()
    
    for obstacle in obstacles {
        obstacleSet.insert(obstacle)
    }
    
    var maxDistance = 0
    var x = 0
    var y = 0
    var direction: Direction = .north
    
    for command in commands {
        switch command {
        case -2:
            direction = direction.left
        case -1:
            direction = direction.right
        case 1...9:
            let xV = direction.vector.0
            let yV = direction.vector.1
            for _ in 1...command {
                guard obstacleSet.contains([x + xV, y + yV])  else {
                    break
                }
                x += xV
                y += yV
            }
            
            maxDistance = max(maxDistance, (x * x) + (y * y))
        default:
            print("Invalid Command.")
        }
    }
    
    return maxDistance
}

robotSim([6,-1,1,-2,2,-2,1,-1,6],[[0,2],[0,4]]) // 10
