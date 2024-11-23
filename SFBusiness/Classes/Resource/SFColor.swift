//
//  SFColor.UI.swift
//  SFUser
//
//  Created by hsf on 2024/7/19.
//

import Foundation
import UIKit
// Basic
import SFExtension
import SFBase
// UI
import SFUI

// MARK: - SFColor
extension SFColor {
    public struct User {
        public static var bundle = SFLibUser.bundle
        private static func color(name: String) -> UIColor? {
            UIColor.sf.color(name: name, bundle: Self.bundle)
        }
        
        
    }
}


