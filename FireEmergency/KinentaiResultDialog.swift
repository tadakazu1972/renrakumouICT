//
//  KinentaiResultDialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/15.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class KinentaiResultDialog {
    //ボタン押したら出るUIWindow
    private var parent: KinentaiViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var btnClose: UIButton!
    //データ保存用
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var mainStation: String!
    var tsunamiStation: String!
    var kubun: String!
    
    //コンストラクタ
    init(parentView: KinentaiViewController){
        parent = parentView
        win1 = UIWindow()
        text1 = UITextView()
        btnClose = UIButton()
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        text1 = nil
        btnClose = nil
    }
    
    //表示
    func showResult(data :Int, item :Int){
        //元の画面を暗く
        parent.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.whiteColor()
        win1.frame = CGRectMake(80,180,parent.view.frame.width-40,parent.view.frame.height-100)
        win1.layer.position = CGPointMake(parent.view.frame.width/2, parent.view.frame.height/2)
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKeyWindow()
        //表示
        self.win1.makeKeyAndVisible()
        
        //TextView生成
        text1.frame = CGRectMake(10,10, self.win1.frame.width - 20, self.win1.frame.height-60)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(18))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        text1.scrollEnabled = true
        text1.dataDetectorTypes = .Link
        
        //テキストの内容を場合分け
        switch data {
        //地震(震央「陸」)>震度７(特別区６強)
        case 11:
            //csvファイル読込
            var result: [[String]] = []
            if let path = NSBundle.mainBundle().pathForResource("riku7", ofType: "csv") {
                var csvString = ""
                do {
                    csvString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                csvString.enumerateLines { (line, stop) -> () in
                    result.append(line.componentsSeparatedByString(","))
                }
                
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = "■最大震度７(特別区６強)\n　\(result[item][0])\n\n・指揮支援隊\n　\(result[item][1])\n\n・大阪府大隊(陸上)\n　\(result[item][2])\n\n・大阪府大隊(航空)\n　\(result[item][3])"
                }
            } else {
                text1.text = "csvファイル読み込みエラー"
            }
            break
        case 12:
            //csvファイル読込
            var result: [[String]] = []
            if let path = NSBundle.mainBundle().pathForResource("riku6strong", ofType: "csv") {
                var csvString = ""
                do {
                    csvString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                csvString.enumerateLines { (line, stop) -> () in
                    result.append(line.componentsSeparatedByString(","))
                }
                
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = "■最大震度６強(特別区６弱)\n　\(result[item][0])\n\n・指揮支援隊\n　\(result[item][1])\n\n・大阪府大隊(陸上)\n　\(result[item][2])\n\n・大阪府大隊(航空)\n　\(result[item][3])"
                }
            } else {
                text1.text = "csvファイル読み込みエラー"
            }
            break
        case 13:
            //csvファイル読込
            var result: [[String]] = []
            if let path = NSBundle.mainBundle().pathForResource("riku6weak", ofType: "csv") {
                var csvString = ""
                do {
                    csvString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                csvString.enumerateLines { (line, stop) -> () in
                    result.append(line.componentsSeparatedByString(","))
                }
                
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = "■最大震度6弱(特別区5強,政令市5強)\n　\(result[item][0])\n\n・指揮支援隊\n　\(result[item][1])\n\n・大阪府大隊(陸上)\n　\(result[item][2])\n\n・大阪府大隊(航空)\n　\(result[item][3])"
                }
            } else {
                text1.text = "csvファイル読み込みエラー"
            }
            break
        //地震(震央「海域」)
        case 21:
            //csvファイル読込
            var result: [[String]] = []
            if let path = NSBundle.mainBundle().pathForResource("kaiiki7", ofType: "csv") {
                var csvString = ""
                do {
                    csvString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                csvString.enumerateLines { (line, stop) -> () in
                    result.append(line.componentsSeparatedByString(","))
                }
                
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = "■最大震度７(特別区６強)\n　\(result[item][0])\n\n・指揮支援隊\n　\(result[item][1])\n\n・大阪府大隊(陸上)\n　\(result[item][2])\n\n・大阪府大隊(航空)\n　\(result[item][3])"
                }
            } else {
                text1.text = "csvファイル読み込みエラー"
            }
            break
        case 22:
            //csvファイル読込
            var result: [[String]] = []
            if let path = NSBundle.mainBundle().pathForResource("rkaiiki6strong", ofType: "csv") {
                var csvString = ""
                do {
                    csvString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                csvString.enumerateLines { (line, stop) -> () in
                    result.append(line.componentsSeparatedByString(","))
                }
                
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = "■最大震度６強(特別区６弱)\n　\(result[item][0])\n\n・指揮支援隊\n　\(result[item][1])\n\n・大阪府大隊(陸上)\n　\(result[item][2])\n\n・大阪府大隊(航空)\n　\(result[item][3])"
                }
            } else {
                text1.text = "csvファイル読み込みエラー"
            }
            break
        case 23:
            //csvファイル読込
            var result: [[String]] = []
            if let path = NSBundle.mainBundle().pathForResource("kaiiki6weak", ofType: "csv") {
                var csvString = ""
                do {
                    csvString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                csvString.enumerateLines { (line, stop) -> () in
                    result.append(line.componentsSeparatedByString(","))
                }
                
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = "■最大震度6弱(特別区5強,政令市5強)\n　\(result[item][0])\n\n・指揮支援隊\n　\(result[item][1])\n\n・大阪府大隊(陸上)\n　\(result[item][2])\n\n・大阪府大隊(航空)\n　\(result[item][3])"
                }
            } else {
                text1.text = "csvファイル読み込みエラー"
            }
            break
        //アクションプラン
        case 31:
            //テキストファイル読込
            let path = NSBundle.mainBundle().pathForResource("kinentai_toukai", ofType: "txt")!
            if let data = NSData(contentsOfFile: path){
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = String(NSString(data: data, encoding: NSUTF8StringEncoding)!)
                }
            } else {
                text1.text = "ファイル読込エラー"
            }
            break
        case 32:
            //テキストファイル読込
            let path = NSBundle.mainBundle().pathForResource("kinentai_syutochokka", ofType: "txt")!
            if let data = NSData(contentsOfFile: path){
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = String(NSString(data: data, encoding: NSUTF8StringEncoding)!)
                }
            } else {
                text1.text = "ファイル読込エラー"
            }
            break
        case 33:
            //テキストファイル読込
            let path = NSBundle.mainBundle().pathForResource("kinentai_tounankai", ofType: "txt")!
            if let data = NSData(contentsOfFile: path){
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = String(NSString(data: data, encoding: NSUTF8StringEncoding)!)
                }
            } else {
                text1.text = "ファイル読込エラー"
            }
            break
        //南海トラフ　判定後該当のアクション
        case 34:
            //テキストファイル読込
            let path = NSBundle.mainBundle().pathForResource("kinentai_nankaitraf", ofType: "txt")!
            if let data = NSData(contentsOfFile: path){
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = String(NSString(data: data, encoding: NSUTF8StringEncoding)!)
                }
            } else {
                text1.text = "ファイル読込エラー"
            }
            break
        //南海トラフ　アクションプラン適用なし
        case 35:
            //テキストファイル読込
            let path = NSBundle.mainBundle().pathForResource("kinentai_nankaitraf2", ofType: "txt")!
            if let data = NSData(contentsOfFile: path){
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = String(NSString(data: data, encoding: NSUTF8StringEncoding)!)
                }
            } else {
                text1.text = "ファイル読込エラー"
            }
            break
        //大津波警報・噴火
        case 41:
            //csvファイル読込
            var result: [[String]] = []
            if let path = NSBundle.mainBundle().pathForResource("otsunami", ofType: "csv") {
                var csvString = ""
                do {
                    csvString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                csvString.enumerateLines { (line, stop) -> () in
                    result.append(line.componentsSeparatedByString(","))
                }
                
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = "■大津波警報\n　\(result[item][0])\n\n・指揮支援隊\n　\(result[item][1])\n\n・大阪府大隊(陸上)\n　\(result[item][2])\n\n・大阪府大隊(航空)\n　\(result[item][3])"
                }
            } else {
                text1.text = "csvファイル読み込みエラー"
            }
            break
        case 42:
            //csvファイル読込
            var result: [[String]] = []
            if let path = NSBundle.mainBundle().pathForResource("hunka", ofType: "csv") {
                var csvString = ""
                do {
                    csvString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                csvString.enumerateLines { (line, stop) -> () in
                    result.append(line.componentsSeparatedByString(","))
                }
                
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = "■噴火\n　\(result[item][0])\n\n・指揮支援隊\n　\(result[item][1])\n\n・大阪府大隊(陸上)\n　\(result[item][2])\n\n・大阪府大隊(航空)\n　\(result[item][3])"
                }
            } else {
                text1.text = "csvファイル読み込みエラー"
            }
            break
        //特殊災害(NBC含む)
        case 51:
            //csvファイル読込
            var result: [[String]] = []
            if let path = NSBundle.mainBundle().pathForResource("nbc", ofType: "csv") {
                var csvString = ""
                do {
                    csvString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                csvString.enumerateLines { (line, stop) -> () in
                    result.append(line.componentsSeparatedByString(","))
                }
                
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = "■特殊災害(NBC含む)\n　\(result[item][0])\n\n・指揮支援隊\n　\(result[item][1])\n\n・大阪府大隊(陸上)\n　\(result[item][2])\n\n・大阪府大隊(航空)\n　\(result[item][3])"
                }
            } else {
                text1.text = "csvファイル読み込みエラー"
            }
            break
        default:
            text1.text=""
            break
        }
        
        self.win1.addSubview(text1)
        
        //閉じるボタン生成
        btnClose.frame = CGRectMake(0,0,100,30)
        btnClose.backgroundColor = UIColor.orangeColor()
        btnClose.setTitle("閉じる", forState: .Normal)
        btnClose.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnClose.layer.masksToBounds = true
        btnClose.layer.cornerRadius = 10.0
        btnClose.layer.position = CGPointMake(self.win1.frame.width/2, self.win1.frame.height-20)
        btnClose.addTarget(self, action: #selector(self.onClickClose(_:)), forControlEvents: .TouchUpInside)
        self.win1.addSubview(btnClose)
    }
    
    //閉じる
    @objc func onClickClose(sender: UIButton){
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
    }
}
