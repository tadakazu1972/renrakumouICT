//
//  TyphoonResultDialog2.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/12/14.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class TyphoonResultDialog2 {
    //ボタン押したら出るUIWindow
    private var parent: TyphoonViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var text2: UITextView!
    private var btnClose: UIButton!
    private var btnBack: UIButton!
    private var btnGaitousyo: UIButton!
    //データ保存用
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var mainStation: String!
    var tsunamiStation: String!
    var kubun: String!
    //戻るTyphoonSelectDialog2用
    var backIndex: Int!
    private var mTyphoonSelectDialog2: TyphoonSelectDialog2!
    
    //コンストラクタ
    init(index: Int, parentView: TyphoonViewController){
        parent = parentView
        win1 = UIWindow()
        text1 = UITextView()
        text2 = UITextView()
        btnClose = UIButton()
        btnBack  = UIButton()
        btnGaitousyo = UIButton()
        backIndex = index
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        text1 = nil
        text2 = nil
        btnClose = nil
        btnBack  = nil
        btnGaitousyo = nil
        backIndex = nil
    }
    
    //表示
    func showResult(data :Int){
        //勤務消防署が保存されている場合は呼び出して格納
        if let _mainStation = userDefaults.stringForKey("mainStation"){
            if _mainStation == "消防局" || _mainStation == "教育訓練センター" {
                mainStation = _mainStation
            } else {
                mainStation = _mainStation + "消防署"
            }
        }
        //大津波・津波警報時参集指定署が保存されている場合は呼び出して格納
        if let _tsunamiStation = userDefaults.stringForKey("tsunamiStation"){
            if _tsunamiStation == "消防局" || _tsunamiStation == "教育訓練センター" {
                tsunamiStation = _tsunamiStation
            } else {
                tsunamiStation = _tsunamiStation + "消防署"
            }
        }
        //非常招集区分を呼び出して格納
        if let _kubun = userDefaults.stringForKey("kubun"){
            kubun = _kubun
        }
        //元の画面を暗く
        parent.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.whiteColor()
        win1.frame = CGRectMake(80,10,parent.view.frame.width-40,parent.view.frame.height/2+180)
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
        
        //該当署を表示するTextView生成
        text2.frame = CGRectMake(100,self.win1.frame.height/2+34, self.win1.frame.width/1.7, self.win1.frame.height/2+160)
        text2.backgroundColor = UIColor.clearColor()
        text2.font = UIFont.systemFontOfSize(CGFloat(12))
        text2.textColor = UIColor.blackColor()
        text2.textAlignment = NSTextAlignment.Left
        text2.editable = false
        text2.scrollEnabled = true
        text2.dataDetectorTypes = .Link
        text2.hidden = true //該当署ボタンを押すまで隠しておく
        
        //テキストの内容を場合分け
        switch data {
        //淀川（枚方）
        //氾濫注意水位、水防警報(出動)
        case 11:
            //勤務消防署がリストに該当するか判定　あえて大津波・津波警報時参集指定署ではないことに注意！
            let title:String! = "■淀川（枚方） 氾濫注意水位(水位4.5m)、水防警報(出動)\n\n"
            let gaitousyo = Set(arrayLiteral: "北", "都島", "福島", "此花", "西淀川", "淀川", "東淀川", "旭", "消防局")
            text2.text = "北,都島,福島,此花,西淀川,淀川,東淀川,旭,消防局"
            var message:String! = ""
            //mainStationではすでに「消防署」の文字列を付け足してしまっているので上記リストとの比較はuserDefaultの格納値を使う
            if gaitousyo.contains(userDefaults.stringForKey("mainStation")!){
                message = "\(mainStation)\n\n招集なし"
            } else {
                message = "ー\n\n招集なし"
            }
            text1.text = title + "第５非常警備(北,都島,福島,此花,西淀川,淀川,東淀川,旭,消防局)\n\n" + message
            break
        //避難準備情報発令の見込み
        case 12:
            let title:String! = "■淀川（枚方） 避難準備情報発令の見込み(1時間以内に水位5.4mに到達)\n\n"
            let hosoku:String! = "※平日の9時～17時30分は、原則、勤務中の毎日勤務者で活動体制を確保する"
            let gaitousyo = Set(arrayLiteral: "北", "都島", "福島", "此花", "西淀川", "淀川", "東淀川", "旭", "消防局")
            text2.text = "北,都島,福島,此花,西淀川,淀川,東淀川,旭,消防局"
            var message:String! = ""
            //mainStationではすでに「消防署」の文字列を付け足してしまっているので上記リストとの比較はuserDefaultの格納値を使う
            if gaitousyo.contains(userDefaults.stringForKey("mainStation")!){
                //４号招集なので、１号、２号、３号は参集なしの判定する
                if kubun == "４号招集" {
                    if mainStation == "消防局" {
                        message = "\(mainStation)へ参集(所属担当者に確認すること)\n\n" + hosoku
                    } else {
                        message = "\(mainStation)へ参集\n\n" + hosoku
                    }
                } else {
                    message = "ー\n\n招集なし"
                }
            } else {
                message = "ー\n\n招集なし"
            }
            text1.text = title + "４号招集(非番・日勤)\n\n" + message
            break
        //避難準備情報
        case 13:
            let title:String! = "■淀川（枚方） 避難準備情報(水位5.4m)\n\n"
            let hosoku:String! = "※平日の9時～17時30分は、原則、勤務中の毎日勤務者で活動体制を確保する"
            let gaitousyo1 = Set(arrayLiteral: "北", "都島", "福島", "此花", "西淀川", "淀川", "東淀川", "旭", "消防局")
            let gaitousyo2 = Set(arrayLiteral: "中央", "西", "浪速", "東成", "生野", "城東", "鶴見", "西成")
            text2.text="流域署3号:北,都島,福島,此花,西淀川,淀川,東淀川,旭,消防局\n流域周辺署4号:中央,西,浪速,東成,生野,城東,鶴見,西成"
            var message:String! = ""
            //mainStationではすでに「消防署」の文字列を付け足してしまっているので上記リストとの比較はuserDefaultの格納値を使う
            if gaitousyo1.contains(userDefaults.stringForKey("mainStation")!){
                //３号招集なので、１号、２号は参集なしの判定する
                if kubun == "１号招集" || kubun == "２号招集" {
                    message = "３号招集(非番・日勤)\n\n招集なし"
                } else {
                    if mainStation == "消防局" {
                        message = "３号招集(非番・日勤)\n\n\(mainStation)へ参集(所属担当者に確認すること)\n\n" + hosoku
                    } else {
                        message = "３号招集(非番・日勤)\n\n\(mainStation)へ参集\n\n" + hosoku
                    }
                }
            } else if gaitousyo2.contains(userDefaults.stringForKey("mainStation")!){
                //４号招集なので、１号、２号、３号は参集なしの判定する
                if kubun == "４号招集" {
                    if mainStation == "消防局" {
                        message = "４号招集(非番・日勤)\n\n\(mainStation)へ参集(所属担当者に確認すること)\n\n" + hosoku
                    } else {
                        message = "４号招集(非番・日勤)\n\n\(mainStation)へ参集\n\n" + hosoku
                    }
                } else {
                    message = "４号招集(非番・日勤)\n\nー\n\n招集なし"
                }
            } else {
                message = "４号招集(非番・日勤)\n\nー\n\n招集なし"
            }
            text1.text = title + message
            break
        //避難勧告
        case 14:
            let title:String! = "■淀川（枚方） 避難勧告(水位5.5m)\n\n"
            let hosoku:String! = "※平日の9時～17時30分は、原則、勤務中の毎日勤務者で活動体制を確保する"
            let gaitousyo1 = Set(arrayLiteral: "北", "都島", "福島", "此花", "西淀川", "淀川", "東淀川", "旭", "消防局")
            let gaitousyo2 = Set(arrayLiteral: "中央", "西", "浪速", "東成", "生野", "城東", "鶴見", "西成")
            let gaitousyo3 = Set(arrayLiteral: "港", "大正", "天王寺", "阿倍野", "住之江", "住吉", "東住吉", "平野", "水上")
            text2.text="流域署2号:北,都島,福島,此花,西淀川,淀川,東淀川,旭,消防局\n流域周辺署3号:中央,西,浪速,東成,生野,城東,鶴見,西成\nその他の署４号：港,大正,天王寺,阿倍野,住之江,住吉,東住吉,平野,水上"
            var message:String! = ""
            if gaitousyo1.contains(userDefaults.stringForKey("mainStation")!){
                //２号招集なので、１号は参集なしの判定する
                if kubun == "１号招集" {
                    message = "２号招集(非番・日勤)\n\n招集なし"
                } else {
                    if mainStation == "消防局" {
                        message = "２号招集(非番・日勤)\n\n\(mainStation)へ参集(所属担当者に確認すること)\n\n" + hosoku
                    } else {
                        message = "２号招集(非番・日勤)\n\n\(mainStation)へ参集\n\n" + hosoku
                    }
                }
            } else if gaitousyo2.contains(userDefaults.stringForKey("mainStation")!){
                //３号招集なので、１号、２号は参集なしの判定する
                if kubun == "１号招集" || kubun == "２号招集" {
                    message = "３号招集(非番・日勤)\n\n招集なし"
                } else {
                    if mainStation == "消防局" {
                        message = "３号招集(非番・日勤)\n\n\(mainStation)へ参集(所属担当者に確認すること)\n\n" + hosoku
                    } else {
                        message = "３号招集(非番・日勤)\n\n\(mainStation)へ参集\n\n" + hosoku
                    }
                }
            } else if gaitousyo3.contains(userDefaults.stringForKey("mainStation")!){
                //４号招集なので、１号、２号、３号は参集なしの判定する
                if kubun == "４号招集" {
                    if mainStation == "消防局" {
                        message = "４号招集(非番・日勤)\n\n\(mainStation)へ参集(所属担当者に確認すること)\n\n" + hosoku
                    } else {
                        message = "４号招集(非番・日勤)\n\n\(mainStation)へ参集\n\n" + hosoku
                    }
                } else {
                    message = "４号招集(非番・日勤)\n\nー\n\n招集なし"
                }
            } else {
                message = "４号招集(非番・日勤)\n\nー\n\n招集なし"
            }
            text1.text = title + message
            break
        //避難指示
        case 15:
            let title:String! = "■淀川（枚方） 避難指示(水位8.3m)\n\n"
            let hosoku:String! = "※平日の9時～17時30分は、原則、勤務中の毎日勤務者で活動体制を確保する"
            text2.text="２号:全署"
            var message:String! = ""
            //２号招集なので、１号は参集なしの判定する
            if kubun == "１号招集" {
                message = "２号招集(非番・日勤)\n\n招集なし"
            } else {
                if mainStation == "消防局" || mainStation == "教育訓練センター" {
                    message = "２号招集(非番・日勤)\n\n\(mainStation)へ参集(所属担当者に確認すること)\n\n" + hosoku
                } else {
                    message = "２号招集(非番・日勤)\n\n\(mainStation)へ参集\n\n" + hosoku
                }
            }
            text1.text = title + message
            break
            
        default:
            text1.text=""
        }
        
        self.win1.addSubview(text1)
        self.win1.addSubview(text2)
        
        //閉じるボタン生成
        btnClose.frame = CGRectMake(0,0,100,30)
        btnClose.backgroundColor = UIColor.orangeColor()
        btnClose.setTitle("閉じる", forState: .Normal)
        btnClose.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnClose.layer.masksToBounds = true
        btnClose.layer.cornerRadius = 10.0
        btnClose.layer.position = CGPointMake(self.win1.frame.width/2-60, self.win1.frame.height-20)
        btnClose.addTarget(self, action: #selector(self.onClickClose(_:)), forControlEvents: .TouchUpInside)
        self.win1.addSubview(btnClose)
        
        //戻るボタン生成
        btnBack.frame = CGRectMake(0,0,100,30)
        btnBack.backgroundColor = UIColor.blueColor()
        btnBack.setTitle("戻る", forState: .Normal)
        btnBack.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnBack.layer.masksToBounds = true
        btnBack.layer.cornerRadius = 10.0
        btnBack.layer.position = CGPointMake(self.win1.frame.width/2+60, self.win1.frame.height-20)
        btnBack.addTarget(self, action: #selector(self.onClickBack(_:)), forControlEvents: .TouchUpInside)
        self.win1.addSubview(btnBack)
        
        //該当署ボタン生成
        btnGaitousyo.frame = CGRectMake(0,0,80,30)
        btnGaitousyo.backgroundColor = UIColor.grayColor()
        btnGaitousyo.setTitle("該当署", forState: .Normal)
        btnGaitousyo.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btnGaitousyo.layer.masksToBounds = true
        btnGaitousyo.layer.cornerRadius = 0.0
        btnGaitousyo.layer.position = CGPointMake(56, self.win1.frame.height/2+60)
        btnGaitousyo.addTarget(self, action: #selector(self.onClickGaitousyo(_:)), forControlEvents: .TouchUpInside)
        self.win1.addSubview(btnGaitousyo)
    }
    
    //該当署ボタン
    @objc func onClickGaitousyo(sender: UIButton){
        if (text2.hidden) {
            text2.hidden = false
        } else {
            text2.hidden = true
        }
    }
    
    //閉じる
    @objc func onClickClose(sender: UIButton){
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
    }
    
    //戻る
    @objc func onClickBack(sender: UIButton){
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
        //
        switch backIndex {
        case 1:
            //淀川の水位選択に戻る
            mTyphoonSelectDialog2 = TyphoonSelectDialog2(index:1, parentView: parent)
            mTyphoonSelectDialog2.showInfo()
            break
        case 2:
            mTyphoonSelectDialog2 = TyphoonSelectDialog2(index:2, parentView: parent)
            mTyphoonSelectDialog2.showInfo()
            break
        default:
            break
        }
    }
}