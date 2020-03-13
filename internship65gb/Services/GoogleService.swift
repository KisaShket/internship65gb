//
//  GoogleService.swift
//  internship65gb
//
//  Created by Miska  on 04.03.2020.
//  Copyright © 2020 Miska . All rights reserved.
//

import GoogleSignIn

class GoogleService: NSObject {
    
    let shared = GIDSignIn.sharedInstance()
   public static var token: String?
    
    func getAccessToken() -> String? {
        var token: String?
        shared?.currentUser.authentication.getTokensWithHandler({ (auth, error) in
            guard error == nil else { return }
            token = auth?.accessToken
        })
        GoogleService.token = token
       return token
    }

    func signIn(){
        shared?.signIn()
    }
    
    func signOut(){
        shared?.signOut()
    }
    
    func setDelegate() {
        shared?.delegate = self
    }
    
    func setScopes() {
        shared?.scopes = [Constants.kScope]
    }
    
    func setClientID(withID id: String) {
        shared?.clientID = id
    }
    
    func setPresentingViewController(_ vc: UIViewController) {
        shared?.presentingViewController = vc
    }
    
    func handle(url: URL) -> Bool {
        return (shared?.handle(url))!
    }
    
    
}

extension GoogleService: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard error == nil else { return }
    
        let appDeleagate = UIApplication.shared.delegate as! AppDelegate
        let stroryboard = UIStoryboard.init(name: Constants.kStoryboardName,
            bundle: nil)
        let initialViewController = stroryboard
            .instantiateViewController(withIdentifier: Constants.kRootId)
        appDeleagate.window?.rootViewController = initialViewController
        appDeleagate.window?.makeKeyAndVisible()
        UIView.transition(with: appDeleagate.window!,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
