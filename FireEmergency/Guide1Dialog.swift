//
//  Guide1Dialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/05.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide1Dialog {
    //ボタン押したら出るUIWindow
    private var parent: UIViewController!
    private var win1: UIWindow!
    private var scroll: UIScrollView!
    private var text0: UITextView!
    private var image1: UIImageView!
    private var text1: UITextView!
    private var image2: UIImageView!
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
        image2 = nil
        text1 = nil
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
        scroll.contentSize = CGSizeMake(300,1000)
        self.win1.addSubview(scroll)
        
        //TextView0生成
        text0.frame = CGRectMake(0,0, 300, 30)
        text0.backgroundColor = UIColor.clearColor()
        text0.font = UIFont.systemFontOfSize(CGFloat(16))
        text0.textColor = UIColor.blackColor()
        text0.textAlignment = NSTextAlignment.Left
        text0.editable = false
        text0.scrollEnabled = true
        text0.text="１　基礎データ入力"
        scroll.addSubview(text0)
        
        //image1生成
        let img1 = UIImage(named: "guide11.png")
        image1.image = img1
        image1.frame = CGRectMake((parent.view.frame.width-320)/2, 40, 300, 86)
        scroll.addSubview(image1)
        
        //TextView1生成
        text1.frame = CGRectMake(0,136, parent.view.frame.width-20, 190)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(16))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        text1.scrollEnabled = true
        text1.text="アプリをインストールしたら、まずは起動し、基礎データを入力します。\n\n基礎データ入力ボタンは「震災、風水害、国民保、緊援隊」画面の上部にあります。"
        scroll.addSubview(text1)
        
        //image2生成
        let img2 = UIImage(named: "guide12.png")
        image2.image = img2
        image2.frame = CGRectMake((parent.view.frame.width-320)/2, 280, 300, 426)
        scroll.addSubview(image2)
        
        //TextView2生成
        text2.frame = CGRectMake(0, 720, parent.view.frame.width-20, 240)
        text2.backgroundColor = UIColor.clearColor()
        text2.font = UIFont.systemFontOfSize(CGFloat(16))
        text2.textColor = UIColor.blackColor()
        text2.textAlignment = NSTextAlignment.Left
        text2.editable = false
        text2.scrollEnabled = true
        text2.text="①勤務消防署、②大津波・津波警報時参集指定署、③非常招集区分をそれぞれタップし、一覧から選択します。\n誤ったデータを入力すると参集指定署等が変わりますので確実に入力してください。\n\n④これで基礎データの入力は終了です。事象ボタンのどれかをタップし操作画面に展開します。"
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
