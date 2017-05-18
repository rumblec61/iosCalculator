//
//  ViewController.swift
//  Calculator
//
//  Created by Katy Rumble on 5/2/17.
//  Copyright © 2017 CSC215. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    //Declaring variables!
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        firstNumberText = ""
        secondNumberText = ""
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        default:
            return 0
        }
    }

    @IBAction func numberTapped(_ sender: UIButton) {
        
        if canClear {
            resultLabel.text = ""
            canClear = false
        }
        let currentText = resultLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+", "-":
                if hasOp {
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                resultLabel.text = "\(currentText) \(op) "
                break
            case "=":
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculate()
                resultLabel.text = "\(result)"
                break
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                resultLabel.text = "\(currentText)\(text)"
                break;
            }
        }
        
    }

}

