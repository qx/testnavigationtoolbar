//
//  FireViewController.swift
//  testNavintab
//
//  Created by ok on 15/12/16.
//  Copyright © 2015年 ok. All rights reserved.
//

import UIKit

class FireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func fireone(sender: AnyObject) {
        let vc = UIViewController()
        self.navigationController?.showViewController(vc, sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
