//
//  ViewController.swift
//  TalosiOSApp
//
//  Created by Sebastian Giraldo  on 10/19/20.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self

          // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }


}

