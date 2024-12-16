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

// MARK: - SFDatabase
public class SFDatabase {
    /// 获取app数据库
    static func getAppDb(port: SFPort) -> Database? {
        do {
            let documentsDirectory = try FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let environmentUrl = documentsDirectory.appendingPathComponent(SFEnvironment.cur.path)
            let portUrl = environmentUrl.appendingPathComponent(port.path)
            let dataURL = portUrl.appendingPathComponent("data.db")
            let db = try Database(at: dataURL)
            return db
        } catch {
            SFDatabaseLogger.error(port: port, type: .none, msgs: "获取appDb", "失败", error.localizedDescription)
            return nil
        }
    }
    
    /// 获取User数据库
    static func getUserDb(port: SFPort, uid: String) -> Database? {
        do {
            let documentsDirectory = try FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let environmentUrl = documentsDirectory.appendingPathComponent(SFEnvironment.cur.path)
            let portUrl = environmentUrl.appendingPathComponent(port.path)
            let userUrl = environmentUrl.appendingPathComponent(uid)
            let dataURL = portUrl.appendingPathComponent("data.db")
            let db = try Database(at: dataURL)
            return db
        } catch {
            SFDatabaseLogger.error(port: port, type: .none, msgs: "获取userDb", "失败", error.localizedDescription)
            return nil
        }
    }
}

// MARK: - SFClientDatabase
public class SFClientDatabase: SFDatabase {
    
    private static var _appDb: Database?
    /// 获取App数据库
    public static func getAppDb() -> Database? {
        if let _appDb = _appDb {
            return _appDb
        }
        let db = getAppDb(port: .client)
        _appDb = db
        return db
    }
    
    /// 获取User数据库
    public static func getUserDb(with uid: String) -> Database? {
        return getUserDb(port: .client, uid: uid)
    }
}

// MARK: - SFServerDatabase
public class SFServerDatabase: SFDatabase {
    
    private static var _appDb: Database?
    /// 获取App数据库
    public static func getAppDb() -> Database? {
        if let _appDb = _appDb {
            return _appDb
        }
        let db = getAppDb(port: .server)
        _appDb = db
        return db
    }
    
    /// 获取User数据库
    public static func getUserDb(with uid: String) -> Database? {
        return getUserDb(port: .server, uid: uid)
    }
}
