//
//  MainViewController.swift
//  Login
//
//  Created by Евгений Дубиль on 03.04.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    
    var user: User!
    
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = user.person.fullName
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
    
}
