//
//  SignUpViewController.swift
//  NewsProject
//
//  Created by Yurii Sushko on 19.01.2018.
//  Copyright © 2018 Yurii Sushko. All rights reserved.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController, RootView {
    
    // MARK: Constants
    
    private struct Constants {
        static let title = "Message"
        static let message = "Please enter the password again"
        static let actionTitle = "OK"
    }
    
    // MARK: RootView
    
    typealias ViewType = SignUpView
    
    // MARK: Properties
    
    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    var user: User {
        return fillUserFromTextField()
    }

        
    // MARK: IBAction
    
    @IBAction func signUp(_ sender: UIButton) {
        let signUpView = self.rootView
        if signUpView?.passwordTextField?.text == signUpView?.confirmPasswordTextField?.text {
             updateCoreData(with: self.user)
        } else {
            self.showAlert()
        }
       
    }
    
    // MARK: Private methods
    
    private func updateCoreData(with user: User) {
        container?.performBackgroundTask({ (context) in
            _ = SavedUser.createOrFind(user: user, in: context)
        })
    }
    
    private func fillUserFromTextField() -> User {
        let user = User()
        user.name = self.rootView?.nameTextField?.text
        user.surname = self.rootView?.surnameTextField?.text
        user.email = self.rootView?.emailTextField?.text
        user.login = self.rootView?.loginTextField?.text
        user.password = self.rootView?.passwordTextField?.text
        
        return user
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: Constants.title, message: Constants.message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: Constants.actionTitle, style: .default)
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }

}
