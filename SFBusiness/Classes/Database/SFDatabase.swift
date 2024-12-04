//
//  SFDatabase.swift
//  SFBusiness
//
//  Created by hsf on 2024/11/28.
//

import Foundation
// Basic
import SFExtension
import SFBase
// Server
import SFLogger
// Third
import WCDBSwift

// MARK: - SFApp
extension SFApp {
    /// 客户端app数据库
    public static func clientDb() -> Database? {
        return getDb(port: .client)
    }
    /// 服务端app数据库
    public static func serverDb() -> Database? {
        return getDb(port: .server)
    }
    /// 获取app数据库
    public static func getDb(port: SFPort) -> Database? {
        do {
            let documentsDirectory = try FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let environmentUrl = documentsDirectory.appendingPathComponent(SFEnvironment.cur.path)
            let portUrl = environmentUrl.appendingPathComponent(port.path)
            let dataURL = portUrl.appendingPathComponent("data.db")
            let db = try Database(at: dataURL)
            return db
        } catch {
            SFDbLogger.error(port: port, type: .none, msgs: "获取appDb", "失败", error.localizedDescription)
            return nil
        }
    }
}
