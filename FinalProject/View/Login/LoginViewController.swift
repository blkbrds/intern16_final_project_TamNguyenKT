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

final class LoginViewController: ViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var googleButton: GIDSignInButton!

    // MARK: - Properties
    private var appleButton: ASAuthorizationAppleIDButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configAppleButton()
        configGoogleButton()
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
        appleButton.cornerRadius = 8
        appleButton.addTarget(self, action: #selector(appleButtonTouchUpInside), for: .touchUpInside)

        view.addSubview(appleButton)
    }

    private func configGoogleButton() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        googleButton.style = .wide
        googleButton.colorScheme = .light
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
        guard let window = self.view.window else { return ASPresentationAnchor() }
        return window
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let appleIDToken = appleIDCredential.identityToken else { return }

            guard String(data: appleIDToken, encoding: .utf8) != nil else {
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
            alert(title: App.ErrorSignIn.cancel)
        case .unknown:
            alert(title: App.ErrorSignIn.unknown)
        case .invalidResponse:
            alert(title: App.ErrorSignIn.invalidResponse)
        case .notHandled:
            alert(title: App.ErrorSignIn.notHandled)
        case .failed:
            alert(title: App.ErrorSignIn.failed)
        @unknown default:
            alert(title: App.ErrorSignIn.unknown)
        }
    }
}
