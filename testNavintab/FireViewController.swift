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
class FireViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    var shouldShowToolBar: Bool = true
    var shouldHideTabBar: Bool = true
    @IBOutlet weak var imageuploadBg: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String:AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: {
            () -> Void in
        })
        imageuploadBg.image = image
        
        
        let _image = (editingInfo![UIImagePickerControllerOriginalImage] as! UIImage)
        
        if picker.sourceType == UIImagePickerControllerSourceType.Camera {
            
            //            let image = imageByCroppingImage(_image, _size: CGSize(width: self.view.bounds.width,height: self.view.bounds.height))
            
            //            ImageView.addImage(image)
            imageuploadBg.contentMode = .ScaleAspectFit
            imageuploadBg.image = _image
            
            //            SmileButton.setTitle("Smile =)", forState: UIControlState.Normal)
            
        } else if picker.sourceType == UIImagePickerControllerSourceType.PhotoLibrary {
            
            self.dismissViewControllerAnimated(true, completion: nil)
            //            isUploadPhotoEnabled = false
            
            //            ImageView.addImage(_image)
            imageuploadBg.contentMode = .ScaleAspectFit
            
            imageuploadBg.image = image
            
            
        }
    }
    
    @IBAction func photolibrary(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = true
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    private func imageByCroppingImage(image: UIImage, _size: CGSize) -> UIImage {
        
        //@ref: http://stackoverflow.com/questions/158914/cropping-an-uiimage
        
        
        // step 1: Scale from the original size to a smaller size.
        let newHeight = CGFloat(800.0)
        let scale = newHeight / image.size.height
        let newWidth = image.size.width * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        print("WIDTH: \(image.size.width) HEIGHT: \(image.size.width) NEWWIDTH: \(newWidth) NEWHEIGHT: \(newHeight)")
        
        // step 3: crop obttom
        return croppIngimage(scaledImage, toRect: CGRectMake(0, 0, newWidth, newHeight / 2))
    }
    
    func croppIngimage(imageToCrop: UIImage, toRect rect: CGRect) -> UIImage {
        
        let imageRef: CGImageRef = CGImageCreateWithImageInRect(imageToCrop.CGImage, rect)!
        let cropped: UIImage = UIImage(CGImage: imageRef)
        return cropped
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let uploadimageviewtapGesture = UITapGestureRecognizer(target: self, action: "uploadimageviewtapGesture:")
        imageuploadBg.addGestureRecognizer(uploadimageviewtapGesture)
        imageuploadBg.userInteractionEnabled = true
//        self.navigationController?.toolbar.barStyle = UIBarStyle.BlackTranslucent
        // Do any additional setup after loading the view.
        
    }
//    override func viewWillAppear(animated: Bool) {
//        print("\(self.navigationController?.toolbar.hidden)")
//        if let tabar = self.tabBarController {
//            //            tabar.setTabBarVisible(true, animated: true)
//            tabar.setTabBarVisible(false, animated: true)
//        }
//        self.navigationController?.setToolbarHidden(false, animated: true)
//        
//      
////        if let tabar2 = self.navigationController?.parentViewController?.tabBarController {
////            tabar2.setTabBarVisible(true, animated: true)
////        }
//    }
//    override func viewWillDisappear(animated: Bool) {
//        self.navigationController?.setToolbarHidden(true, animated: true)
//        if let tabar = self.tabBarController {
//            //            tabar.setTabBarVisible(true, animated: true)
//            tabar.setTabBarVisible(true, animated: true)
//        }
//    }
    
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupBar(animated)
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //invisialbe custom bottom,visible main bottom bar
        
        resetBar(animated)
    }
    private func resetBar(animated:Bool){
        if let nav = self.navigationController {
            if shouldShowToolBar {
                nav.setToolbarHidden(true, animated: animated)
            } else {
                nav.setToolbarHidden(false, animated: animated)
                
            }
        }
        if let tabar = self.tabBarController {
            if shouldHideTabBar {
                tabar.setTabBarVisible(true, animated: true)
            } else {
                tabar.setTabBarVisible(false, animated: true)
                
            }
        }
        
    }
    private func setupBar(animated:Bool){
        if let tabar = self.tabBarController {
            if shouldHideTabBar {
                tabar.setTabBarVisible(false, animated: true)
            } else {
                tabar.setTabBarVisible(true, animated: true)
                
            }
        }
        if let nav = self.navigationController {
            if shouldShowToolBar {
                
                nav.setToolbarHidden(false, animated: animated)
            } else {
                nav.setToolbarHidden(true, animated: animated)
                
            }
        }
        
    }
}
