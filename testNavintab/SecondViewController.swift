//
//  SecondViewController.swift
//  testNavintab
//
//  Created by ok on 15/12/16.
//  Copyright © 2015年 ok. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showSecondDetail(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SecondDetailViewController") as! SecondDetailViewController
        let navigationController = UINavigationController(rootViewController: vc)
        
        self.presentViewController(navigationController, animated: true, completion: nil)
//        self.showViewController(vc, sender: self)
    }

}

