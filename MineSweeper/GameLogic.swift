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
    
    var difficulty: Int!
    var numberOfBombs: Int!
    
    var tiles = [Tile]()
    var bombsIndexes = [Int]()
    let rows: Int
    let columns: Int
    
    init(difficulty: Int) {
        self.difficulty = difficulty
        numberOfBombs = GameLogic.bombOptions[difficulty]
        rows = GameLogic.sizeOptions[difficulty].0
        columns = GameLogic.sizeOptions[difficulty].1
        
        for _ in 0..<rows {
            for _ in 0..<columns {
                tiles.append(Tile(isOpened: false, isFlagged: false, value: "0"))
            }
        }
        
        generateBombs()
        populateTiles()
    }
    
    private func populateTiles() {
        for bombIndex in bombsIndexes {
            tiles[bombIndex].value = "B"
            for c in -1...1 {
                for p in -1...1 {
                    let checkIndex = bombIndex + c * columns + p
                    
                    if isValid(row: checkIndex / rows, column: checkIndex % columns) {
                        if let value = Int(tiles[checkIndex].value) {
                            tiles[checkIndex].value = "\(value + 1)"
                        }
                    }
                }
            }
        }
    }
    
    private func generateBombs() {
        var numbers = Array(0..<rows*columns)
                
        numbers.shuffle()
        let first = numbers.dropFirst(numbers.count - numberOfBombs)

        bombsIndexes = Array(first)
    }
    
    private func isValid(row: Int, column: Int) -> Bool {
        return (row >= 0 && row < rows) && (column >= 0 && column < columns)
    }
}
