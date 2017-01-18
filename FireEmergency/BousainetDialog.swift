//
//  BousainetDialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/18.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class BousainetDialog {
    //ボタン押したら出るUIWindow
    private var parent: UIViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var text2: UITextView!
    private var btnClose: UIButton!
    private var btnApp: UIButton!
    private var mTyphoonSelectDialog2: TyphoonSelectDialog2!
    
    //コンストラクタ
    init(parentView: UIViewController){
        parent = parentView
        win1 = UIWindow()
        text1 = UITextView()
        text2 = UITextView()
        btnClose = UIButton()
        btnApp = UIButton()
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        text1 = nil
        text2 = nil
        btnClose = nil
        btnApp = nil
    }
    
    //表示
    func showInfo(){
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
        
        text1.text="URLをタップしてください\n\n■おおさか防災ネット\n\nhttp://www.osaka-bousai.net/pref/index.html\n\n■大阪市防災アプリ"
        self.win1.addSubview(text1)
        
        //iOS版「大阪市防災アプリ」のAppStoreを表示するTextView生成
        text2.frame = CGRectMake(60,self.win1.frame.height/2+34, self.win1.frame.width/1.7, self.win1.frame.height/2+160)
        text2.backgroundColor = UIColor.clearColor()
        text2.font = UIFont.systemFontOfSize(CGFloat(12))
        text2.textColor = UIColor.blackColor()
        text2.textAlignment = NSTextAlignment.Left
        text2.editable = false
        text2.scrollEnabled = true
        text2.dataDetectorTypes = .Link
        text2.hidden = true //該当署ボタンを押すまで隠しておく
        
        text2.text="現在はこのボタンから起動できませんので、AppStoreから起動するか、まだ入手していなければ入手してください。\n\nhttps://itunes.apple.com/app/id1092387835"
        
        self.win1.addSubview(text2)
        
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
        
        //大阪市防災アプリボタン生成
        btnApp.frame = CGRectMake(0,0,160,30)
        btnApp.backgroundColor = UIColor.lightGrayColor()
        btnApp.setTitle("大阪市防災アプリ", forState: .Normal)
        btnApp.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btnApp.layer.masksToBounds = true
        btnApp.layer.cornerRadius = 0.0
        btnApp.layer.position = CGPointMake(self.win1.frame.width/2, self.win1.frame.height/2)
        btnApp.addTarget(self, action: #selector(self.onClickApp(_:)), forControlEvents: .TouchUpInside)
        self.win1.addSubview(btnApp)
    }
    
    //大阪市防災アプリボタン
    @objc func onClickApp(sender: UIButton){
        //大阪市防災アプリ iOS版にはURLスキームが設定されていないので、AppStoreを一度経由して、インストールしていたら開く、してなかったら入手
        let url1 = NSURL(string: "jp.goo.bousai.osakaapp://")!
        let url2 = NSURL(string: "https://itunes.apple.com/app/id1092387835")
        if (UIApplication.sharedApplication().canOpenURL(url1)) {
            UIApplication.sharedApplication().openURL(url1)
        } else {
            UIApplication.sharedApplication().openURL(url2!)
        }
        
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
}
