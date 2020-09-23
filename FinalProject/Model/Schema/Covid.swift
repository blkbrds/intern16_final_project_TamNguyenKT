//
//  Covid.swift
//  FinalProject
//
//  Created by PCI0001 on 9/17/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import ObjectMapper

final class Covid: Mappable {

    // MARK: - Properties
    var countries: [Country]?

    // MARK: - Initial
    init?(map: Map) { }

    // MARK: - Functions
    func mapping(map: Map) {
        countries <- map["Countries"]
    }
}
