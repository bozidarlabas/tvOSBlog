//
//  String+Localization.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 01.12.2023..
//

import Foundation

extension String {

    var localized: String { NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "") }

}

