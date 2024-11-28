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
    /// app数据库
    public static var appDb: Database? = {
        do {
            let documentsDirectory = try FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let databaseURL = documentsDirectory.appendingPathComponent("data.db")
            return try Database(at: databaseURL)
        } catch {
            SFLogger.debug("Failed to initialize app database: \(error)")
            return nil
        }
    }()
}
