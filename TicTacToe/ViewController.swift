//
//  ViewController.swift
//  TicTacToe
//
//  Created by David Fisher on 3/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    var game : TicTacToeGame!
    let xImage = UIImage(named: "X.png")
    let oImage = UIImage(named: "O.png")
    let noneImage = UIImage(named: "empty.png")
    
    @IBOutlet weak var gameStateLabel: UILabel!
    
    
    @IBOutlet var gameBoardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = TicTacToeGame()
        updateView()
    }

    @IBAction func pressedNewGame(_ sender: Any) {
        game = TicTacToeGame()
        updateView()
    }
    
    @IBAction func pressedGameBoardButton(_ sender: Any) {
        let button = sender as! UIButton
//        if let button = sender as? UIButton {
//
//        }
//        guard let button = sender as? UIButton else {
//            return
//        }
        game.pressedSquare(at: button.tag)
        updateView()
    }
    
    func updateView() {
        gameStateLabel.text = game.state.rawValue
        for k in 0..<9 {
            let button = gameBoardButtons[k]
            let mark = game.board[k]
            switch mark {
            case .x:
                button.setImage(xImage, for: .normal)
            case .o:
                button.setImage(oImage, for: .normal)
            case .none:
                button.setImage(noneImage, for: .normal)
            }
        }
    }
}

