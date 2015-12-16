//
//  FireViewController.swift
//  testNavintab
//
//  Created by ok on 15/12/16.
//  Copyright © 2015年 ok. All rights reserved.
//

import UIKit
extension UINavigationController{
    func setToolBarVisible(visible: Bool, animated: Bool) {
        self.toolbar.hidden = !visible
        // bail if the current state matches the desired state
        //        if (toolBarIsVisible() == visible) {
        //            return
        //        }
        //
        //        // get a frame calculation ready
        //        let frame = self.toolbar.frame
        //        let height = frame.size.height
        //        let offsetY = (visible ? -height : height)
        //
        //        // animate the tabBar
        //        UIView.animateWithDuration(animated ? 0.3 : 0.0) {
        //            self.toolbar.frame = CGRectOffset(frame, 0, offsetY)
        //            self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height + offsetY)
        //            self.view.setNeedsDisplay()
        //            self.view.layoutIfNeeded()
        //        }
    }
    func toolBarIsVisible() -> Bool {
        //        return self.toolbar.frame.origin.y < CGRectGetMaxY(self.view.frame)
        return !self.toolbarHidden
    }
}
extension UITabBarController {
    
    func setTabBarVisible(visible: Bool, animated: Bool) {
        
        // bail if the current state matches the desired state
        if (tabBarIsVisible() == visible) {
            return
        }
        
        // get a frame calculation ready
        let frame = self.tabBar.frame
        let height = frame.size.height
        let offsetY = (visible ? -height : height)
        
        // animate the tabBar
        UIView.animateWithDuration(animated ? 0.3 : 0.0) {
            self.tabBar.frame = CGRectOffset(frame, 0, offsetY)
            self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height + offsetY)
            self.view.setNeedsDisplay()
            self.view.layoutIfNeeded()
        }
    }
    
    func tabBarIsVisible() -> Bool {
        return self.tabBar.frame.origin.y < CGRectGetMaxY(self.view.frame)
    }
}
class FireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
//        self.navigationController?.toolbar.barStyle = UIBarStyle.BlackTranslucent
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(animated: Bool) {
        print("\(self.navigationController?.toolbar.hidden)")
//        self.navigationController?.setToolbarHidden(false, animated: true)
        
        if let tabar = self.tabBarController {
            tabar.setTabBarVisible(true, animated: true)
        }
//        if let tabar2 = self.navigationController?.parentViewController?.tabBarController {
//            tabar2.setTabBarVisible(true, animated: true)
//        }
    }
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: true)

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
