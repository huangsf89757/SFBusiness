//
//  SFDataService.swift
//  SFBusiness
//
//  Created by hsf on 2024/11/30.
//

import Foundation
import UIKit
// Basic
import SFExtension
import SFBase
// UI
import SFUI
// Server
import SFLogger

// MARK: - SFDataService
public final class SFDataService {
    // MARK: singleton
    public static let shared = SFDataService()
    private init() {}
    
    // MARK: var
    /// 数据供应方
    public var provider: SFDataProvider?
    
    /// 请求数据
    public func request(hud: (loading: String?, success: String?, failure: String?)? = nil,
                        apiTask: @escaping (SFDataProvider) async -> SFDataResponse?,
                        success: @escaping (Any?, String?) -> (),
                        failure: @escaping (String?) -> ()) {
        SFDsLogger.debug(port: .client, step: .start, msgs: "provider=nil")
        guard let provider = provider else {
            SFDsLogger.debug(port: .client, msgs: "provider=nil")
            return
        }
        let isHud = hud != nil
        let msg_loading = hud?.0
        let msg_success = hud?.1
        let msg_failure = hud?.2
        isHud ? SFHud.show(.loading, msg: msg_loading) : ()
        Task {
            let response = await apiTask(provider)
            guard let response = response else {
                SFDsLogger.debug(port: .client, step: .end(.failure), msgs: "response=nil")
                isHud ? SFHud.show(.failure, msg: msg_failure) : ()
                return
            }
            if response.code == .ok {
                if response.isSuccess {
                    let msg = response.message ?? msg_success
                    didSuccess(response: response, msg: msg)
                } else {
                    let msg = response.message ?? msg_failure
                    didFailure(response: response, msg: msg)
                }
            } else {
                let msg = response.message ?? response.code.desc ?? msg_failure
                didFailure(response: response, msg: msg)
            }
        }
        
        func didSuccess(response: SFDataResponse, msg: String?) {
            isHud ? SFHud.show(.success, msg: msg) : ()
            SFDsLogger.debug(port: .client, step: .end(.success), msgs: msg)
            success(response.data, msg)
        }
        func didFailure(response: SFDataResponse, msg: String?) {
            isHud ? SFHud.show(.failure, msg: msg) : ()
            SFDsLogger.debug(port: .client, step: .end(.failure), msgs: msg)
            failure(msg)
        }
    }
}

// MARK: - SFDataResponse
public typealias SFDataResponse = (code: SFDataResponseCode, isSuccess: Bool, data: Any?, message: String?)

// MARK: - SFDataResponseCode
public enum SFDataResponseCode: Int {
    case ok = 200              // 请求成功
    case badRequest = 400      // 请求错误
    case unauthorized = 401    // 未授权
    case serverError = 500     // 服务器错误
    case timeout = 504         // 请求超时

    public var desc: String {
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

