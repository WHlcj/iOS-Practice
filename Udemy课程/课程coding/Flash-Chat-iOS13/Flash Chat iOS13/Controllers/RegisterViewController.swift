//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    
    override func viewDidLoad() {
        passwordTextfield.autocorrectionType = .no
        passwordTextfield.autocapitalizationType = .none
        passwordTextfield.spellCheckingType = .no
    }

    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text,  let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print("注册失败!")
                    print(e.localizedDescription)
                } else {
                    // Navigate to Chat
                    print("注册成功!")
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
        
    }
    
}
