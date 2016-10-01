//
//  InfoDialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/10/01.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import Foundation
import UIKit

class InfoDialog {
    //ボタン押したら出るUIWindow
    private var parent: UIViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var btnClose: UIButton!
    
    //コンストラクタ
    init(parentView: UIViewController){
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
    func showInfo(data :String){
        //元の画面を暗く
        parent.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.whiteColor()
        win1.frame = CGRectMake(80,80,parent.view.frame.width-40,parent.view.frame.height-200)
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
            case "earthquake":
                text1.text="URLをタップしてください\n\n■震度情報（気象庁）\n\nhttp://www.jma.go.jp/jp/quake/"
                break
            case "road":
                text1.text="URLをタップしてください\n\n■道路情報\n\n・トヨタ通れた道マップ\n\nhttps://www.toyota.co.jp/jpn/auto/passable_route/map/\n\n・日本道路交通情報センター\n\nhttp://www.jartic.or.jp/index.html"
                break
            case "caution":
                //テキストファイル読込
                let path = NSBundle.mainBundle().pathForResource("caution", ofType: "txt")!
                if let data = NSData(contentsOfFile: path){
                    if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                        text1.text = String(NSString(data: data, encoding: NSUTF8StringEncoding)!)
                    }
                } else {
                    text1.text = "ファイル読込エラー"
            }

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
