//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            let fileName = K.credentialsFileName
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent(fileName)
                
                let fileContents = "\(email)\n\(password)"
                
                do {
                    try fileContents.write(to: fileURL, atomically: true, encoding: .utf8)
                    print("Successful：\(fileURL.path)")
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                } catch {
                    print(error)
                }
            } else {
                print("No Directory!")
            }
            
    
        
        }
    }
    
}
