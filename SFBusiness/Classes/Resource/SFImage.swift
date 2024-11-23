//
//  SFImage.swift
//  SFUser
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
    public struct User {
        public static var bundle = SFLibUser.bundle
        private static func image(name: String) -> UIImage? {
            UIImage.sf.image(name: name, bundle: Self.bundle)
        }
        
        public static var user: UIImage? { image(name: "user") }
        public struct Gender {
            public static var female: UIImage? { image(name: "gender/female") }
            public static var male: UIImage? { image(name: "gender/male") }
        }
        public struct Info {
            public static var account: UIImage? { image(name: "info/account") }
            public static var address: UIImage? { image(name: "info/address") }
            public static var avatar: UIImage? { image(name: "info/avatar") }
            public static var birthday: UIImage? { image(name: "info/birthday") }
            public static var email: UIImage? { image(name: "info/email") }
            public static var gender: UIImage? { image(name: "info/gender") }
            public static var motto: UIImage? { image(name: "info/motto") }
            public static var nickname: UIImage? { image(name: "info/nickname") }
            public static var phone: UIImage? { image(name: "info/phone") }
        }
        public struct Sign {
            public static var account: UIImage? { image(name: "sign/account") }
            public static var code: UIImage? { image(name: "sign/code") }
            public struct Eye {
                public static var close: UIImage? { image(name: "eye/close") }
                public static var open: UIImage? { image(name: "eye/open") }
            }
            public static var pwd: UIImage? { image(name: "sign/pwd") }
        }
    }
}

