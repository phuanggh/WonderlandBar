//
//  ResultVC.swift
//  WonderlandBar
//
//  Created by Penny Huang on 2020/3/18.
//  Copyright © 2020 Penny Huang. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    let imageBrain = ImageBrain()
    var finalItemIndex: Int!
    var userName: String!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var resultTextView: UITextView!
    
    
    @IBAction func returnButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        resultTextView.text = "親愛的\(userName ?? "顧客")，這是屬於你的特調—— \(imageBrain.imageSet[finalItemIndex].displayName)\n祝你有美好的一天！"
                
        imageView.image = UIImage(named: "\(imageBrain.imageSet[finalItemIndex].fileName)")
//        print(userName ?? "顧客", finalItemIndex ?? 10)
        
    }
    



}
