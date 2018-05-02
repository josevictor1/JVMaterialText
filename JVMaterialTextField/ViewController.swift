//
//  ViewController.swift
//  JVMaterialTextField
//
//  Created by José Victor Pereira Costa on 21/04/2018.
//  Copyright © 2018 José Victor Pereira Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBAction func animate(_ sender: Any) {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.firstView.alpha = 1
            self.secondView.alpha = 0
        })
        UIView.animate(withDuration: 1.0, delay: 2.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.firstView.alpha = 0
            self.secondView.alpha = 1
            
            self.secondView.center.y += 20
        }, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

