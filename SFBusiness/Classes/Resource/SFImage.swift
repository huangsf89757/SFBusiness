//
//  SFImage.swift
//  SFBusiness
//
//  Created by hsf on 2024/7/23.
//

import Foundation
import UIKit
// Basic
import SFExtension
import SFBase
// UI
import SFUI

// MARK: - SFImage
extension SFImage {
    public struct Business {
        public static var bundle = SFBusinessLib.bundle
        private static func image(name: String) -> UIImage? {
            UIImage.sf.image(name: name, bundle: Self.bundle)
        }
        
        
    }
}

