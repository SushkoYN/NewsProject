//
//  AuthorizationViewController.swift
//  NewsProject
//
//  Created by Yurii Sushko on 18.01.2018.
//  Copyright © 2018 Yurii Sushko. All rights reserved.
//

import UIKit
import CoreData

class AuthorizationViewController: UIViewController, RootView {
    
    // MARK: Constants
    
    private struct Constants {
        static let title = "Message"
        static let message = "wrong username or password"
        static let actionTitle = "OK"
    }
    
    // MARK: RootView
    
    typealias ViewType = AuthorizationView
    
    // MARK: Properties
    
    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    var user: User {
        return fillUserFromTextField()
    }
    
    // MARK: IBAction
    
    @IBAction func performLogin(_ sender: UIButton) {
        showController()
    }
    
    // MARK: Private methods
    
    private func fillUserFromTextField() -> User {
        let user = User()
        user.login = self.rootView?.loginTextField?.text
        user.password = self.rootView?.passwordTextField?.text
        
        return user
    }
    
    private func showController() {
        let user = self.user
        container?.performBackgroundTask { context in
            let result =  SavedUser.check(user: user, in: context)
            DispatchQueue.main.async { [weak self] in
                result ? self?.showNewsViewcontroller() : self?.showAlert()
            }
        }
    }
    
    private func showNewsViewcontroller() {
        self.navigationController?.pushViewController(NewsViewController(), animated: true)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: Constants.title, message: Constants.message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: Constants.actionTitle, style: .default)
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
}
