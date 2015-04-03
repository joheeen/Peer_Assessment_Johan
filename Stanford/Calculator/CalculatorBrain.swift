//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Johan van der Meulen on 18/02/15.
//  Copyright (c) 2015 Johan van der Meulen. All rights reserved.
//

//All the class/functions/variables etc are standard public if not otherwise specified
//Private makes it private DUH!
//Public makes it public from outside the application. Like when building frameworks. You will almost never use this

import Foundation

class CalculatorBrain {
    
    //We are telling SWIFT here that it gets the same protocol as :Printable. Enums are a struct and cannot have inheritence. Only classes can. So this is a PROTOCOL
    private enum Op: Printable
    {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        
        //Valuable for debugging. We are teaching the enum how to convert itself to a string. But readonly
        var description: String {
            get{
                switch self {
                case .Operand(let operand):
                    return "\(operand)"
                case .UnaryOperation(let symbol,_):
                    return "\(symbol)"
                case .BinaryOperation(let symbol,_):
                    return "\(symbol)"
                }
            }
        }
    }
    
    //The prefered syntax
    //var opStack = Array<Op>()
    private var opStack = [Op]()
    
    //in the dictionary the first arg is the key, the second one is the value
    //var knownOps = Dictionary<String, Op>()
    //The prefered syntax
    private var knownOps = [String: Op]()
    
    //When someone calls CalculatorBrain() this initialise function is being run
    init() {
        //These are allready very clean. But it can even be more clean/ Check the code below, it does the same
//        knownOps["×"] = Op.BinaryOperation("×") { $0 * $1 }
//        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
//        knownOps["−"] = Op.BinaryOperation("−") { $1 - $0 }
//        knownOps["+"] = Op.BinaryOperation("+") { $0 + $1 }
//        knownOps["√"] = Op.UnaryOperation("√") { sqrt($0) }
        
          knownOps["×"] = Op.BinaryOperation("×", *)
          knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
          knownOps["−"] = Op.BinaryOperation("−") { $1 - $0 }
          knownOps["+"] = Op.BinaryOperation("+", +)
          knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    //"tuples" is a type that holds two different types.
//    func evaluate(ops: [Op]) -> (Double?, [Op]) {
//        
//    }
//  You can also give the twopall a name defenition
//    func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {
//        if !ops.isEmpty {
//The following line of code has an error. This is because ops is immutable. Wich is because its an array and thats a sctruct. *Quick Explanation:
// When you pass arguments in a function unless its an instance of a class. the thing you pass is copied. Passed by value. Arrays and dictionaries are no classes in SWIFT. They are structs. Structs and classes look alot alike, The can have values, the can have functions. They are almost directly identical. The 2 big differences between structs and classes in swift are: 1) Classes can have inheritance and Struct cannot. 2) Structs are passed by value, and Classes are past by reference
//            let op = ops.removeLast()
//        }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            
            switch op {
            case .Operand(let operand):
                return (operand, remainingOps)
                
            case .UnaryOperation(_, let operation):
            let operandEvaluation = evaluate(remainingOps)
            if let operand = operandEvaluation.result {
                return (operation(operand), operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate(remainingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return (operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
            }
        }

        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        let (result, remainder) = evaluate(opStack)
        println("\(opStack) = \(result) with \(remainder) left over")
        return result
    }
    
    func pushOperand(operand: Double) -> Double? {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperand(symbol: String) -> Double? {
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        return evaluate()
    }
}