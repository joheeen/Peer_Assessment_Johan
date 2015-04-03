// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func average (getallen : [Double]) -> Double {
    
    var number = Double()
    var i = 0
    var counts: AnyObject = 0.0
    
    for (i ; i < getallen.count; i++) {
        number += getallen[i]
        counts = i + 1
    }
    
    let numberOfLoops : Double = counts.doubleValue
    
    let average = number / numberOfLoops

    
    return average
}

average([1.0, 2.0, 3.0])


//Draai een lijst om [0, 1, 2, 3, 4]

func RevertArray(array : [AnyObject]) -> [AnyObject] {
    
    var newArray = [AnyObject]()
    
    for (var i = (array.count - 1); i >= 0; i--) {
        
        newArray.append(array[i])
    }
    
    return newArray
}

var oldArray = [0, 1, 2, 3, 4]
var newArray = RevertArray(oldArray)

//Voeg aan klant voornaam toe
//Voeg adres toe aan klant. adres is een nieuwe class
//voeg een krediet toe
//maak een lijst met klanten geeft elke klant een krediet

class Customer {
   
    let firstname: String
    var credit: Int
    var adres = Adres()
    
    init(customerName : String, currentCredit : Int) {
        firstname = customerName
        credit = currentCredit
    }
    
}

class Adres {
    let zipCode: String?
    let streetName: String?
    let city: String?
    
    init() { }
    
}

var customers = [Customer(customerName: "Eddy", currentCredit: 200), Customer(customerName: "Jerome", currentCredit: 500), Customer(customerName: "Judy", currentCredit: 150), Customer(customerName: "Julia", currentCredit: 650), Customer(customerName: "Jake", currentCredit: 340)]

//maak een functie die de armste klant eruit haalt.

func ReturnPoorestPerson(Customers : [Customer]) -> (customer: Customer,index: Int) {
    var credit = Customers[0].credit
    var PoorestCustomer = Customers[0]
    var index = 0
    
    for (var i = 0; i < Customers.count; i++) {
        var LoopCredit = Customers[i].credit
        
        if (credit > LoopCredit) {
            credit = LoopCredit
            PoorestCustomer = Customers[i]
            index = i
        }
        
    }
    
    return (PoorestCustomer, index)
}

var PoorestPerson = ReturnPoorestPerson(customers)


//Wijzig de volgorde van de klanten lijst en zet de armste vooraan en de rijkste achteraan
func SetOrderFromPoorestToRichest(customers : [Customer]) -> [Customer] {
    
    var poorestToRichestArray =  [Customer]()
    var removeAbleArray = customers
    
    for (var i = 0; i < customers.count; i++ ) {
        
        var poorestCustomer = ReturnPoorestPerson(removeAbleArray)
        poorestToRichestArray.append(poorestCustomer.customer)
        removeAbleArray.removeAtIndex(poorestCustomer.index)
        
    }
    return poorestToRichestArray
}

var poorestToRichest = SetOrderFromPoorestToRichest(customers)







