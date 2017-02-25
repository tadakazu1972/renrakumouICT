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
        resultArray = []
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
    
    func update(name: String, tel: String, mail: String, kubun: String, syozoku0: String, syozoku: String, kinmu: String, _id: String){
        let sql = "UPDATE records SET name = ?, tel = ?, mail = ?, kubun = ?, syozoku0 = ?, syozoku = ?, kinmu = ? WHERE _id = ?;"
        db.open()
        db.executeUpdate(sql, withArgumentsInArray: [name, tel, mail, kubun, syozoku0, syozoku, kinmu, _id])
        print("DBの _id =\(_id)をupdateしました")
        db.close()
    }
    
    func delete(_id: String){
        let sql = "DELETE FROM records WHERE _id = ?;"
        db.open()
        db.executeUpdate(sql, withArgumentsInArray: [_id])
        db.close()        
    }
    
    func selectAll(){
        //前の検索結果が残っているので全削除
        resultArray.removeAll()
        let sql = "SELECT * FROM records ORDER BY _id;"
        db.open()
        let results = db.executeQuery(sql, withArgumentsInArray: nil)
        while results.next(){
            let _name: String = results.stringForColumn("name")
            let _tel: String = results.stringForColumn("tel")
            let _mail: String = results.stringForColumn("mail")
            let _kubun: String = results.stringForColumn("kubun")
            let _syozoku0: String = results.stringForColumn("syozoku0")
            let _syozoku: String = results.stringForColumn("syozoku")
            let _kinmu: String = results.stringForColumn("kinmu")
            resultArray.append([_name, _tel, _mail, _kubun, _syozoku0, _syozoku, _kinmu])
        }
        db.close()
    }
    
    // _idも取得するバージョン
    func selectAll2(){
        //前の検索結果が残っているので全削除
        resultArray.removeAll()
        let sql = "SELECT * FROM records ORDER BY _id;"
        db.open()
        let results = db.executeQuery(sql, withArgumentsInArray: nil)
        while results.next(){
            let _name: String = results.stringForColumn("name")
            let _tel: String = results.stringForColumn("tel")
            let _mail: String = results.stringForColumn("mail")
            let _kubun: String = results.stringForColumn("kubun")
            let _syozoku0: String = results.stringForColumn("syozoku0")
            let _syozoku: String = results.stringForColumn("syozoku")
            let _kinmu: String = results.stringForColumn("kinmu")
            let _id: String = results.stringForColumn("_id")
            resultArray.append([_name, _tel, _mail, _kubun, _syozoku0, _syozoku, _kinmu, _id])
        }
        db.close()
    }
}
