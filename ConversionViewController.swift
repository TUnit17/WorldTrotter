//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Timothy Huang on 3/15/17.
//  Copyright © 2017 Timothy Huang. All rights reserved.
//

import Foundation
import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate
{
    // Outlets
    @IBOutlet var celsiusLabel : UILabel!
    @IBOutlet var textField : UITextField!

    
    
    // Actions
    @IBAction func dismissKeyboard(sender: AnyObject)
    {
        textField.resignFirstResponder()
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField)
    {
        //celsiusLabel.text = textField.text
        
//        if let text = textField.text, !text.isEmpty
//        {
//            celsiusLabel.text = text
//        } // end if
//        
//        else
//        {
//            celsiusLabel.text = "???"
//        }
        if let text = textField.text , let value = Double(text){
            fahrenheitValue = value
        }
        else{
            fahrenheitValue = nil
        }
    } // end func
    
    
    
    var fahrenheitValue : Double?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    
    // OTHER METHODS
    // -----------------------------
    // Convert to celsius
    var celsiusValue : Double?
    {
        if let value = fahrenheitValue
        {
            return (value-32)*(5/9)
        }
        else
        {
            return nil
        }
    }
    
    // Update label
    func updateCelsiusLabel() {
        if let value = celsiusValue{
            //celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.string(for: value)
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    // blocks out the attempt to add a second decimal
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
                print("Current text: \(textField.text)")
                print("Replacement text: \(string)")
        
        //        return true;
        //
        
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil
        {
            return false
        }
        else
        {
            return true
        }

        
    }
    
    // print message
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view.")
        
        
    }




} // end class
