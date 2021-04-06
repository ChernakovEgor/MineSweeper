//
//  GameViewController.swift
//  MineSweeper
//
//  Created by Egor Chernakov on 06.04.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    var minefield: [UIButton]!
    var gameLogic: GameLogic!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        gameLogic = GameLogic(difficulty: 0)
        createMinefield()
    }
    
    func createMinefield() {
        let size = 30
        let rectSize = size * 10 + 2*9
        let minefieldView = UIView(frame: CGRect(x: (Int(view.frame.width) - rectSize)/2, y: 40, width: rectSize, height: rectSize))
        //minefieldView.translatesAutoresizingMaskIntoConstraints = false
        minefieldView.backgroundColor = .lightGray
        minefieldView.layer.borderWidth = 1
        minefieldView.layer.borderColor = UIColor.red.cgColor
        view.addSubview(minefieldView)
        
        
        
       //NSLayoutConstraint.activate([
            //minefieldView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            //
        //minefieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -minefieldView.frame.width/2)
        //])
        
        //view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[mine]-|", options: [], metrics: nil, views: ["mine" : minefieldView]))
        
        minefield = [UIButton]()
        
        for row in 0...9 {
            for column in 0...9 {
                let button = UIButton()
                button.tag = row*10 + column
                
                let frame = CGRect(x: column * (size + 2), y: row * (size + 2), width: size, height: size)
                
                button.frame = frame
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.black.cgColor
                
                let tile = gameLogic.tiles[row * 10 + column]
                button.setTitle(tile.value, for: .normal)
                
                minefieldView.addSubview(button)
                minefield.append(button)
            }
        }
        
        
    }
}
