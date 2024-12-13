//
//  SFDpLogger.swift
//  SFBusiness
//
//  Created by hsf on 2024/12/9.
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

// MARK: - SFDpLogger
public class SFDpLogger {
    public static let special = "[DP]"
}

extension SFDpLogger {
    @discardableResult
    private static func custom(level: SwiftyBeaver.Level,
                               file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                               port: SFPort, tag: String? = nil, step: SFLogStep? = nil,
                               message: Any) -> SFLogInfo {
        var specialTag = special
        specialTag += port.tag
        if let tag = tag {
            specialTag += " \(tag)"
        }
        return SFLogger.custom(level: level, file: file, function: function, line: line, context: context, tag: specialTag, step: step, msgs: message)
    }
}

// MARK: - 可变参数版本
extension SFDpLogger {
    @discardableResult
    public static func verbose(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                               port: SFPort, tag: String? = nil, step: SFLogStep? = nil,
                               msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .verbose, file: file, function: function, line: line, context: context,
                      port: port, tag: tag, step: step,
                      message: message)
    }
    
    @discardableResult
    public static func debug(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                             port: SFPort, tag: String? = nil, step: SFLogStep? = nil,
                             msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .debug, file: file, function: function, line: line, context: context,
                      port: port, tag: tag, step: step,
                      message: message)
    }
    
    @discardableResult
    public static func info(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                            port: SFPort, tag: String? = nil, step: SFLogStep? = nil,
                            msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .info, file: file, function: function, line: line, context: context,
                      port: port, tag: tag, step: step,
                      message: message)
    }
    
    @discardableResult
    public static func warning(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                               port: SFPort, tag: String? = nil, step: SFLogStep? = nil,
                               msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .warning, file: file, function: function, line: line, context: context,
                      port: port, tag: tag, step: step,
                      message: message)
    }
    
    @discardableResult
    public static func error(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                             port: SFPort, tag: String? = nil, step: SFLogStep? = nil,
                             msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .error, file: file, function: function, line: line, context: context,
                      port: port, tag: tag, step: step,
                      message: message)
    }
    
    @discardableResult
    public static func critical(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                                port: SFPort, tag: String? = nil, step: SFLogStep? = nil,
                                msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .critical, file: file, function: function, line: line, context: context,
                      port: port, tag: tag, step: step,
                      message: message)
    }
    
    @discardableResult
    public static func fault(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                             port: SFPort, tag: String? = nil, step: SFLogStep? = nil,
                             msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .fault, file: file, function: function, line: line, context: context,
                      port: port, tag: tag, step: step,
                      message: message)
    }
    
    @discardableResult
    public static func custom(level: SwiftyBeaver.Level,
                              file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                              port: SFPort, tag: String? = nil, step: SFLogStep? = nil,
                              msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: level, file: file, function: function, line: line, context: context,
                      port: port, tag: tag, step: step,                      
                      message: message)
    }
}

