//
//  SFRemoteDataModel.swift
//  SFBase
//
//  Created by hsf on 2024/11/20.
//

import Foundation
// Basic
import SFBase

// MARK: - SFRemoteDatanable
public protocol SFRemoteDatanable: SFDatanable {
    /// 序号
    /// 自增索引
    var orderR: Int? {set get}
    
    /// 唯一标识
    /// MD5
    var idR: String? {set get}
    
    /// 创建时间
    /// yyyy/MM/dd HH:mm:ss Z
    var createTimeR: String? {set get}
    
    /// 更新时间
    /// yyyy/MM/dd HH:mm:ss Z
    var updateTimeR: String? {set get}
}

extension SFRemoteDatanable {
    public var createDateR: Date? {
        get {
            guard let createTimeR = createTimeR else { return nil }
            return SFDateFormatter.yyyyMMddHHmmssZ.date(from: createTimeR)
        }
        set {
            guard let newValue = newValue else {
                createTimeR = nil
                return
            }
            createTimeR = SFDateFormatter.yyyyMMddHHmmssZ.string(from: newValue)
        }
    }
    public var updateDateR: Date? {
        get {
            guard let createTimeR = updateTimeR else { return nil }
            return SFDateFormatter.yyyyMMddHHmmssZ.date(from: createTimeR)
        }
        set {
            guard let newValue = newValue else {
                updateTimeR = nil
                return
            }
            updateTimeR = SFDateFormatter.yyyyMMddHHmmssZ.string(from: newValue)
        }
    }
}

extension SFRemoteDatanable {
    public func defaultR() {
        idR = UUID().uuidString
        createDateR = Date()
        updateDateR = Date()
    }
}
