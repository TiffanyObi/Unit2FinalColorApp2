//
//  DetailViewController.swift
//  Unit2FinalColorApp2
//
//  Created by Tiffany Obi on 11/23/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class NewDetailViewController: UIViewController {
    
    
    @IBOutlet weak var displayColorChange2: UIView!
    @IBOutlet weak var crayonNameLabel2: UILabel!
    @IBOutlet weak var commentLabel2: UILabel!
    @IBOutlet weak var  redLabel2: UILabel!
    @IBOutlet weak var blueLabel2: UILabel!
    @IBOutlet weak var greenLabel2: UILabel!
    @IBOutlet weak var redSlider2: UISlider!
    @IBOutlet weak var blueSlider2: UISlider!
    @IBOutlet weak var greenSlider2: UISlider!
    @IBOutlet weak var displayStepperValue2: UILabel!
    
    @IBOutlet weak var alphaValueStepper2: UIStepper!
    
    var colors = [Crayon]()
    
    var defaultColor = UIColor.clear
    
    var alphaValue:CGFloat = 1.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configureStepper()
        updateUI()
        
    }
    
    func configureSlider(){
        
        redSlider2.maximumValue = 1
        redSlider2.minimumValue = 0
        
        redSlider2.value = 0.5
        
        blueSlider2.maximumValue = 1
        blueSlider2.minimumValue = 0
        blueSlider2.value = 0.5
        
        greenSlider2.maximumValue = 1
        greenSlider2.minimumValue = 0
        greenSlider2.value = 0.5
    }
    
    func configureStepper(){
        alphaValueStepper2.maximumValue = 1.0
        
        alphaValueStepper2.minimumValue = 0.0
        
        alphaValueStepper2.stepValue = 0.1
        
        alphaValueStepper2.value = 1.0
    }
    
    func updateUI() {
        let selectedColor = colors
        
        for background  in selectedColor {
            
            displayColorChange2.backgroundColor = UIColor(displayP3Red: CGFloat(background.red), green: CGFloat(background.green), blue: CGFloat(background.blue), alpha: 1)
            crayonNameLabel2.text = background.name
            redLabel2.text = "Red Value: loading... "
            blueLabel2.text = "Blue Value: loading... "
            greenLabel2.text = "Green Value: loading... "
            commentLabel2.text = " Wonder which you choose first! "
        }
        defaultColor = displayColorChange2.backgroundColor!
    }
    
    @IBAction func alphaStepperValueChanged(_ sender: UIStepper) {
        
        let colorss = colors
        
        alphaValue = CGFloat(alphaValueStepper2.value)
        for color in colorss { displayColorChange2.backgroundColor = UIColor(displayP3Red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.green), alpha: alphaValue)
            displayStepperValue2.text = "Alpha Value: \(alphaValue)"
        }
    }
    
    @IBAction func redValueChanged(_ sender: UISlider) {
        var redColor = 0.0
        
        for color in colors {
            
            color.red = Double(sender.value)
            redColor = color.red
            
            
            
            displayColorChange2.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: alphaValue)
            
            
        }
        
        redLabel2.text = "Red Value: \(sender.value)"
        commentLabel2.text = "Red Madness!"
    }
    
    @IBAction func blueValueChanged(_ sender: UISlider) {
        var blueColor = 0.0
        
        for color in colors {
            
            color.blue = Double(sender.value)
            blueColor = color.blue
            
            
            
            displayColorChange2.backgroundColor = UIColor(displayP3Red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(blueColor), alpha: alphaValue)
        }
        blueLabel2.text = "Blue Value: \(sender.value)"
        commentLabel2.text = "Blue is Rocking!"
    }
    
    @IBAction func greenValueChanged(_ sender: UISlider) {
        var greenColor = 0.0
        
        for color in colors {
            
            color.green = Double(sender.value)
            greenColor = color.green
            
            
            
            displayColorChange2.backgroundColor = UIColor(displayP3Red: CGFloat(color.red), green: CGFloat(greenColor), blue: CGFloat(color.blue), alpha: alphaValue)
        }
        greenLabel2.text = "Green Value: \(sender.value)"
        commentLabel2.text = "Money Green!"
    }
    
    @IBAction func resetSettings(_ sender: UIButton) {
        
        configureStepper()
        configureSlider()
        displayColorChange2.backgroundColor = defaultColor
        
        redLabel2.text = "Red Value: loading... "
        blueLabel2.text = "Blue Value: loading... "
        greenLabel2.text = "Green Value: loading... "
        displayStepperValue2.text = "Alpha Value: loading..."
        
    }
    
    
}
