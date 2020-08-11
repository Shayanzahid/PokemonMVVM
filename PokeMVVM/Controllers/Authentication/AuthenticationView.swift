//
//  AuthenticationView.swift
//  PokeMVVM
//
//  Created by Shayan on 11/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

final class AuthenticationView: UIView {
    var authenticationVC: AuthenticationVC? {
        didSet {
            actionButton.addTarget(authenticationVC, action: #selector(AuthenticationVC.actionTapped), for: .touchUpInside)
        }
    }
    
    let usernameTextfield = UITextField()
    let passwordTextfield = UITextField()
    let actionButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUsernameTextfield() {
        addSubview(usernameTextfield)
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
        usernameTextfield.placeholder = "Enter username..."
        usernameTextfield.borderStyle = .roundedRect
        
        NSLayoutConstraint.activate([
            usernameTextfield.centerXAnchor.constraint(equalTo: centerXAnchor),
            usernameTextfield.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameTextfield.heightAnchor.constraint(equalToConstant: 40),
            usernameTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            usernameTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    
    private func setupPasswordTextfield() {
        addSubview(passwordTextfield)
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        passwordTextfield.placeholder = "Enter password..."
        passwordTextfield.borderStyle = .roundedRect
        
        NSLayoutConstraint.activate([
            passwordTextfield.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor, constant: 8),
            passwordTextfield.leadingAnchor.constraint(equalTo: usernameTextfield.leadingAnchor),
            passwordTextfield.trailingAnchor.constraint(equalTo: usernameTextfield.trailingAnchor),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupActionButton() {
        addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.setTitle("Continue", for: .normal)
        actionButton.backgroundColor = .systemBlue
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setup() {
        setupUsernameTextfield()
        setupPasswordTextfield()
        setupActionButton()
    }
}
