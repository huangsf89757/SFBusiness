//
//  SFLocalDataModel.swift
//  SFBase
//
//  Created by hsf on 2024/11/20.
//

import Foundation
// Third
import WCDBSwift

// MARK: - SFLocalDataModel
open class SFLocalDataModel: TableCodable {
    // MARK: var
    /// 静态表名
    open class var tableName: String {
        return "local"
    }
    /// 序号
    /// 自增索引
    public var orderL: Int?
    
    /// 唯一标识
    /// MD5
    public var idL: String?
    
    /// 创建时间
    /// yyyy/MM/dd HH:mm:ss Z
    public var createTimeL: String?
    
    /// 更新时间
    /// yyyy/MM/dd HH:mm:ss Z
    public var updateTimeL: String?
    
    /// CodingKeys
    public enum CodingKeys: String, CodingTableKey {
        public typealias Root = SFLocalDataModel
        
        case orderL
        case idL
        case createTimeL
        case updateTimeL
        
        public static let objectRelationalMapping = TableBinding(CodingKeys.self) {
            BindColumnConstraint(orderL, isPrimary: true, isAutoIncrement: true)
            BindColumnConstraint(idL, isNotNull: true, isUnique: true)
        }
    }
    
    /// 是否自增
    public var isAutoIncrement: Bool = false
    
    /// 自增rowId
    public var lastInsertedRowID: Int64 = 0
    
    // MARK: life cycle
    public init() {}
    public required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
