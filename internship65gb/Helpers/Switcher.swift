//
//  Switcher.swift
//  internship65gb
//
//  Created by Miska  on 08.03.2020.
//  Copyright © 2020 Miska . All rights reserved.
//

import Foundation
import UIKit
class Switcher {
    
    static func updateRootVC(){
        let service = GoogleService()
        var rootVC : UIViewController?
        
        guard let signIn = service.shared else { return }
        
        
        let check = signIn.hasPreviousSignIn()
              if check {
                  signIn.restorePreviousSignIn()
                rootVC = UIStoryboard(name: Constants.kStoryboardName, bundle: nil).instantiateViewController(withIdentifier: Constants.kRootId)
              }
              else {
                rootVC = UIStoryboard(name: Constants.kStoryboardName, bundle: nil).instantiateViewController(withIdentifier: Constants.kLoginId)
              }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        
    }
}
