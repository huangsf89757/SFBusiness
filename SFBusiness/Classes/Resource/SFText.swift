//
//  SFText.swift
//  SFUser
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
    public struct User {
        public static var bundle = SFLibUser.bundle
        private static func text(name: String) -> String {
            NSLocalizedString(name, bundle: Self.bundle ?? .main, comment: name)
        }
        
        public static var gender: String { text(name: "gender") }
        public static var gender_female: String { text(name: "gender_female") }
        public static var gender_male: String { text(name: "gender_male") }
        public static var gender_unknown: String { text(name: "gender_unknown") }
        public static var info: String { text(name: "info") }
        public static var sign_action_in: String { text(name: "sign_action_in") }
        public static var sign_action_out: String { text(name: "sign_action_out") }
        public static var info_account: String { text(name: "info_account") }
        public static var info_address: String { text(name: "info_address") }
        public static var info_avatar: String { text(name: "info_avatar") }
        public static var info_birthday: String { text(name: "info_birthday") }
        public static var info_email: String { text(name: "info_email") }
        public static var info_id: String { text(name: "info_id") }
        public static var info_motto: String { text(name: "info_motto") }
        public static var info_nickname: String { text(name: "info_nickname") }
        public static var info_phone: String { text(name: "info_phone") }
        public static var sign_field_account: String { text(name: "sign_field_account") }
        public static var sign_field_code: String { text(name: "sign_field_code") }
        public static var sign_field_pwd: String { text(name: "sign_field_pwd") }
        public static var sign_field_repwd: String { text(name: "sign_field_repwd") }
        public static var sign_hint_account: String { text(name: "sign_hint_account") }
        public static var sign_hint_code: String { text(name: "sign_hint_code") }
        public static var sign_hint_pwd: String { text(name: "sign_hint_pwd") }
        public static var sign_hint_pwd_diff: String { text(name: "sign_hint_pwd_diff") }
        public static var sign_hint_repwd: String { text(name: "sign_hint_repwd") }
        public static var sign_mode_code: String { text(name: "sign_mode_code") }
        public static var sign_mode_pwd: String { text(name: "sign_mode_pwd") }
        
    }
}

