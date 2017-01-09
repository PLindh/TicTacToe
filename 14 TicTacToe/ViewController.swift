//
//  ViewController.swift
//  14 TicTacToe
//
//  Created by Plindh on 11/16/16.
//  Copyright © 2016 Plindh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gridLabel0: UILabel!
    @IBOutlet var gridLabel1: UILabel!
    @IBOutlet var gridLabel2: UILabel!
    @IBOutlet var gridLabel3: UILabel!
    @IBOutlet var gridLabel4: UILabel!
    @IBOutlet var gridLabel5: UILabel!
    @IBOutlet var gridLabel6: UILabel!
    @IBOutlet var gridLabel7: UILabel!
    @IBOutlet var gridLabel8: UILabel!
    @IBOutlet var backgroundView: UIView!
    
    var labelsArray = [GridLabel]()
    var xTurn = true
    var gameOver = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray.append(gridLabel0! as! GridLabel)
        labelsArray.append(gridLabel1 as! GridLabel)
        labelsArray.append(gridLabel2 as! GridLabel)
        labelsArray.append(gridLabel3 as! GridLabel)
        labelsArray.append(gridLabel4 as! GridLabel)
        labelsArray.append(gridLabel5 as! GridLabel)
        labelsArray.append(gridLabel6 as! GridLabel)
        labelsArray.append(gridLabel7 as! GridLabel)
        labelsArray.append(gridLabel8 as! GridLabel)
    }
    
    func checkForWinner() {
      // horz ------------------------------------------------------------------
        if checkLineForWinner(a: 0, b: 1, c: 2) {
            displayWinningMessage(message: "\(labelsArray[0].text!) is the winner")
        }
        else if checkLineForWinner(a: 3, b: 4, c: 5) {
            displayWinningMessage(message: "\(labelsArray[3].text!) is the winner")
        }
        else if checkLineForWinner(a: 6, b: 7, c: 8) {
            displayWinningMessage(message: "\(labelsArray[6].text!) is the winner")
        }
        //verts ------------------------------------------------------------------
        else if checkLineForWinner(a: 0, b: 3, c: 6) {
            displayWinningMessage(message: "\(labelsArray[0].text!) is the winner")
        }
        else if checkLineForWinner(a: 1, b: 4, c: 7) {
            displayWinningMessage(message: "\(labelsArray[1].text!) is the winner")
        }
        else if checkLineForWinner(a: 2, b: 5, c: 8) {
            displayWinningMessage(message: "\(labelsArray[2].text!) is the winner")
        }
       //diags ------------------------------------------------------------------
        else if checkLineForWinner(a: 0, b: 4, c: 8) {
            displayWinningMessage(message: "\(labelsArray[0].text!) is the winner")
        }
        else if checkLineForWinner(a: 2, b: 4, c: 6) {
            displayWinningMessage(message: "\(labelsArray[2].text!) is the winner")
        }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    func displayWinningMessage(message:String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
            (action) -> Void in self.resetGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer) {
        if gameOver {
            return
        }
        var canPlay = false
        for label in labelsArray {
            if label.frame.contains(sender.location(in: backgroundView)) {
                if label.canTap {
                if(xTurn) {
                    label.text = "X"
                }
                else {
                    label.text = "O"
                }
                xTurn = !xTurn
                label.canTap = false
                checkForWinner()
            }
        }
            if label.canTap {
                canPlay = true
            }
    }
        if !canPlay && !gameOver {
            displayWinningMessage(message: "Cat's Game")
        }
    }

    func resetGame () {
        for label in labelsArray {
            label.text = ""
            label.canTap = true
        }
        xTurn = true
     gameOver = false
    }

    func checkLineForWinner(a: Int, b: Int, c: Int) -> Bool {
        if labelsArray[a].text != "" &&
            labelsArray[a].text == labelsArray[b].text &&
            labelsArray[b].text == labelsArray[c].text  {
            return true
    }
    return false
}

}

