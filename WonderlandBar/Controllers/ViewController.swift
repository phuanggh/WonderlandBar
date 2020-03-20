//
//  ViewController.swift
//  WonderlandBar
//
//  Created by Penny Huang on 2020/3/13.
//  Copyright © 2020 Penny Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imageBrain = ImageBrain()
    var finalItemIndex = 0
    var finalScore = 0
    var score1 = 0
    var score2 = 0
    var score3 = 0
    var switchIsOn = true
    var month = "January"
    
    let gradient = CAGradientLayer()
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var stepperOutlet: UIStepper!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    @IBAction func dismissNameKB(_ sender: Any) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func numEditingChanged(_ sender: Any) {
        if let textFieldValue = Double(textField.text!) {
            stepperOutlet.value = textFieldValue
            if Int(textFieldValue) > 10 {
                score3 = 10
            } else {
                score3 = Int(textFieldValue)
            }
        }
        
    }
    
    
    @IBAction func segmented(_ sender: UISegmentedControl) {
        // score1
        let index = sender.selectedSegmentIndex
        switch index {
        case 0: score1 = 9
        case 1: score1 = 12
        case 2: score1 = 6
        case 3: score1 = 3
        default: score1 = 0
        }
    }
    
    
    @IBAction func slider(_ sender: UISlider) {
        // score2
        let sliderValue = Int(sender.value)
        sliderLabel.text = "\(sliderValue) 分"
        score2 = sliderValue
    }
    
    
    @IBAction func stepper(_ sender: UIStepper) {
        // score3
        
        let stepperValue = Int(sender.value)
        textField.text = String(stepperValue)
        if stepperValue > 10 {
            score3 = 10
        } else {
            score3 = stepperValue
        }
        
    }
    
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        if sender.isOn {
            switchIsOn = true
        } else {
            switchIsOn = false
        }
    }
    
    
    @IBAction func submitPressed(_ sender: Any) {
        finalItemIndex = imageBrain.calculator(switchStatus: switchIsOn, score1: score1, score2: score2, score3: score3)
        performSegue(withIdentifier: "goToResultVC", sender: 1)
        
    }
    
    
    @IBAction func randomButtonPressed(_ sender: Any) {
        finalItemIndex = Int.random(in: 0...9)
        performSegue(withIdentifier: "goToResultVC", sender: 2)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultVC" {
            
            let userName = nameTextField.text == "" ? "顧客" : nameTextField.text!
            let destinationVC = segue.destination as! ResultVC
            destinationVC.userName = userName
            destinationVC.finalItemIndex = finalItemIndex
            destinationVC.month = month
//            let a = sender as! Int
//            if a == 1 {
//
//            }
//
//            print(sender)
//            //處理這行 button.tag沒有動作
//            if let button = sender as? UIButton {
//                print(button)
//                if button.tag == 1 {
////                    print(button.tag)
//                    destinationVC.finalItemIndex = finalItemIndex
//                    destinationVC.userName = userName
//                    print(finalItemIndex, userName)
//                } else {
////                    print(button.tag)
//                    destinationVC.finalItemIndex = 0
//                    destinationVC.userName = "userName"
//
//                }
////                print(finalItemIndex, userName)
//            }
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradient.frame = imageView.bounds
        gradient.colors = [CGColor(srgbRed: 0.13, green: 0.09, blue: 0.09, alpha: 1.0), UIColor.clear.cgColor,  UIColor.clear.cgColor, CGColor(srgbRed: 0.13, green: 0.09, blue: 0.09, alpha: 1.0)]
        gradient.locations = [0, 0.35, 0.9, 1]
        imageView.layer.addSublayer(gradient)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
}



extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageBrain.monthList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let displayMonth = imageBrain.monthList[row]
        
        return displayMonth
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        month = imageBrain.monthList[row]
    }
    
    
}
