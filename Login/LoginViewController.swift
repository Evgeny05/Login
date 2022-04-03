//
//  ViewController.swift
//  Login
//
//  Created by Евгений Дубиль on 03.04.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userName: UITextField!
    @IBOutlet var userPassword: UITextField!
    
    let user = User.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.delegate = self
        userPassword.delegate = self
        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBar = segue.destination as! UITabBarController
        
        let welcomeVC = tabBar.viewControllers?.first as! MainViewController
        
        welcomeVC.user = user
//        ?.first as! WelcomeViewController
    }
    
    @IBAction func logInPress() {
        let isValidData = userName.text == user.login && userPassword.text == user.password
        
        if isValidData {
            performSegue(withIdentifier: "logIn", sender: nil)
        }
        
        showAlert(title: "Error", message: "Invalid name or password", textField: userPassword)
    }
    
    
    @IBAction func forgotName() {
        showAlert(title: "Help", message: "your name is \(user.login)")
    }
    
    @IBAction func forgotPassword() {
        showAlert(title: "Help", message: "your password is \(user.password)")
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in
            textField?.text = nil
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userName {
            userPassword.becomeFirstResponder()
        } else {
            logInPress()
        }
        return true
    }
}

