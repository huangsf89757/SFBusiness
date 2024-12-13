//
//  SFLocalDataModel.swift
//  SFBase
//
//  Created by hsf on 2024/11/20.
//

import Foundation
// Basic
import SFBase

// MARK: - SFLocalDatanable
public protocol SFLocalDatanable: SFDatanable {
    /// 序号
    /// 自增索引
    var orderL: Int? {set get}
    
    /// 唯一标识
    /// MD5
    var idL: String? {set get}
    
    /// 创建时间
    /// yyyy/MM/dd HH:mm:ss Z
    var createTimeL: String? {set get}
    
    /// 更新时间
    /// yyyy/MM/dd HH:mm:ss Z
    var updateTimeL: String? {set get}
}

extension SFLocalDatanable {
    public var createDateL: Date? {
        get {
            guard let createTimeL = createTimeL else { return nil }
            return SFDateFormatter.yyyyMMddHHmmssZ.date(from: createTimeL)
        }
        set {
            guard let newValue = newValue else {
                createTimeL = nil
                return
            }
            createTimeL = SFDateFormatter.yyyyMMddHHmmssZ.string(from: newValue)
        }
    }
    public var updateDateL: Date? {
        get {
            guard let createTimeL = updateTimeL else { return nil }
            return SFDateFormatter.yyyyMMddHHmmssZ.date(from: createTimeL)
        }
        set {
            guard let newValue = newValue else {
                updateTimeL = nil
                return
            }
            updateTimeL = SFDateFormatter.yyyyMMddHHmmssZ.string(from: newValue)
        }
    }
}

extension SFLocalDatanable {
    public func defaultL() {
        orderL = 0
        idL = UUID().uuidString
        createDateL = Date()
        updateDateL = Date()
    }
}
