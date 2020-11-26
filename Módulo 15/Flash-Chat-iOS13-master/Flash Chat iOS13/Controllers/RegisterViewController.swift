//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        //recebe o email e senha dos campos da tela do app
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                //localizacao do erro na linguagem/idioma do iPhone
                print(e.localizedDescription)
            } else {
                //Após registrar com sucesso, navega ate o ChatViewController
                self.performSegue(withIdentifier: K.registerSegue, sender: self)
            }
        }
    }
    
}
}
