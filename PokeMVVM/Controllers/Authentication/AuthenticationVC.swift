//
//  AuthenticationVC.swift
//  PokeMVVM
//
//  Created by Shayan on 11/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

final class AuthenticationVC: UIViewController {
    private let authenticationView = AuthenticationView()
    
    override func loadView() {
        super.loadView()
        view = authenticationView
        authenticationView.authenticationVC = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func actionTapped() {
        navigationController?.pushViewController(MainVC(), animated: true)
    }
}
