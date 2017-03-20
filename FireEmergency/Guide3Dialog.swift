//
//  Guide3Dialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/11.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide3Dialog {
    //ボタン押したら出るUIWindow
    private var parent: UIViewController!
    private var win1: UIWindow!
    private var scroll: UIScrollView!
    private var text0: UITextView!
    private var image1: UIImageView!
    private var text1: UITextView!
    private var image2: UIImageView!
    private var btnClose: UIButton!
    
    //コンストラクタ
    init(parentView: UIViewController){
        parent = parentView
        win1 = UIWindow()
        scroll = UIScrollView()
        text0 = UITextView()
        image1 = UIImageView()
        text1 = UITextView()
        image2 = UIImageView()
        btnClose = UIButton()
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        scroll = nil
        text0 = nil
        image1 = nil
        image2 = nil
        text1 = nil
        btnClose = nil
    }
    
    //表示
    func showInfo(){
        //元の画面を暗く
        parent.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.whiteColor()
        win1.frame = CGRectMake(80,80,parent.view.frame.width-20,parent.view.frame.height-50)
        win1.layer.position = CGPointMake(parent.view.frame.width/2, parent.view.frame.height/2)
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKeyWindow()
        //表示
        self.win1.makeKeyAndVisible()
        
        //scroll生成
        scroll.frame = CGRectMake(0,0,parent.view.frame.width-20,parent.view.frame.height-50)
        scroll.contentSize = CGSizeMake(300,500)
        self.win1.addSubview(scroll)
        
        //TextView0生成
        text0.frame = CGRectMake(0,0, 300, 30)
        text0.backgroundColor = UIColor.clearColor()
        text0.font = UIFont.systemFontOfSize(CGFloat(16))
        text0.textColor = UIColor.blackColor()
        text0.textAlignment = NSTextAlignment.Left
        text0.editable = false
        text0.scrollEnabled = true
        text0.text="３　各事象操作画面切り替え"
        scroll.addSubview(text0)
        
        //image1生成
        let img1 = UIImage(named: "guide31.png")
        image1.image = img1
        image1.frame = CGRectMake((parent.view.frame.width-320)/2, 40, 300, 113)
        scroll.addSubview(image1)
        
        //image2生成
        let img2 = UIImage(named: "guide32.png")
        image2.image = img2
        image2.frame = CGRectMake((parent.view.frame.width-320)/2, 168, 300, 113)
        scroll.addSubview(image2)
        
        //TextView1生成
        text1.frame = CGRectMake(0,280, parent.view.frame.width-20, 190)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(16))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        text1.scrollEnabled = true
        text1.text="各事象操作画面の上部、基礎データ入力画面の上部に切り替えボタンがあります。\n\n各ボタンをタップすることにより震災、風水害、国民保護、緊援隊の事象操作画面に切り替えることができます。"
        scroll.addSubview(text1)
        
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
