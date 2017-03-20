//
//  Guide6Dialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/05.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide6Dialog {
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
    private var image5: UIImageView!
    private var text5: UITextView!
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
        text5 = UITextView()
        image5 = UIImageView()
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
        image5 = nil
        text5 = nil
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
        scroll.contentSize = CGSizeMake(300,2500)
        self.win1.addSubview(scroll)
        
        //TextView0生成
        text0.frame = CGRectMake(0,0, 300, 30)
        text0.backgroundColor = UIColor.clearColor()
        text0.font = UIFont.systemFontOfSize(CGFloat(16))
        text0.textColor = UIColor.blackColor()
        text0.textAlignment = NSTextAlignment.Left
        text0.editable = false
        text0.scrollEnabled = true
        text0.text="６　連絡網"
        scroll.addSubview(text0)
        
        //image1生成
        let img1 = UIImage(named: "guide61.png")
        image1.image = img1
        image1.frame = CGRectMake((parent.view.frame.width-320)/2, 40, 300, 96)
        scroll.addSubview(image1)
        
        //TextView1生成
        text1.frame = CGRectMake(0,150, parent.view.frame.width-20, 80)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(16))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        text1.scrollEnabled = true
        text1.text="連絡網ボタンをタップすると\n①インストール後初回のみ、パスワード設定画面になります。"
        scroll.addSubview(text1)
        //image2生成
        let img2 = UIImage(named: "guide62.png")
        image2.image = img2
        image2.frame = CGRectMake((parent.view.frame.width-320)/2, 240, 300, 160)
        scroll.addSubview(image2)
        
        //TextView2生成
        text2.frame = CGRectMake(0,410, parent.view.frame.width-20, 80)
        text2.backgroundColor = UIColor.clearColor()
        text2.font = UIFont.systemFontOfSize(CGFloat(16))
        text2.textColor = UIColor.blackColor()
        text2.textAlignment = NSTextAlignment.Left
        text2.editable = false
        text2.scrollEnabled = true
        text2.text="②パスワードは変更できません。変更する場合はアプリを削除し、再度インストールしてください。"
        scroll.addSubview(text2)
        
        //image3生成
        let img3 = UIImage(named: "guide63.png")
        image3.image = img3
        image3.frame = CGRectMake((parent.view.frame.width-320)/2, 520, 300, 200)
        scroll.addSubview(image3)
        
        //TextView3生成
        text3.frame = CGRectMake(0,740, parent.view.frame.width-20, 220)
        text3.backgroundColor = UIColor.clearColor()
        text3.font = UIFont.systemFontOfSize(CGFloat(16))
        text3.textColor = UIColor.blackColor()
        text3.textAlignment = NSTextAlignment.Left
        text3.editable = false
        text3.scrollEnabled = true
        text3.text="③次回以降、設定したパスワードを入力すると連絡網を使用できます。\n④パスワードは[震災][風水害]などの同一画面では１度の入力で連絡網を使えますが、\n⑤画面を変える（[震災]→[風水害]など）またはアプリを終了すると再度入力する必要があります。\n⑥パスワードは変更できません。変更する場合はアプリを削除し、再度インストールして設定してください。"
        scroll.addSubview(text3)
        
        //image4生成
        let img4 = UIImage(named: "guide64.png")
        image4.image = img4
        image4.frame = CGRectMake((parent.view.frame.width-320)/2, 990, 300, 426)
        scroll.addSubview(image4)
        
        //TextView4生成
        text4.frame = CGRectMake(0, 1436, parent.view.frame.width-20, 220)
        text4.backgroundColor = UIColor.clearColor()
        text4.font = UIFont.systemFontOfSize(CGFloat(16))
        text4.textColor = UIColor.blackColor()
        text4.textAlignment = NSTextAlignment.Left
        text4.editable = false
        text4.scrollEnabled = true
        text4.text="■データ全件一覧表示\n　データ全件一覧を表示させ、個別に電話、メール送信することが可能です。(メールは一斉送信可)\n\n■グループ検索\n　非常招集区分、所属(大分類)、所属(小分類)、勤務区分を選択し検索します。個別に電話、メール送信することが可能です。(メールは一斉送信可)"
        scroll.addSubview(text4)
        
        //image5生成
        let img5 = UIImage(named: "guide65.png")
        image5.image = img5
        image5.frame = CGRectMake((parent.view.frame.width-320)/2, 1680, 300, 426)
        scroll.addSubview(image5)
        
        //TextView5生成
        text5.frame = CGRectMake(0, 2120, parent.view.frame.width-20, 320)
        text5.backgroundColor = UIColor.clearColor()
        text5.font = UIFont.systemFontOfSize(CGFloat(16))
        text5.textColor = UIColor.blackColor()
        text5.textAlignment = NSTextAlignment.Left
        text5.editable = false
        text5.scrollEnabled = true
        text5.text="個別に電話する場合は電話番号をタップ、メール送信する場合はアドレスをタップします。\n\n選択する際には名前付近の行の中心をタップしてください。(チェックボックスはタップに反応しません)\n\n選択した人に一斉にメールすることが可能です。選択してからメール送信をタップすると、選択した人のメールアドレスがまとめて宛先に入った状態で、メール作成画面になります。"
        scroll.addSubview(text5)

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
