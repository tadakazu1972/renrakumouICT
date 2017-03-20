//
//  Guide44Dialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/20.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide44Dialog {
    //ボタン押したら出るUIWindow
    private var parent: UIViewController!
    private var win1: UIWindow!
    private var scroll: UIScrollView!
    private var text0: UITextView!
    private var image1: UIImageView!
    private var text1: UITextView!
    private var image2: UIImageView!
    private var text2: UITextView!
    private var image3: UIImageView!
    private var text3: UITextView!
    private var image4: UIImageView!
    private var text4: UITextView!
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
        text2 = UITextView()
        image3 = UIImageView()
        text3 = UITextView()
        image4 = UIImageView()
        text4 = UITextView()
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
        text2 = nil
        image3 = nil
        text3 = nil
        image4 = nil
        text4 = nil
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
        scroll.contentSize = CGSizeMake(300,1900)
        self.win1.addSubview(scroll)
        
        //TextView0生成
        text0.frame = CGRectMake(0,0, 300, 30)
        text0.backgroundColor = UIColor.clearColor()
        text0.font = UIFont.systemFontOfSize(CGFloat(16))
        text0.textColor = UIColor.blackColor()
        text0.textAlignment = NSTextAlignment.Left
        text0.editable = false
        text0.scrollEnabled = true
        text0.text="４　非常招集基準確認(緊援隊)"
        scroll.addSubview(text0)
        
        //image1生成
        let img1 = UIImage(named: "guide441.png")
        image1.image = img1
        image1.frame = CGRectMake((parent.view.frame.width-320)/2, 40, 300, 270)
        scroll.addSubview(image1)
        
        //TextView1生成
        text1.frame = CGRectMake(0,330, parent.view.frame.width-20, 284)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(16))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        text1.scrollEnabled = true
        text1.text="上のボタンで緊急消防援助隊大阪府大隊の出場を確認することができます。\n地震については[地震(震央「陸」)][地震(震央「海域」)][アクションプラン]ボタンで確認することができます。\nその他[大津波・噴火][特殊災害(NBC含む)]の出場基準を確認することができます。\n\nまず、「和歌山県で震度６強、震央は陸」の地震が発生した場合の大阪府大隊の出場の可否について確認します。\n震央が「陸」なので[地震(震央)「陸」]ボタンをタップします。"
        scroll.addSubview(text1)
        
        //image2生成
        let img2 = UIImage(named: "guide442.png")
        image2.image = img2
        image2.frame = CGRectMake((parent.view.frame.width-320)/2, 630, 300, 197)
        scroll.addSubview(image2)
        
        //TextView2生成
        text2.frame = CGRectMake(0,850, parent.view.frame.width-20, 80)
        text2.backgroundColor = UIColor.clearColor()
        text2.font = UIFont.systemFontOfSize(CGFloat(16))
        text2.textColor = UIColor.blackColor()
        text2.textAlignment = NSTextAlignment.Left
        text2.editable = false
        text2.scrollEnabled = true
        text2.text="次に、「震度６強」(特別区６弱)をタップします。"
        scroll.addSubview(text2)
        
        //image3生成
        let img3 = UIImage(named: "guide443.png")
        image3.image = img3
        image3.frame = CGRectMake((parent.view.frame.width-320)/2, 950, 300, 267)
        scroll.addSubview(image3)
        
        //TextView3生成
        text3.frame = CGRectMake(0,1237, parent.view.frame.width-20, 80)
        text3.backgroundColor = UIColor.clearColor()
        text3.font = UIFont.systemFontOfSize(CGFloat(16))
        text3.textColor = UIColor.blackColor()
        text3.textAlignment = NSTextAlignment.Left
        text3.editable = false
        text3.scrollEnabled = true
        text3.text="次に、震央都道府県の「和歌山県」をタップします。"
        scroll.addSubview(text3)
        
        //image4生成
        let img4 = UIImage(named: "guide444.png")
        image4.image = img4
        image4.frame = CGRectMake((parent.view.frame.width-320)/2, 1337, 300,363)
        scroll.addSubview(image4)
        
        //TextView4生成
        text4.frame = CGRectMake(0, 1720, parent.view.frame.width-20, 80)
        text4.backgroundColor = UIColor.clearColor()
        text4.font = UIFont.systemFontOfSize(CGFloat(16))
        text4.textColor = UIColor.blackColor()
        text4.textAlignment = NSTextAlignment.Left
        text4.editable = false
        text4.scrollEnabled = true
        text4.text="和歌山県への応援出動結果が表示されます。"
        scroll.addSubview(text4)
        
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
