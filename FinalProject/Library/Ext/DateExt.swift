//
//  DateExt.swift
//  FinalProject
//
//  Created by PCI0001 on 10/1/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import UIKit

extension DateFormatter {

   static func dateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }
}
