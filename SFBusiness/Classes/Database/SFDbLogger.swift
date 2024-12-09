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
import SFBase
// Server
import SFLogger
// Third
import SwiftyBeaver

// MARK: - SFDbLogger
public class SFDbLogger {
    
}
extension SFDbLogger {
    public static func verbose(port: SFPort, type: DbType,
                               file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                               msgs: Any...) {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        SFLogger.verbose(file: file, function: function, line: line, context: context, messages: "[DB]\(port.tag)", type.tag, message)
    }
    
    public static func debug(port: SFPort, type: DbType,
                             file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                             msgs: Any...) {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        SFLogger.debug(file: file, function: function, line: line, context: context, messages: "[DB]\(port.tag)", type.tag, message)
    }
    
    public static func info(port: SFPort, type: DbType,
                            file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                            msgs: Any...) {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        SFLogger.info(file: file, function: function, line: line, context: context, messages: "[DB]\(port.tag)", type.tag, message)
    }
    
    public static func warning(port: SFPort, type: DbType,
                               file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                               msgs: Any...) {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        SFLogger.warning(file: file, function: function, line: line, context: context, messages: "[DB]\(port.tag)", type.tag, message)
    }
        
    public static func error(port: SFPort, type: DbType,
                             file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                             msgs: Any...) {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        SFLogger.error(file: file, function: function, line: line, context: context, messages: "[DB]\(port.tag)", type.tag, message)
    }
    
    public static func critical(port: SFPort, type: DbType,
                                file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                                msgs: Any...) {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        SFLogger.critical(file: file, function: function, line: line, context: context, messages: "[DB]\(port.tag)", type.tag, message)
    }
    
    public static func fault(port: SFPort, type: DbType,
                             file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                             msgs: Any...) {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        SFLogger.fault(file: file, function: function, line: line, context: context, messages: "[DB]\(port.tag)", type.tag, message)
    }

    public static func custom(level: SwiftyBeaver.Level, port: SFPort, type: DbType,
                              file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                              msgs: Any...) {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        SFLogger.custom(level: level, file: file, function: function, line: line, context: context, messages: "[DB]\(port.tag)", type.tag, message)
    }
}

// MARK: - DbType
public enum DbType {
    case none
    case add
    case delete
    case update
    case find
    
    public var tag: String {
        switch self {
        case .none:
            return "</>"
        case .add:
            return "<增>"
        case .delete:
            return "<删>"
        case .update:
            return "<改>"
        case .find:
            return "<查>"
        }
    }
}

// MARK: - SFPort
extension SFPort {
    public var tag: String {
        switch self {
        case .none:
            return " "
        case .client:
            return "C"
        case .server:
            return "S"
        }
    }
}


