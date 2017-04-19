//
//  ViewController.swift
//  SimpleCalc
//
//  Created by iGuest on 4/1/17.
//  Copyright © 2017 Yiran Juan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    var MiddleOfTyping = false
    var factorial = 1
    var inputArray = [Int]()
    var tempResult = 0
    var operation = ""
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if MiddleOfTyping == true {
            let textCurrentDisplay = result.text!
            result!.text = textCurrentDisplay + digit
        } else {
            result.text = digit
            MiddleOfTyping = true
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        let symbol = sender.currentTitle! //store the input operation
        operation = symbol
        inputArray.append((Int)(result.text!)!)
        
        switch symbol {
        case "+", "-", "*", "/", "%", "count", "avg":
            result.text = operation
        case "fact":
            for i in 1...inputArray[0] { // from 1 to 5+1
                factorial = factorial * i
            }
            result.text = String(factorial)
            
            MiddleOfTyping = false
            factorial = 1
            inputArray = [Int]()
            tempResult = 0
            operation = ""
        default:
            break
        }
        MiddleOfTyping = false
    }
    
    @IBAction func returnOperation(_ sender: UIButton) {
        inputArray.append((Int)(result.text!)!)
        
        switch operation {
        case "+":
            tempResult = inputArray[0] + inputArray[1]
        case "-":
            tempResult = inputArray[0] - inputArray[1]
        case "*":
            tempResult = inputArray[0] * inputArray[1]
        case "/":
            tempResult = inputArray[0] / inputArray[1]
        case "%":
            tempResult = inputArray[0] % inputArray[1]
        case "count":
            tempResult = inputArray.count
        case "avg":
            var temp = 0
            for i in 1...inputArray.count {
                temp = temp + inputArray[i-1]
            }
            tempResult = temp / inputArray.count
        default:
            break
        }
        result.text = (String)(tempResult)
        
        MiddleOfTyping = false
        factorial = 1
        inputArray = [Int]()
        tempResult = 0
        operation = ""
    }
    
}
    


