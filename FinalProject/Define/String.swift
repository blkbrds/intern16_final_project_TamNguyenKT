//
//  Strings.swift
//  MyApp
//
//  Created by iOSTeam on 2/21/18.
//  Copyright © 2018 Asian Tech Co., Ltd. All rights reserved.
//

/**
 This file defines all localizable strings which are used in this application.
 Please localize defined strings in `Resources/Localizable.strings`.
 */

import Foundation

extension App {

    struct String {
        static let error = "ERROR"
        static let ok = "OK"
    }

    struct ErrorSignIn {
        static let cancel = "Cancel"
        static let unknown = "Unknown"
        static let invalidResponse = "InvalidResponse"
        static let notHandled = "NotHandled"
        static let failed = "Failed"
    }

    struct TitleInChart {
        static let deadth = "Deadth"
        static let recovered = "Recovered"
        static let active = "Active"
    }
}
