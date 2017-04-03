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
    var MiddleOperation = true
    var inputNumber1 = 0
    var inputNumber2 = 0
    var tempResult = 0
    var returnCounter = 0
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
        
        inputNumber1 = (Int)(result.text!)! //store the first input number
        switch symbol {
        case "+":
            result.text = "+"
        case "-":
            result.text = "-"
        case "*":
            result.text = "*"
        case "/":
            result.text = "/"
        case "%":
            result.text = "%"
        case "count":
            result.text = String(inputArray.count)
            
            MiddleOfTyping = false
            factorial = 1
            inputArray = [Int]()
            MiddleOperation = true
            inputNumber1 = 0
            inputNumber2 = 0
            tempResult = 0
            returnCounter = 0
            operation = ""
        case "avg":
            var temp = 0
            for i in 1...inputArray.count {
                temp = temp + inputArray[i-1]
            }
            let avg = temp / inputArray.count
            result.text = String(avg)
            
            MiddleOfTyping = false
            factorial = 1
            inputArray = [Int]()
            MiddleOperation = true
            inputNumber1 = 0
            inputNumber2 = 0
            tempResult = 0
            returnCounter = 0
            operation = ""
        case "fact":
            for index in inputArray {
                factorial = factorial * index
            }
            result.text = String(factorial)
            
            MiddleOfTyping = false
            factorial = 1
            inputArray = [Int]()
            MiddleOperation = true
            inputNumber1 = 0
            inputNumber2 = 0
            tempResult = 0
            returnCounter = 0
            operation = ""
        default:
            break
        }
        MiddleOperation = false
        
    }
    
    @IBAction func returnOperation(_ sender: UIButton) {
        if result.text?.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil { //input is number
            inputArray.append(Int(result.text!)!)
        }
        
        returnCounter = returnCounter + 1
        MiddleOfTyping = false
        
        if returnCounter == 3 && operation.characters.count != 0{ //input is string
            inputNumber2 = (Int)(result.text!)! //store the second input number
            switch operation {
            case "+":
                tempResult = inputNumber1 + inputNumber2
            case "-":
                tempResult = inputNumber1 - inputNumber2
            case "*":
                tempResult = inputNumber1 * inputNumber2
            case "/":
                tempResult = inputNumber1 / inputNumber2
            case "%":
                tempResult = inputNumber1 % inputNumber2
            default:
                break
            }
            
            result.text = (String)(tempResult)
            MiddleOfTyping = false
            factorial = 1
            inputArray = [Int]()
            MiddleOperation = true
            inputNumber1 = 0
            inputNumber2 = 0
            tempResult = 0
            returnCounter = 0
            operation = ""
        }
        
        
    }
    
}

