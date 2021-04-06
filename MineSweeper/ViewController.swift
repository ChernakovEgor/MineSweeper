//
//  ViewController.swift
//  MineSweeper
//
//  Created by Egor Chernakov on 06.04.2021.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var titleLabel: UILabel!
    var difficultyPicker: UIPickerView!
    var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        
        configureTitle()
        configurePicker()
        configureStartButton()
    }
    
    @objc func beginGame() {
        let gameViewController = GameViewController()
        gameViewController.modalPresentationStyle = .fullScreen
        present(gameViewController, animated: true)
    }
}

//MARK: UI Config
extension ViewController {
    
    func configureTitle() {
        titleLabel = UILabel()
        
        view.addSubview(titleLabel)
        titleLabel.text = "MineSweeper"
        titleLabel.font = UIFont.systemFont(ofSize: 44)
        
        //titleLabel.backgroundColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.sizeToFit()
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func configurePicker() {
        difficultyPicker = UIPickerView()
        difficultyPicker.delegate = self
        difficultyPicker.translatesAutoresizingMaskIntoConstraints = false
        //difficultyPicker.sizeToFit()
        view.addSubview(difficultyPicker)
        
        NSLayoutConstraint.activate([
            difficultyPicker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            difficultyPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureStartButton() {
        startButton = UIButton(type: .system)
        
        startButton.setTitle("Begin", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.setTitleColor(.white, for: .highlighted)
        
        startButton.addTarget(self, action: #selector(beginGame), for: .touchUpInside)
        
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

//MARK: Picker Delegate & DataSource
extension ViewController {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "Easy"
        case 1:
            return "Medium"
        case 2:
            return "Hard"
        default:
            return ""
        }
    }
}

