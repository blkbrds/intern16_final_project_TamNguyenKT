//
//  LoginViewController.swift
//  FinalProject
//
//  Created by PCI0001 on 9/14/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit
import AuthenticationServices
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn

final class LoginViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var googleButton: GIDSignInButton!
    
    // MARK: - Properties
    private var appleButton: ASAuthorizationAppleIDButton!

    enum ErrorSignIn: String {
        case cancel = "Cancel.Sign in again"
        case unknown = "Unknown. Sign in again"
        case invalidResponse = "InvalidResponse. Sign in again"
        case notHandle = "Not Handle. Sign in again"
        case failed = "Failed. Sign in again"
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configAppleButton()
        configGoogleButton()
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        let hasUserInterfaceStyleChanged = traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)
        
        if hasUserInterfaceStyleChanged {
            setupProviderLoginView()
        }
    }
    
    func setupProviderLoginView() {
        switch traitCollection.userInterfaceStyle {
        case .dark:
            let frame = appleButton.frame
            appleButton.removeFromSuperview()
            appleButton = nil
            
            appleButton = ASAuthorizationAppleIDButton(type: .default, style: .white)
            appleButton.frame = frame
            view.addSubview(appleButton)
        default:
            let frame = appleButton.frame
            appleButton.removeFromSuperview()
            appleButton = nil
            
            appleButton = ASAuthorizationAppleIDButton(type: .default, style: .black)
            appleButton.frame = frame
            view.addSubview(appleButton)
        }
    }
    
    // MARK: - Private methods
    private func configAppleButton() {
        appleButton = ASAuthorizationAppleIDButton(type: .default, style: .black)
        let frame = CGRect(x: googleButton.frame.origin.x, y: googleButton.frame.maxY, width: googleButton.frame.width, height: googleButton.frame.height)
        appleButton.frame = frame
        appleButton.cornerRadius  = 8
        appleButton.addTarget(self, action: #selector(appleButtonTouchUpInside), for: .touchUpInside)
        
        view.addSubview(appleButton)
    }
    
    private func configGoogleButton() {
        googleButton.style = .wide
        googleButton.colorScheme = .light
    }
    
    private func createAlert(title: String) {
        let alert = UIAlertController(title: title)
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func appleButtonTouchUpInside() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            AppDelegate.shared.changeRootViewController(changeRoot: .tabbar)
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        guard let error = error as? ASAuthorizationError else { return }
        switch error.code {
        case .canceled:
            createAlert(title: ErrorSignIn.cancel.rawValue)
        case .unknown:
            createAlert(title: ErrorSignIn.unknown.rawValue)
        case .invalidResponse:
            createAlert(title: ErrorSignIn.invalidResponse.rawValue)
        case .notHandled:
            createAlert(title: ErrorSignIn.notHandle.rawValue)
        case .failed:
            createAlert(title: ErrorSignIn.failed.rawValue)
        @unknown default:
            createAlert(title: ErrorSignIn.unknown.rawValue)
        }
    }
}
