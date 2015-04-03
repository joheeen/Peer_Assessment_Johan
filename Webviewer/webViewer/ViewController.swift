//
//  ViewController.swift
//  webViewer
//
//  Created by Johan van der Meulen on 02/03/15.
//  Copyright (c) 2015 Johan van der Meulen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputBar: UITextField!
    
    @IBOutlet weak var uiWebView: UIWebView!
    
    
    @IBAction func urlButtonPressed(sender: UIButton) {
        //Checking if the string starts with HTTP
        var correctedUrl = checkForCorrectURL(inputBar.text!)
    
        //Converting the string to an URL and URLRequest
        var url = NSURL(string: inputBar.text)
        var req = NSURLRequest(URL: url!)
        uiWebView.loadRequest(req)
    }
    
    func checkForCorrectURL (inputText :String)->String
    {
        let urlString : String = inputText
        let urlChar = Array(urlString)

        if (urlChar.count > 0)
        {
            if urlChar[0] == "w" && urlChar[3] == "."
            {
                println("add HTTPS")
            }
            else
            {
                println("nothing to see here")
            }
        }
        else
        {
            println("TextBar is empty")
        }
        
        return urlString
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        println("Opening application")
    }


}

