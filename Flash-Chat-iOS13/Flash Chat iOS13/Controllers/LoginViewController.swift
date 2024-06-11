//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            let fileName = "credentials.txt"
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent(fileName)
                
                do {
                    let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
                    
                    let credentials = fileContents.components(separatedBy: "\n")
                    if credentials.count == 2 {
                        let storedUsername = credentials[0]
                        let storedPassword = credentials[1]
                        
                        // 进行对比
                        if storedUsername == email && storedPassword == password {
                            self.performSegue(withIdentifier: "LoginToChat", sender: self)
                        } else {
                            print("Username or Passord Error")
                        }
                    } else {
                        print("File error")
                    }
                } catch {
                    print(error)
                }
            } else {
                print("No Directory")
            }
            
        }
        
    }
    
}
