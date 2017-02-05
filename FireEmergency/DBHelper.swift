//
//  DBHelper.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/02/05.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

class DBHelper {
    var db : FMDatabase
    
    //コンストラクタ
    init(){
        db = FMDatabase.init()
        connectDB()
    }
    
    func connectDB(){
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let path = paths[0].stringByAppendingPathComponent("myrecord.db")
        db = FMDatabase(path: path)
    }
    
    func createTable(){
        db.open()
        let sql = "CREATE TABLE IF NOT EXISTS records(_id integer primary key autoincrement,name text,tel text,mail text,kubun text,syozoku0 text,syozoku text,kinmu text);"
        let ret = db.executeUpdate(sql, withArgumentsInArray: nil)
        if ret {
            print("テーブル作成　成功")
        } else {
            print("テーブル作成　失敗")
        }
        db.close()
    }
}
