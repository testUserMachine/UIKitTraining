//
//  LoginViewController.swift
//  Banky
//
//  Created by Adam Roden on 11/07/2023.
//

import UIKit

class LoginViewController: UIViewController
{
    let titleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var userNameText: String?
    { return loginView.userNameTextField.text }
    
    var passwordText: String?
    { return loginView.passwordTextField.text }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController
{
    func style()
    {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Banky"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    func layout()
    {
        view.addSubview(titleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //Title Label
        NSLayoutConstraint.activate(
            [titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             loginView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor,
                                             multiplier: 3)])
        
        //Login View
        NSLayoutConstraint.activate(
            [loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor,
                                                multiplier: 1),
             view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor,
                                            multiplier: 1)
            ])
        
        //Sign In Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor,
                                              multiplier: 3 ),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //Error Message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor,
                                                   multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)])
    }
}

extension LoginViewController
{
    @objc func signInTapped(sender: UIButton)
    {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login()
    {
        guard let userNameText = userNameText, let passwordText = passwordText
        else
        {
            assertionFailure("Username / password should never be nil")
            return
        }
        if userNameText.isEmpty || passwordText.isEmpty
        {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if userNameText == "Adam" && passwordText == "Roden"
        { signInButton.configuration?.showsActivityIndicator = true }
        
        else { configureView(withMessage: "Username / password is incorrect") }
        
        
    }
    
    private func configureView(withMessage message: String)
    {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}
