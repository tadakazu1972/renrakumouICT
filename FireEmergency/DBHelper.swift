//
//  DBHelper.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/02/05.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

class DBHelper {
    var db : FMDatabase
    var resultArray: [[String]] //SELECTの結果格納用配列
    
    //コンストラクタ
    init(){
        db = FMDatabase.init()
        //resultArray = []
        resultArray = [[String]](count: 100, repeatedValue: [String](count: 100, repeatedValue: ""))
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
    
    func insert(name: String, tel: String, mail: String, kubun: String, syozoku0: String, syozoku: String, kinmu: String){
        let sql = "INSERT INTO records(name, tel, mail, kubun, syozoku0, syozoku, kinmu) VALUES(?, ?, ?, ?, ?, ?, ?);"
        db.open()
        db.executeUpdate(sql, withArgumentsInArray: [name, tel, mail, kubun, syozoku0, syozoku, kinmu])
        db.close()
    }
    
    func delete(_id: Int){
        let sql = "DELETE FROM records WHERE _id = ?;"
        db.open()
        db.executeUpdate(sql, withArgumentsInArray: [_id])
        db.close()        
    }
    
    func selectAll(){
        let sql = "SELECT * FROM records ORDER BY _id;"
        db.open()
        let results = db.executeQuery(sql, withArgumentsInArray: nil)
        var i = 0
        while results.next(){
            resultArray[i][0] = results.stringForColumn("name")
            resultArray[i][1] = results.stringForColumn("tel")
            resultArray[i][2] = results.stringForColumn("mail")
            resultArray[i][3] = results.stringForColumn("kubun")
            resultArray[i][4] = results.stringForColumn("syozoku0")
            resultArray[i][5] = results.stringForColumn("syozoku")
            resultArray[i][6] = results.stringForColumn("kinmu")
            i = i + 1
        }
        db.close()
    }
}
