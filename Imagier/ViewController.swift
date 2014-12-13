//
//  ViewController.swift
//  Imagier
//
//  Created by m2sar on 27/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let ecran = UIScreen.mainScreen()
        let rect = ecran.bounds
        let v = PhotoView(frame: rect)
        v.backgroundColor = UIColor.whiteColor()
        self.view = v
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

