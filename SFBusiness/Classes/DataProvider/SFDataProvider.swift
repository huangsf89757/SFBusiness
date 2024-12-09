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
    case ok = 200              // 请求成功
    case badRequest = 400      // 请求错误
    case unauthorized = 401    // 未授权
    case serverError = 500     // 服务器错误
    case timeout = 504         // 请求超时

    var desc: String {
        switch self {
        case .ok:
            return "Request succeeded."
        case .badRequest:
            return "Bad request."
        case .unauthorized:
            return "Unauthorized access."
        case .serverError:
            return "Server encountered an error."
        case .timeout:
            return "Request timed out."
        }
    }

    var isSuccessful: Bool {
        return self == .ok
    }

    public init?(rawValue: Int) {
        switch rawValue {
        case 200:
            self = .ok
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 500:
            self = .serverError
        case 504:
            self = .timeout
        default:
            return nil 
        }
    }
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
