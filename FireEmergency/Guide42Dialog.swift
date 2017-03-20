//
//  Guide42Dialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/20.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide42Dialog {
    //ボタン押したら出るUIWindow
    private var parent: UIViewController!
    private var win1: UIWindow!
    private var scroll: UIScrollView!
    private var text0: UITextView!
    private var image1: UIImageView!
    private var text1: UITextView!
    private var image2: UIImageView!
    private var image3: UIImageView!
    private var image4: UIImageView!
    private var text2: UITextView!
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
        image3 = UIImageView()
        image4 = UIImageView()
        text2 = UITextView()
        btnClose = UIButton()
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        scroll = nil
        text0 = nil
        image1 = nil
        text1 = nil
        image2 = nil
        image3 = nil
        image4 = nil
        text2 = nil
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
        scroll.contentSize = CGSizeMake(300,1200)
        self.win1.addSubview(scroll)
        
        //TextView0生成
        text0.frame = CGRectMake(0,0, 300, 30)
        text0.backgroundColor = UIColor.clearColor()
        text0.font = UIFont.systemFontOfSize(CGFloat(16))
        text0.textColor = UIColor.blackColor()
        text0.textAlignment = NSTextAlignment.Left
        text0.editable = false
        text0.scrollEnabled = true
        text0.text="４　非常招集基準確認(風水害)"
        scroll.addSubview(text0)
        
        //image1生成
        let img1 = UIImage(named: "guide421.png")
        image1.image = img1
        image1.frame = CGRectMake((parent.view.frame.width-320)/2, 40, 300, 170)
        scroll.addSubview(image1)
        
        //TextView1生成
        text1.frame = CGRectMake(0,230, parent.view.frame.width-20, 151)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(16))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        text1.scrollEnabled = true
        text1.text="各事象操作画面の中央に非常招集基準確認ボタンがあります。\n①非常警備の基準が確認できます。\n②気象警報の発表に伴い参集の可否が確認できます。\n③河川水位上昇に伴い参集の可否が確認できます。"
        scroll.addSubview(text1)
        
        //image2生成
        let img2 = UIImage(named: "guide422.png")
        image2.image = img2
        image2.frame = CGRectMake((parent.view.frame.width-320)/2, 398, 300, 141)
        scroll.addSubview(image2)
        
        //image3生成
        let img3 = UIImage(named: "guide423.png")
        image3.image = img3
        image3.frame = CGRectMake((parent.view.frame.width-320)/2, 570, 300, 188)
        scroll.addSubview(image3)
        
        //image4生成
        let img4 = UIImage(named: "guide424.png")
        image4.image = img4
        image4.frame = CGRectMake((parent.view.frame.width-320)/2, 778, 300, 262)
        scroll.addSubview(image4)

        
        //TextView2生成
        text2.frame = CGRectMake(0,1062, parent.view.frame.width-20, 100)
        text2.backgroundColor = UIColor.clearColor()
        text2.font = UIFont.systemFontOfSize(CGFloat(16))
        text2.textColor = UIColor.blackColor()
        text2.textAlignment = NSTextAlignment.Left
        text2.editable = false
        text2.scrollEnabled = true
        text2.text="参集の可否、参集場所を確認することができます。\nまた、該当署ボタンをタップすれば、非常警備該当署が確認できます。"
        scroll.addSubview(text2)
        
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
