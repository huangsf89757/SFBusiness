//
//  SFRemoteDataModel.swift
//  SFBase
//
//  Created by hsf on 2024/11/20.
//

import Foundation

// MARK: - SFRemoteDatanable
public protocol SFRemoteDatanable: SFDatanable {
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

