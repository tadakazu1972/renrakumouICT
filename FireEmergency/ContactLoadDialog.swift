//
//  ContactLoadDialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/21.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class ContactLoadDialog {
    //ボタン押したら出るUIWindow
    private var parent: ContactViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var btnClose: UIButton!
    //データ保存用
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var mainStation: String!
    var tsunamiStation: String!
    var kubun: String!
    
    //コンストラクタ
    init(parentView: ContactViewController){
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
    func showResult(){
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
        
        text1.text=""
        let file_name = "fire.csv"
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first {
            
            let path_file_name = dir.stringByAppendingPathComponent( file_name )
            
            do {
                
                let text = try NSString( contentsOfFile: path_file_name, encoding: NSUTF8StringEncoding )
                text1.text = text as String
                
            } catch {
                //エラー処理
                text1.text = "エラー"
            }
        }
        
            //csvファイル読込
            /*var result: [[String]] = []
            if let path = NSHomeDirectory() + "/Documents/Inbox/" {
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
            }*/
        
        //text1.text=""
        
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
