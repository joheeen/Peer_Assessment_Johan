//
//  MasterViewController.swift
//  Psychologist
//
//  Created by Johan van der Meulen on 04/03/15.
//  Copyright (c) 2015 Johan van der Meulen. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    var masterModel = MasterViewModel()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dvc = segue.destinationViewController as? DetailViewController {
            
            if let identifier = segue.identifier {
                dvc.testString = identifier
            }
        }
    }
}

