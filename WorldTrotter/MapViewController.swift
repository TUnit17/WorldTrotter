//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Timothy Huang on 3/21/17.
//  Copyright © 2017 Timothy Huang. All rights reserved.
//

import UIKit

class MapViewController :UIViewController
{

    // viewDidLoad gets called after the view controller's interface file is loaded
    // this method is called just before a view controller's view is added to the window
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
        
    }
    
    // viewWillAppear gets called each time the view controller's view appears onscreen
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillApear MapViewController loaded its view.")
    }


}
