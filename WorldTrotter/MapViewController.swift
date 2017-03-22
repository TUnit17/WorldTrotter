//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Timothy Huang on 3/21/17.
//  Copyright © 2017 Timothy Huang. All rights reserved.
//

import UIKit
import MapKit

class MapViewController :UIViewController
{

    // Variable
    var mapView : MKMapView!
    
    
    // If a view controller is asked for its view and its view is nil, then the loadView() method is called
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as the view of this view controller
        view = mapView
        
        
        
        // Programmatic constraints
        // A segmented control allows the user to choose between a discrete set of options
        // and you will use of to allow the user to switch between map types: standard, hybrid, and satellite
        
        
        let segmentedControl = UISegmentedControl(items:["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        
        // AutoresizingMasks = translating constraints with an older system for scaling interfaces called autoresizing masks
        // Before auto layout was introduced, iOS applications used autoresizing maks to allow views to scaled for different-sized screens at runtime
        // Each view has an autoresizing mask
        // By default, iOS creates constraints that match the autoresizing mask and adds them to the view.
        // These translated constraints will often conflict with explicit constraints in the layout and cause an insatisfiable constraints problem.
        // The fix is to turn off this default translation by setting the property translateAutoresizingMaskIntoContraints to false.
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
    
        
        // When you work with Auto Layout programmatically, you will use anchors to create your constraints
        // Anchors are properties on the view that correspond to attributes that you might want to constrain to an anchor on another view.
        /**
        For example, you might want to constrain the leading anchor of one view to the leading anchor of another view. 
        This would have the effect of two view's leading edges being alignned
        **/
        
        
        // The top anchor of the segmented control should be equal to the top anchor of its superview
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        
        
        // The leading anchor of the segmented control should be equal to the leading anchor of its superview
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
        
        // The trailing anchor of the segmented control should be equal toe the trailing anchor of its superview	
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    
    
    
    } // end loadView()
    
    
    
    
    
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


    // programmatice view test 
    
    
} //end class
