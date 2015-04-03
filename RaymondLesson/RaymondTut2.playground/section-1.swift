// Playground - noun: a place where people can play

import UIKit

//Generic functions

func ReverseArray<T>(generics : [T]) -> [T] {
    
    var newGenerics = [T]()
    
    for generic in generics {
        
        newGenerics.insert(generic, atIndex: 0)

    }
    
    return newGenerics
}


ReverseArray([1, 2, 3, 4])
ReverseArray(["a", "b", "c", "d"])
ReverseArray([1, "a", 2.0, "b", 3.123, "c", 4, "d"])

