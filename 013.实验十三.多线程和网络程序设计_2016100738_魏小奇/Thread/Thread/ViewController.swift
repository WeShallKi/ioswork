//
//  ViewController.swift
//  Thread
//
//  Created by Xiaoqi Wei on 2018/12/17.
//  Copyright © 2018年 WeiXiaoqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func sum(_ sender: Any) {
        var sum = 0
        DispatchQueue.global().async {
            for i in 1...9999999{
                sum += i;
                DispatchQueue.main.async {
                    self.sumLabel.text = "\(sum)"
                }
            }
            
        }
        
    }
    
}

