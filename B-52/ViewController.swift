//
//  ViewController.swift
//  B-52
//
//  Created by 35 кабинет-4 on 01.11.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var inputLogin: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    let userDef = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Your token is: \(userDef.value(forKey: "token"))")
    }

    @IBAction func auth (_sender: Any) {
        guard !inputLogin.text!.isEmpty else {return 🤯 (message: "Че то я такой логин не знаю")}
        guard !inputPassword.text!.isEmpty else {
            return 🤯 (message: "Ты где пароль то такой взял?")}
            
            let url = "httpsfghjkl/login=\(inputLogin.text!)&pass=\(inputPassword.text!)"
            
            AF.request(url,  method: .post).validate().responseJSON{ (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let jsonToken = json["notice"]["token"].stringValue
                    self.userDef.setValue(jsonToken, forKey: "token")
                    
                case .failure(let error):
                    self.🤯(message: error.localizedDescription)
                }
                
            }
        performSegue(withIdentifier: "auth", sender: nil)
    }
    func 🤯(message: String) {
        let alert = UIAlertController(title: "Ашибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Оки-Доки", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

