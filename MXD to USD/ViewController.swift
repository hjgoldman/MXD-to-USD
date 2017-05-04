//
//  ViewController.swift
//  MXD to USD
//
//  Created by Hayden Goldman on 5/4/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var USD = Float()
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var mxdTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.getData()
    }

    func getData() {
        let url = URL(string: "http://api.fixer.io/latest?base=MXN")!
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
            let rates = json["rates"] as! [String:Float]
            self.USD = rates["USD"]!
            print(self.USD)
            }
            .resume()
    }

    @IBAction func convertButtonPressed(_ sender: Any) {
        
        if self.mxdTextField.text == "" {
            
        } else {
            
            let mxd = self.mxdTextField.text
            
            let usd = Float(mxd!)! * self.USD
            
            let formattedUsd = String(format: "%.2f", usd)
            
            self.usdLabel.text = "$\(formattedUsd)"

            
            print(formattedUsd)
            

            
        }
        
    }


}

