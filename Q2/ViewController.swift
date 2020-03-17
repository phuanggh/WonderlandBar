//
//  ViewController.swift
//  Q2
//
//  Created by Penny Huang on 2020/3/13.
//  Copyright © 2020 Penny Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var finalScore = 0
    var score1 = 0
    var score2 = 0
    var score3 = 0
    var switchIsOn = false
    let imageArray = [["image0.jpg", "沿海地帶"],
                      ["image2.jpg", "熱帶雨林"],
                      ["image3.jpg", "如果的事"],
                      ["image4.jpg", "不想睡"],
                      ["image5.jpg", "愛情的模樣"],
                      ["image6.jpg", "一千零一夜"],
                      ["image7.jpg", "愛笑的眼睛"],
                      ["image8.jpg", "幸福額度"],
                      ["image9.jpg", "花都開好了"]]
    
    let gradient = CAGradientLayer()
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
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
    
    func calculator(switchStatus: Bool, score1: Int, score2: Int, score3: Int) -> Int{
        
        let totalScore = score1 + score2 + score3
        var finalItemIndex = 0
        
        if switchStatus {

            if totalScore < 5 {
                finalItemIndex = 3
            } else if totalScore < 8 {
                finalItemIndex = 4
            } else if totalScore < 11 {
                finalItemIndex = 5
            } else if totalScore < 16 {
                finalItemIndex = 6
            } else if totalScore < 22 {
                finalItemIndex = 7
            } else if totalScore < 27 {
                finalItemIndex = 8
            } else {
                finalItemIndex = 9
            }

        } else {

            if totalScore < 5 {
                finalItemIndex = 0
            } else if totalScore < 9 {
                finalItemIndex = 1
            } else if totalScore < 12 {
                finalItemIndex = 2
            } else if totalScore < 18 {
                finalItemIndex = 3
            } else if totalScore < 20 {
                finalItemIndex = 4
            } else if totalScore < 26 {
                finalItemIndex = 5
            } else {
                finalItemIndex = 6
            }
        }
        return finalItemIndex
    }
    
    
    @IBAction func submitPressed(_ sender: Any) {
        
        let userName: String?
        if nameTextField.text == "" {
            userName = "顧客"
        } else {
            userName = nameTextField.text ?? "顧客"
        }
        
        let finalItemIndex = calculator(switchStatus: switchIsOn, score1: score1, score2: score2, score3: score3)
        
        let viewText = "親愛的\(userName ?? "顧客")，這是屬於你的特調—— \(imageArray[finalItemIndex][1])\n祝你有美好的一天！"
        textView.text = viewText
        imageView.image = UIImage(named: "\(imageArray[finalItemIndex][0])")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradient.frame = imageView.bounds
        gradient.colors = [CGColor(srgbRed: 0.13, green: 0.09, blue: 0.09, alpha: 1.0), UIColor.clear.cgColor,  UIColor.clear.cgColor, CGColor(srgbRed: 0.13, green: 0.09, blue: 0.09, alpha: 1.0)]
        gradient.locations = [0, 0.35, 0.9, 1]
        imageView.layer.addSublayer(gradient)
    }


}

