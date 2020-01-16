//
//  ViewController.swift
//  API_callByCocoapod
//
//  Created by SAYDUR on 1/16/20.
//  Copyright © 2020 SAYDUR. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController {

    @IBOutlet weak var text_view: UITextView!
    @IBAction func callButton(_ sender: Any) {
        
        //Function Call for respose API & print them in log
        
        Alamofire.request("https://api.darksky.net/forecast/688555c90fac582a0fbc3be8e444802b/37.8267,-122.4233").responseJSON{ response in
            print(response.request as Any)
            print(response.response as Any)
            print(response.result.value as Any)
            
            // Code for showing data in text view
            self.text_view.text = response.description
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

