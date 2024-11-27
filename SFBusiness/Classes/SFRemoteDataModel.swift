//
//  SFRemoteDataModel.swift
//  SFBase
//
//  Created by hsf on 2024/11/20.
//

import Foundation
// Third
//import WCDBSwift

// MARK: - SFRemoteDataModel
open class SFRemoteDataModel: SFLocalDataModel {
    // MARK: var
    /// 静态表名
    open override class var tableName: String {
        return "remote"
    }
    /// 序号
    /// 自增索引
    public var orderR: Int?
    
    /// 唯一标识
    /// MD5
    public var idR: String?
    
    /// 创建时间
    /// yyyy/MM/dd HH:mm:ss Z
    public var createTimeR: String?
    
    /// 更新时间
    /// yyyy/MM/dd HH:mm:ss Z
    public var updateTimeR: String?
    
//    /// CodingKeys
//    public enum CodingKeys: String, CodingTableKey {
//        public typealias Root = SFRemoteDataModel
//        
//        case orderL
//        case idL
//        case createTimeL
//        case updateTimeL
//        
//        case orderR
//        case idR
//        case createTimeR
//        case updateTimeR
//        
//        public static let objectRelationalMapping = TableBinding(CodingKeys.self) {
//            BindColumnConstraint(orderL, isPrimary: true, isAutoIncrement: true)
//            BindColumnConstraint(idL, isNotNull: true, isUnique: true)
//        }
//    }
    
//    // MARK: life cycle
//    public override init() {
//        super.init()
//    }
//    public required init(from decoder: Decoder) throws {
//        fatalError("init(from:) has not been implemented")
//    }
    
}
