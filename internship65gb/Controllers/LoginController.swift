//
//  ViewController.swift
//  internship65gb
//
//  Created by Miska  on 26.02.2020.
//  Copyright © 2020 Miska . All rights reserved.
//

import GoogleSignIn
class LoginController: UIViewController {
    let service = GoogleService()
    @IBOutlet weak var loginButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        service.setPresentingViewController(self)
        service.setDelegate()
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        service.setScopes()
        service.signIn()
    }
}

