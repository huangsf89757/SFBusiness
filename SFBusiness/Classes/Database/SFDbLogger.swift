//
//  SFDbLogger.swift
//  SFBusiness
//
//  Created by hsf on 2024/11/28.
//

import Foundation
import CoreBluetooth
// Basic
import SFExtension
// Server
import SFLogger

// MARK: - SFDbLogger
public class SFDbLogger: SFLogger {
    public enum DbType: String {
        case none       = "</>"
        case add        = "<增>"
        case delete     = "<删>"
        case update     = "<改>"
        case find       = "<查>"
    }
    
    public static func dbError(type: DbType, msgs: Any...) {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        error("[DB]", type.rawValue, message)
    }
}
