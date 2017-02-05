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
    }
    
    func connectDB(){
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let path = paths[0].stringByAppendingPathComponent("myrecord.db")
        db = FMDatabase(path: path)
    }
}
