//
//  KinentaiNankaitraf2.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/18.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class KinentaiNankaitraf2 {
    //ボタン押したら出るUIWindow
    private var parent: KinentaiViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var btnClose: UIButton!
    private var btnAction: UIButton!
    private var mKinentaiResultDialog: KinentaiResultDialog!
    
    //コンストラクタ
    init(parentView: KinentaiViewController){
        parent = parentView
        win1 = UIWindow()
        text1 = UITextView()
        btnClose = UIButton()
        btnAction  = UIButton()
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        text1 = nil
        btnClose = nil
        btnAction  = nil
    }
    
    //表示
    func showResult(){
        //元の画面を暗く
        parent.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.whiteColor()
        win1.frame = CGRectMake(80,10,parent.view.frame.width-40,parent.view.frame.height/2+130)
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
        
        //テキストファイル読込
        let path = NSBundle.mainBundle().pathForResource("nankaitraf_case2", ofType: "txt")!
        if let data = NSData(contentsOfFile: path){
            if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                text1.text = String(NSString(data: data, encoding: NSUTF8StringEncoding)!)
            }
        } else {
            text1.text = "ファイル読込エラー"
        }
        
        self.win1.addSubview(text1)
        
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
        
        //対応ボタン生成
        btnAction.frame = CGRectMake(0,0,100,30)
        btnAction.backgroundColor = UIColor.redColor()
        btnAction.setTitle("対応", forState: .Normal)
        btnAction.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnAction.layer.masksToBounds = true
        btnAction.layer.cornerRadius = 10.0
        btnAction.layer.position = CGPointMake(self.win1.frame.width/2+60, self.win1.frame.height-20)
        btnAction.addTarget(self, action: #selector(self.onClickAction(_:)), forControlEvents: .TouchUpInside)
        self.win1.addSubview(btnAction)
    }
    
    //閉じる
    @objc func onClickClose(sender: UIButton){
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
    }
    
    //対応
    @objc func onClickAction(sender: UIButton){
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
        //対応の結果であるアクションプランを表示
        mKinentaiResultDialog = KinentaiResultDialog(parentView: parent)
        mKinentaiResultDialog.showResult(34, item: 0)
    }
}
