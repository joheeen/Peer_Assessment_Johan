//
//  DetailViewController.swift
//  Psychologist
//
//  Created by Johan van der Meulen on 04/03/15.
//  Copyright (c) 2015 Johan van der Meulen. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {

    var testString: String?
    
    override func viewDidLoad() {
        testTextLabel.text = testString
    }
    
    @IBOutlet weak var testTextLabel: UILabel!
    
}


