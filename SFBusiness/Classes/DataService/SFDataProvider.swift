//
//  SFDataProvider.swift
//  SFBusiness
//
//  Created by hsf on 2024/11/30.
//

import Foundation
import UIKit
// Basic
import SFExtension
import SFBase

// MARK: - SFDataResponse
public typealias SFDataResponse = (code: SFDataResponseCode, isSuccess: Bool, data: Any?, message: String?)

// MARK: - SFDataResponseCode
public enum SFDataResponseCode: Int {
    case ok = 200
    case unauthorized = 401
    case serverError = 500
    case timeout = 504
}

// MARK: - SFDataProvider
public protocol SFDataProvider {
    /// 超时时间
    var timeout: TimeInterval {get set}
}

// MARK: - SFHttpDataProvider
public protocol SFHttpDataProvider: SFDataProvider {
    /// 服务器地址
    var baseUrl: String {get set}
    /// 接口路径
    var path: String {get set}
}
