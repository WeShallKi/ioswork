//
//  ViewController.swift
//  AutolayoutThree
//
//  Created by Xiaoqi Wei on 2018/11/26.
//  Copyright © 2018年 Xiaoqi Wei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        let greenView = UIView()
        greenView.backgroundColor = UIColor.green
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.yellow
        let stackView = UIStackView(arrangedSubviews: [redView,greenView,yellowView])
        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20  ).isActive = true
    }


}

