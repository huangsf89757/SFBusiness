//
//  SFText.swift
//  SFBusiness
//
//  Created by hsf on 2024/11/19.
//

import Foundation
import UIKit
// Basic
import SFExtension
import SFBase
// UI
import SFUI

// MARK: - SFText
extension SFText {
    public struct Business {
        public static var bundle = SFBusinessLib.bundle
        private static func text(name: String) -> String {
            NSLocalizedString(name, bundle: Self.bundle ?? .main, comment: name)
        }
        
        public static var agreement: String { text(name: "agreement") }
        public static var agreement_policy: String { text(name: "agreement_policy") }
        public static var agreement_term: String { text(name: "agreement_term") }
        public static var version: String { text(name: "version") }
        public static var copyright: String { text(name: "copyright") }
    }
}

