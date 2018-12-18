//
//  ViewController.swift
//  SqliteDemo
//
//  Created by Xiaoqi Wei on 2018/12/13.
//  Copyright © 2018年 WeiXiaoqi. All rights reserved.
//

import UIKit
import SQLite3
class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    let db = SQLiteDB.shared;
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = db.open(dbPath: "", copyFile: true)
        print("\(result)")
        let r = db.execute(sql: "create table if not exists person(name varchar(20),phone varchar(20))")
        print("\(r)")
        print(NSHomeDirectory())
        print(Bundle.main.bundlePath)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func add(_ sender: Any) {
       let r =  db.execute(sql: "insert into person(name,phone) values('\(tfPhone.text!)','\(tfName.text!)')")
        print(r)
    }
    @IBAction func update(_ sender: Any) {
        let r =  db.execute(sql: "update person set phone = '\(tfPhone.text!)' where name = '\(tfName.text!)'")
        print(r)
    }
    
    @IBAction func del(_ sender: Any) {
        let r =  db.execute(sql: "delete from person where name='\(tfName.text!)'")
        print(r)
    }
    
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name='\(tfName.text!)'")
        if let person = persons.first,let phone = person["phone"] as? String{
            tfPhone.text = phone
        }
    }
}

