//
//  SFDatabase.swift
//  SFBusiness
//
//  Created by hsf on 2024/11/28.
//

import Foundation
// Server
import SFLogger
// Third
import WCDBSwift

// MARK: - SFDatabase
public class SFDatabase {
    private static var _appDb: Database?
    /// app数据库
    public static func appDb() -> Database? {
        if let _appDb = _appDb {
            return _appDb
        }
        do {
            let documentsDirectory = try FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let databaseURL = documentsDirectory.appendingPathComponent("data.db")
            let db = try Database(at: databaseURL)
            _appDb = db
            return db
        } catch {
            SFDbLogger.dbError(type: .none, msgs: "获取appDb", "失败", error.localizedDescription)
            return nil
        }
    }
}
