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

// MARK: - SFDataService
public final class SFDataService {
    // MARK: singleton
    public static let shared = SFDataService()
    private init() {}
    
    // MARK: var
    /// 数据供应方
    public var provider: SFDataProvider?
    
}



