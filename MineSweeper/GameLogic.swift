//
//  GameLogic.swift
//  MineSweeper
//
//  Created by Egor Chernakov on 06.04.2021.
//

import Foundation

struct Tile {
    var isOpened: Bool
    var isFlagged: Bool
    var value: String
}

class GameLogic {
    
    private static let bombOptions = [10, 40, 90]
    private static let sizeOptions = [(10, 10), (16, 16), (16, 30)]
    
    var tiles = [Tile]()
    var bombsIndexes = [Int]()
    let rows: Int
    let columns: Int
    
    init(difficulty: Int) {
        rows = GameLogic.sizeOptions[difficulty].0
        columns = GameLogic.sizeOptions[difficulty].1
        
        for _ in 0..<rows {
            for _ in 0..<columns {
                tiles.append(Tile(isOpened: false, isFlagged: false, value: "0"))
            }
        }
        
        generateBombs(size: difficulty)
        populateTiles()
    }
    
    func populateTiles() {
        for bombIndex in bombsIndexes {
            tiles[bombIndex].value = "B"
            for c in -1...1 {
                for p in -1...1 {
                    let checkIndex = bombIndex + c * columns + p
                    if checkIndex >= 0 && checkIndex < tiles.count {
                        if let value = Int(tiles[checkIndex].value) {
                            tiles[checkIndex].value = "\(value + 1)"
                        }
                    }
                }
            }
        }
    }
    
    func generateBombs(size: Int) {
        let numbers = Array(0..<rows*columns)
                
        for _ in 0..<GameLogic.bombOptions[size] {
            bombsIndexes.append(numbers[Int.random(in: 0..<numbers.count)])
        }
    }
}
