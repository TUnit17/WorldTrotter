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
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        
        
        // AutoresizingMasks = translating constraints with an older system for scaling interfaces called autoresizing masks
        // Before auto layout was introduced, iOS applications used autoresizing maks to allow views to scaled for different-sized screens at runtime
        // Each view has an autoresizing mask
        // By default, iOS creates constraints that match the autoresizing mask and adds them to the view.
        // These translated constraints will often conflict with explicit constraints in the layout and cause an insatisfiable constraints problem.
        // The fix is to turn off this default translation by setting the property translateAutoresizingMaskIntoContraints to false.
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
    
        /**
         What is an anchor?
         Fact:  When you work with Auto Layout programmatically, you will use anchors to create your constraints
         Anchors are properties on the view that correspond to attributes that you might want to constrain to an anchor on another view.
         For example, you might want to constrain the leading anchor of one view to the leading anchor of another view.
         This would have the effect of two view's leading edges being aligned
         
         I think an anchor is giving a variable name to a constraint
        **/
        
        
        /**
         The top anchor of the segmented control should be equal to the top anchor of its superview
         //let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
         Problem : This does not look good becuase the segmented control is underlapping the status bar
         Solution: make the segmented control to be 8 points below the top layout guide
         Fact    : By using layout guides instead of hardcoded constant, the views will adapt based on the context they appear in.
         
         What is a layout guide?
         Indicate the extent to which the view controller's view contents will be visible. 
         
         What is the topLayoutGuide?
         Allows your content to not underlap the status bar or navigation bar at the top of the screen
         
         What is the bottomLayouGuide?
         Allows your content to not underlap thhe tab bar at the bottom of the screen 
         
         Fact : There are 3 types of layout guid anchors ( topAnchor, bottomAnchor, heightAnchor) 
         
         What does bottomAnchor mean? 
         because you want the segmented control to be under the status bar, you will constrain the bottom anchor of the top layout guide
         
         
        **/
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        
        
        // The leading anchor of the segmented control should be equal to the leading anchor of its superview
        // What does .equalTo mean?
        // Create a constraint between the two anchors
        
        
        // Problem with this code: the bar on top touches the side margins
        // let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
         // The trailing anchor of the segmented control should be equal to the trailing anchor of its superview
        // let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        // Solution: use margins
        
        
        // What is a margin? 
        
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    
    
    
    } // end loadView()
    
    // This method will check which segment was selected and update the map accordingly
    func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex{
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }

    
    
    
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
