//
//  LoginFormController.swift
//  VK-Client
//
//  Created by Антон Белый on 20.11.2021.
//

import UIKit

class LoginFormController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.systemBlue.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

