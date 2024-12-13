//
//  SFDatanable.swift
//  SFBusiness
//
//  Created by hsf on 2024/11/28.
//

import Foundation

// MARK: - SFDatanable
public protocol SFDatanable: class {
    static var table: String {get}
}
