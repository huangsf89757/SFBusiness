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
