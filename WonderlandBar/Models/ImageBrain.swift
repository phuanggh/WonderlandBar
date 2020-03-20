//
//  ImageBrain.swift
//  WonderlandBar
//
//  Created by Penny Huang on 2020/3/19.
//  Copyright © 2020 Penny Huang. All rights reserved.
//

import Foundation

struct ImageBrain {
    
    let imageList = [
       Image(fileName: "image0.jpg", displayName: "沿海地帶"),
       Image(fileName: "image1.jpg", displayName: "無眠"),
       Image(fileName: "image2.jpg", displayName: "熱帶雨林"),
       Image(fileName: "image3.jpg", displayName: "如果的事"),
       Image(fileName: "image4.jpg", displayName: "不想睡"),
       Image(fileName: "image5.jpg", displayName: "愛情的模樣"),
       Image(fileName: "image6.jpg", displayName: "一千零一夜"),
       Image(fileName: "image7.jpg", displayName: "愛笑的眼睛"),
       Image(fileName: "image8.jpg", displayName: "幸福額度"),
       Image(fileName: "image9.jpg", displayName: "花都開好了"),
    ]
    
    let monthList = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    func calculator(switchStatus: Bool, score1: Int, score2: Int, score3: Int) -> Int{
        
        let totalScore = score1 + score2 + score3
        var finalItemIndex = 0
        
        if switchStatus {

            if totalScore < 5 {
                finalItemIndex = 5
            } else if totalScore < 8 {
                finalItemIndex = 4
            } else if totalScore < 11 {
                finalItemIndex = 3
            } else if totalScore < 16 {
                finalItemIndex = 6
            } else if totalScore < 22 {
                finalItemIndex = 9
            } else if totalScore < 27 {
                finalItemIndex = 7
            } else {
                finalItemIndex = 8
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
    
}
