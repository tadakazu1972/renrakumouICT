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
        //特別警報
        case 21:
            text1.text="■特別警報\n\n１号招集\n\n\(mainStation)へ参集"
            break
        //暴風（雪）警報
        case 22:
            //４号招集なので、１号、２号、３号は参集なしの判定する
            if kubun == "４号招集" {
                text1.text="■暴風(雪)警報\n\n４号招集(非番・日勤)\n\n\(mainStation)へ参集　所属担当者に確認すること\n\n※平日の9時～17時30分は、原則、勤務中の毎日勤務者で活動体制を確保する"
            } else {
                text1.text="■暴風(雪)警報\n\n４号招集(非番・日勤)\n\n招集なし"
            }
            break
        //大雨警報
        case 23:
            if mainStation == "教育訓練センター" {
                text1.text="■大雨警報\n\n第５非常警備(全署、消防局)\n\nー\n\n招集なし"
            } else {
                text1.text="■大雨警報\n\n第５非常警備(全署、消防局)\n\n\(mainStation)\n\n招集なし"
            }
            break
        //大雪警報
        case 24:
            if mainStation == "教育訓練センター" {
                text1.text="■大雪警報\n\n第５非常警備(全署、消防局)\n\nー\n\n招集なし"
            } else {
                text1.text="■大雪警報\n\n第５非常警備(全署、消防局)\n\n\(mainStation)\n\n招集なし"
            }
            break
        //洪水警報
        case 25:
            //勤務消防署がリストに該当するか判定　あえて大津波・津波警報時参集指定署ではないことに注意！
            let gaitousyo = Set(arrayLiteral: "北", "都島", "福島", "此花", "中央", "西淀川", "淀川", "東淀川", "東成", "生野", "旭", "城東", "鶴見", "住之江", "住吉", "東住吉", "平野", "消防局")
            //mainStationではすでに「消防署」の文字列を付け足してしまっているので上記リストとの比較はuserDefaultの格納値を使う
            if gaitousyo.contains(userDefaults.stringForKey("mainStation")!){
                text1.text="■洪水警報\n\n第５非常警備(北、都島、福島、此花、中央、西淀川、淀川、東淀川、東成、生野、旭、城東、鶴見、住之江、住吉、東住吉、平野、消防局)\n\n\(mainStation)\n\n招集なし"
            } else {
                text1.text="■洪水警報\n\n第５非常警備(北、都島、福島、此花、中央、西淀川、淀川、東淀川、東成、生野、旭、城東、鶴見、住之江、住吉、東住吉、平野、消防局)\n\nー\n\n招集なし"
            }
            break
        //波浪警報
        case 26:
            //勤務消防署がリストに該当するか判定　あえて大津波・津波警報時参集指定署ではないことに注意！
            let gaitousyo = Set(arrayLiteral: "此花", "港", "大正", "西淀川", "住之江", "水上", "消防局")
            //mainStationではすでに「消防署」の文字列を付け足してしまっているので上記リストとの比較はuserDefaultの格納値を使う
            if gaitousyo.contains(userDefaults.stringForKey("mainStation")!){
                text1.text="■波浪警報\n\n第５非常警備(此花、港、大正、西淀川、住之江、水上、消防局)\n\n\(mainStation)\n\n招集なし"
            } else {
                text1.text="■洪水警報\n\n第５非常警備(此花、港、大正、西淀川、住之江、水上、消防局)\n\nー\n\n招集なし"
            }
            break
        //高潮警報
        case 27:
            //勤務消防署がリストに該当するか判定　あえて大津波・津波警報時参集指定署ではないことに注意！
            let gaitousyo = Set(arrayLiteral: "北", "都島", "福島", "此花", "中央", "西", "港", "大正", "浪速", "西淀川", "淀川", "住之江", "西成", "水上", "消防局")
            //mainStationではすでに「消防署」の文字列を付け足してしまっているので上記リストとの比較はuserDefaultの格納値を使う
            if gaitousyo.contains(userDefaults.stringForKey("mainStation")!){
                text1.text="■高潮警報\n\n第５非常警備(北、都島、福島、此花、中央、西、港、大正、浪速、西淀川、淀川、住之江、西成、水上、消防局)\n\n\(mainStation)\n\n招集なし"
            } else {
                text1.text="■高潮警報\n\n第５非常警備(北、都島、福島、此花、中央、西、港、大正、浪速、西淀川、淀川、住之江、西成、水上、消防局)\n\nー\n\n招集なし"
            }
            break
        //高潮注意報
        case 28:
            //勤務消防署がリストに該当するか判定　あえて大津波・津波警報時参集指定署ではないことに注意！
            let gaitousyo = Set(arrayLiteral: "北", "都島", "福島", "此花", "中央", "西", "港", "大正", "浪速", "西淀川", "淀川", "住之江", "西成", "水上", "消防局")
            //mainStationではすでに「消防署」の文字列を付け足してしまっているので上記リストとの比較はuserDefaultの格納値を使う
            if gaitousyo.contains(userDefaults.stringForKey("mainStation")!){
                text1.text="■高潮注意報\n\n第５非常警備(北、都島、福島、此花、中央、西、港、大正、浪速、西淀川、淀川、住之江、西成、水上、消防局)\n\n\(mainStation)\n\n招集なし"
            } else {
                text1.text="■高潮注意報\n\n第５非常警備(北、都島、福島、此花、中央、西、港、大正、浪速、西淀川、淀川、住之江、西成、水上、消防局)\n\nー\n\n招集なし"
            }
            break
        //
        case 31:
            text1.text="■大津波警報\n\n１号招集\n\n\(tsunamiStation)へ参集"
            break
        case 32:
            //３号招集なので、１号、２号は参集なしの判定する
            if kubun == "１号招集" || kubun == "２号招集" {
                text1.text="■津波警報\n\n３号招集(非番・日勤)\n\n招集なし"
            } else {
                text1.text="■津波警報\n\n３号招集(非番・日勤)\n\n\(tsunamiStation)へ参集\n\n※平日の9時～17時30分は、原則、勤務中の毎日勤務者で活動体制を確保する"
            }
            break
        case 33:
            //３号招集なので、１号、２号は参集なしの判定する
            if kubun == "１号招集" || kubun == "２号招集" {
                text1.text="■警報なし\n\n３号招集(非番・日勤)\n\n招集なし"
            } else {
                text1.text="■警報なし\n\n３号招集(非番・日勤)\n\n\(mainStation)へ参集\n\n※平日の9時～17時30分は、原則、勤務中の毎日勤務者で活動体制を確保する"
            }
            break
        //
        case 41:
            text1.text="■大津波警報\n\n１号招集\n\n\(tsunamiStation)へ参集"
            break
        case 42:
            //３号招集なので、１号、２号は参集なしの判定する
            if kubun == "１号招集" || kubun == "２号招集" {
                text1.text="■津波警報\n\n３号招集(非番・日勤)\n\n招集なし"
            } else {
                text1.text="■津波警報\n\n３号招集(非番・日勤)\n\n\(tsunamiStation)へ参集\n\n※平日の9時～17時30分は、原則、勤務中の毎日勤務者で活動体制を確保する"
            }
            break
        case 43:
            //勤務消防署がリストに該当するか判定　あえて大津波・津波警報時参集指定署ではないことに注意！
            let gaitousyo = Set(arrayLiteral: "此花消防署","港消防署","大正消防署","西淀川消防署","住之江消防署","西成消防署","水上消防署","消防局")
            if gaitousyo.contains(mainStation){
                text1.text="■津波注意報\n\n第５非常警備(此花,港,大正,西淀川,住之江,西成,水上,消防局)\n\n\(mainStation)"
            } else {
                text1.text="■津波注意報\n\n第５非常警備(此花,港,大正,西淀川,住之江,西成,水上,消防局)\n\n招集なし"
            }
            break
        case 44:
            text1.text="■警報なし\n\n招集なし"
            break
        //
        case 51:
            //３号招集なので、１号、２号は参集なしの判定する
            if kubun == "１号招集" || kubun == "２号招集" {
                text1.text="■警戒宣言が発令されたとき（東海地震予知情報）\n\n３号招集(非番・日勤)\n\n招集なし"
            } else {
                text1.text="■警戒宣言が発令されたとき（東海地震予知情報）\n\n３号招集(非番・日勤)\n\n\(mainStation)へ参集\n\n※平日の9時～17時30分は、原則、勤務中の毎日勤務者で活動体制を確保する"
            }
            break
        case 52:
            //４号招集なので、１号、２号、３号は参集なしの判定する
            if kubun == "４号招集" {
                text1.text="■東海地震注意報が発表されたとき\n\n４号招集(非番・日勤)\n\n\(mainStation)へ参集\n\n※平日の9時～17時30分は、原則、勤務中の毎日勤務者で活動体制を確保する"
            } else {
                text1.text="■東海地震注意報が発表されたとき\n\n４号招集(非番・日勤)\n\n招集なし"
            }
            break
        case 53:
            text1.text="■東海地震に関連する調査情報（臨時）が発表されたとき\n\n第５非常警備(全署、消防局)\n\n\(mainStation)\n\n招集なし"
            break
            
        default:
            text1.text=""
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
