//
//  LoginViewController.swift
//  NewsProject
//
//  Created by Yurii Sushko on 18.01.2018.
//  Copyright © 2018 Yurii Sushko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, RootView {
    
    // MARK: Constants
    
    private struct Constants {
        static let title = "News"
    }

    // MARK: RootView
    
    typealias ViewType = LoginView
    
    // MARK: IBAction
    
    @IBAction func onAuthorization(_ sender: UIButton) {
        self.navigationController?.pushViewController(AuthorizationViewController(), animated: true)
    }
    
    @IBAction func onSignUp(_ sender: UIButton) {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    // MARK: ViewLifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = Constants.title
    }

}
