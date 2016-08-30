//
//  ViewController.swift
//  UnitConverter
//
//  Created by Aditya on 07/06/16.
//  Copyright (c) 2016 Aditya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelUnit: UILabel!
    @IBOutlet weak var labelUnit2: UILabel!
    @IBOutlet weak var segmentedControlForUnitSelection: UISegmentedControl!
    @IBOutlet weak var buttonConvert: UIButton!

    //This code snippet is used to set the keyboard type to decimal pad
    @IBOutlet weak var textFieldUnitBox: UITextField!{
        didSet{
            textFieldUnitBox.keyboardType = UIKeyboardType.DecimalPad
        }
    }
    
    @IBOutlet weak var textFieldUnitBox1: UITextField!{
        didSet{
            textFieldUnitBox1.keyboardType = UIKeyboardType.DecimalPad
        }
    }
    
    //This function is used to set the labels text on the basis of segment selected
    @IBAction func segmentedControlValueChanged(sender: AnyObject) {
        if(sender.selectedSegmentIndex == 0){
            labelUnit.text = "ºF"
            labelUnit2.text = "ºC"
        }
        
        else if(sender.selectedSegmentIndex == 1){
            labelUnit.text = "Miles"
            labelUnit2.text = "Kilometers"
        }
        
        else{
            labelUnit.text = "Gallons"
            labelUnit2.text = "Liters"
        }
    }
    
    //This function is used to set the button text  as "⇧" or "⇩" based on the textbox being edited
    @IBAction func textFieldUnitBox1TouchDown(sender: AnyObject) {
        buttonConvert.setTitle("⇧", forState: UIControlState.Normal)
    }
    
    @IBAction func textFieldUnitBoxTouchDown(sender: AnyObject) {
        buttonConvert.setTitle("⇩", forState: UIControlState.Normal)
    }
    
    //This function is the business logic for the conversions
    @IBAction func textFieldUnitBoxEditingChanged(sender: AnyObject) {
       
        if(textFieldUnitBox?.text?.isEmpty == false)
        {
            if(segmentedControlForUnitSelection.selectedSegmentIndex == 0){
                
                textFieldUnitBox1.text = String((Double(textFieldUnitBox.text!)!-32) * 5/9)
            }
                
            else if(segmentedControlForUnitSelection.selectedSegmentIndex == 1){
                
                textFieldUnitBox1.text = String((Double(textFieldUnitBox.text!)! * 1.60934))
            }
                
            else {
                textFieldUnitBox1.text = String((Double(textFieldUnitBox.text!)! * 3.785411784))
            }
        }
            
        else
        {
            textFieldUnitBox1.text = ""
        }
    }
    
    @IBAction func textFieldUnitBox1EditingChanged(sender: AnyObject) {
        if(textFieldUnitBox1?.text?.isEmpty == false)
        {
            if(segmentedControlForUnitSelection.selectedSegmentIndex == 0){
                textFieldUnitBox.text = String((Double(textFieldUnitBox1.text!)!+32) * 9/5)
            }
                
            else if(segmentedControlForUnitSelection.selectedSegmentIndex == 1){
                
                textFieldUnitBox.text = String((Double(textFieldUnitBox1.text!)! / 1.60934))
            }
                
            else {
                textFieldUnitBox.text = String((Double(textFieldUnitBox1.text!)! / 3.785411784))
            }
        }
            
        else
        {
            textFieldUnitBox.text = ""
        }
    }
    
    //This function is used to dismiss the keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

