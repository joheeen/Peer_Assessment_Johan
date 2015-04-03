//
//  ViewController.swift
//  Calculator
//
//  Created by Johan van der Meulen on 17/02/15.
//  Copyright (c) 2015 Johan van der Meulen. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    //An instance variable is called a property or .outlet in SWIFT
    //@IBOutlet is a syntax from Xcode. It creates a visual link to the view. hover the button on the left
    //All objects life in the heap. This is standard managed
    //weak is for the standar management. Don't worry about it
    
    //The ? at the end of a type like string? means the type optional. This can only have 2 values. not set (nil) / set (to something)
    //So the type of this is optional. and string is saying that its a optional variable that can be a string. not a string that can be optional!!
    
    @IBOutlet weak var display: UILabel!
    
    var brain = CalculatorBrain()
    
    //This var is badly coded. You should let swift automatically invert this to bool. See "operandStack" var
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) //--> return type
    {
        let digit = sender.currentTitle! //the ! unwrappes the currentTitle to a string instead of a optional string. If the values is nil than the program crashes. But sometimes you want this to happen.
        
        if userIsInTheMiddleOfTypingANumber
        {
            display.text = display.text! + digit
        }
        else
        {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
        println("digit = \(digit)")
    }
    
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperand(operation) {
                displayValue = result
            }
            else {
                displayValue = 0
            }
            
        }
//*********THIS WHOLE CHUNK IS NOT NECESSARY ANYMORE BECAUSE IT IS HANDLED IN THE MODEL
//        //the function that has been implemented in the performOperation here below is called an closure. Allows to put a function directly in there
//        //Also see the example of the commented x case. This is the same as the uncommented one.
//        switch operation {
//        //case "×": performOperation({ (op1: Double, op2: Double) -> Double in return op1 * op2 })
//        
//        //Swift is very good in something called typeInference. It can figure out wich type a variable is or has to be
//        //case "×": performOperation({ $0 * $1 }) When the func argument you pass in is the last argument required you need to pass it in like the example below. You can put it outside the constructor
////        case "×": performOperation() { $0 * $1 }
//            
//        //And when it is the only argument. You can do the following
//        case "×": performOperation { $0 * $1 }
//        case "÷": performOperation { $1 / $0 }
//        case "+": performOperation { $0 + $1 }
//        case "−": performOperation { $1 - $0 }
//        case "√": performOperation { sqrt($0) }
//            default: break
//}***********************************************************************************
    }
    
//********************SAME HERE*******************************************************
//    func performOperation(operation: (Double, Double) -> Double ){
//        if operandStack.count >= 2 {
//            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
//            enter()
//        }
//    }
//    func performOperation(operation: Double -> Double ){
//        if operandStack.count >= 1 {
//            displayValue = operation(operandStack.removeLast())
//            enter()
//        }
//    }
//    
//    func multiply(opt1: Double, opt2: Double) -> Double {
//        return opt1 * opt2
//}***********************************************************************************
    
    
    //the same code here. SWIFT automatically inverts the type. The commented example is bad coding
    //var operandStack: Array<Double> = Array<Double>()
    //var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
//****Also replaced by the model
//        operandStack.append(displayValue)
//        println("operandStack = \(operandStack)")
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            //This is ugly. Should be nil if it could. but displayValue is not a optional
            displayValue = 0
        }
    }
    
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            //newValue is a magic variable for set functions. If somewhere in the code the displayValue is changed than newValue is automatically this number
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
}

