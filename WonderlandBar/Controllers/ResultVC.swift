//
//  ResultVC.swift
//  WonderlandBar
//
//  Created by Penny Huang on 2020/3/18.
//  Copyright © 2020 Penny Huang. All rights reserved.
//

import UIKit
import SpriteKit

class ResultVC: UIViewController {

    let imageBrain = ImageBrain()
    var finalItemIndex: Int!
    var userName: String!
    var month: String!
    
    let gradient = CAGradientLayer()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var resultTextView: UITextView!
    
    
    @IBAction func returnButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Display text and image
        resultTextView.text = "親愛的\(userName ?? "顧客")，這是屬於你的特調—— \(imageBrain.imageList[finalItemIndex].displayName)\n祝你有美好的一天！"
                
        imageView.image = UIImage(named: "\(imageBrain.imageList[finalItemIndex].fileName)")
//        print(userName ?? "顧客", finalItemIndex ?? 10)
        print(month ?? "no data")
        
        // Gradient setting
        gradient.frame = imageView.bounds
        gradient.colors = [CGColor(srgbRed: 0.13, green: 0.09, blue: 0.09, alpha: 1.0), UIColor.clear.cgColor,  UIColor.clear.cgColor, CGColor(srgbRed: 0.13, green: 0.09, blue: 0.09, alpha: 1.0)]
        gradient.locations = [0, 0.35, 0.9, 1]
        imageView.layer.addSublayer(gradient)
        
        // Snow view setting
        
        if month == "December" {
            let skView = SKView(frame: view.frame)
            view.addSubview(skView)
            skView.allowsTransparency = true
            let scene = SKScene(size: skView.frame.size)
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.9)
            scene.backgroundColor = .clear
            let emitterNode = SKEmitterNode(fileNamed: "SeasonalParticle")
            scene.addChild(emitterNode!)
            skView.presentScene(scene)
        }
        
        
        
        
    }
    



}
