//
//  ViewController.swift
//  API_callByCocoapod
//
//  Created by SAYDUR on 1/16/20.
//  Copyright © 2020 SAYDUR. All rights reserved.
//

import UIKit
import Alamofire

struct Course :Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
}


class ViewController: UIViewController {

    @IBOutlet weak var text_view: UITextView!
    
        let decoder = JSONDecoder()
    var courseString: String = ""
    
//    @IBAction func callButton(_ sender: Any) {
//
//        //Function Call for respose API & print them in log
//
//        let url = "https://restcountries.eu/rest/v2/all"
//        let urlObj = URL(string: url)
//
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBAction func callButton(_ sender: Any) {
        
        
        Alamofire.request("https://api.letsbuildthatapp.com/jsondecodable/courses" ).validate().responseJSON { response in
            print(response.debugDescription)
            
            do{
                
                let courses = try self.decoder.decode([Course].self, from: response.data! )
                
                for item in courses {
                    print(item.name!)
                    
                    
                    //self.text_view.text = item.name
                    self.courseString += item.name! + "\n"
                    
                }
                
                self.text_view.text = self.courseString
                
            } catch{
                
                print("Error")
            }
        }
    }

}

