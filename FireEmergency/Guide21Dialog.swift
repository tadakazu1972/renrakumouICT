//
//  Guide21Dialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/20.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide21Dialog {
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
    private var image6: UIImageView!
    private var text6: UITextView!
    private var image7: UIImageView!
    private var text7: UITextView!
    private var image8: UIImageView!
    private var text8: UITextView!
    private var image9: UIImageView!
    private var text9: UITextView!
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
        image5 = UIImageView()
        text5 = UITextView()
        image6 = UIImageView()
        text6 = UITextView()
        image7 = UIImageView()
        text7 = UITextView()
        image8 = UIImageView()
        text8 = UITextView()
        image9 = UIImageView()
        text9 = UITextView()
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
        image5 = nil
        text5 = nil
        image6 = nil
        text6 = nil
        image7 = nil
        text7 = nil
        image8 = nil
        text8 = nil
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
        scroll.contentSize = CGSizeMake(300,4100)
        self.win1.addSubview(scroll)
        
        //TextView0生成
        text0.frame = CGRectMake(0,0, 300, 30)
        text0.backgroundColor = UIColor.clearColor()
        text0.font = UIFont.systemFontOfSize(CGFloat(16))
        text0.textColor = UIColor.blackColor()
        text0.textAlignment = NSTextAlignment.Left
        text0.editable = false
        text0.scrollEnabled = true
        text0.text="２　連絡網データ操作"
        scroll.addSubview(text0)
        
        //image1生成
        let img1 = UIImage(named: "guide211.png")
        image1.image = img1
        image1.frame = CGRectMake((parent.view.frame.width-320)/2, 40, 300, 426)
        scroll.addSubview(image1)
        
        //TextView1生成
        text1.frame = CGRectMake(0,486, parent.view.frame.width-20, 80)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(16))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        text1.scrollEnabled = true
        text1.text="連絡網データ操作ボタンは基礎データ入力画面の下部にあります。"
        scroll.addSubview(text1)
        
        //image2生成
        let img2 = UIImage(named: "guide212.png")
        image2.image = img2
        image2.frame = CGRectMake((parent.view.frame.width-320)/2, 586, 300, 426)
        scroll.addSubview(image2)
        
        //TextView2生成
        text2.frame = CGRectMake(0,1046, parent.view.frame.width-20, 100)
        text2.backgroundColor = UIColor.clearColor()
        text2.font = UIFont.systemFontOfSize(CGFloat(16))
        text2.textColor = UIColor.blackColor()
        text2.textAlignment = NSTextAlignment.Left
        text2.editable = false
        text2.scrollEnabled = true
        text2.text="招集連絡に必要なデータ入力を行います。\n新規をタップします。"
        scroll.addSubview(text2)
        
        //image3生成
        let img3 = UIImage(named: "guide213.png")
        image3.image = img3
        image3.frame = CGRectMake((parent.view.frame.width-320)/2, 1146, 300, 426)
        scroll.addSubview(image3)
        
        //TextView3生成
        text3.frame = CGRectMake(0,1592, parent.view.frame.width-20, 120)
        text3.backgroundColor = UIColor.clearColor()
        text3.font = UIFont.systemFontOfSize(CGFloat(16))
        text3.textColor = UIColor.blackColor()
        text3.textAlignment = NSTextAlignment.Left
        text3.editable = false
        text3.scrollEnabled = true
        text3.text="画面に必要な情報を入力または選択します。\n全ての項目に入力が終われば「登録」をタップします。\nこれで登録完了です。"
        scroll.addSubview(text3)
        
        //image4生成
        let img4 = UIImage(named: "guide214.png")
        image4.image = img4
        image4.frame = CGRectMake((parent.view.frame.width-320)/2, 1720, 300, 146)
        scroll.addSubview(image4)
        
        //TextView4生成
        text4.frame = CGRectMake(0, 1886, parent.view.frame.width-20, 80)
        text4.backgroundColor = UIColor.clearColor()
        text4.font = UIFont.systemFontOfSize(CGFloat(16))
        text4.textColor = UIColor.blackColor()
        text4.textAlignment = NSTextAlignment.Left
        text4.editable = false
        text4.scrollEnabled = true
        text4.text="登録したデータは一覧ボタンをタップし確認してください。"
        scroll.addSubview(text4)
        
        //image5生成
        let img5 = UIImage(named: "guide63.png")
        image5.image = img5
        image5.frame = CGRectMake((parent.view.frame.width-320)/2, 1966, 300, 195)
        scroll.addSubview(image5)
        
        //TextView5生成
        text5.frame = CGRectMake(0, 2161, parent.view.frame.width-20, 100)
        text5.backgroundColor = UIColor.clearColor()
        text5.font = UIFont.systemFontOfSize(CGFloat(16))
        text5.textColor = UIColor.blackColor()
        text5.textAlignment = NSTextAlignment.Left
        text5.editable = false
        text5.scrollEnabled = true
        text5.text="画面にパスワードを入力します。\n「入力」をタップすると一覧表が表示されます。"
        scroll.addSubview(text5)
        
        //image6生成
        let img6 = UIImage(named: "guide65.png")
        image6.image = img6
        image6.frame = CGRectMake((parent.view.frame.width-320)/2, 2260, 300, 426)
        scroll.addSubview(image6)
        
        //TextView6生成
        text6.frame = CGRectMake(0, 2706, parent.view.frame.width-20, 80)
        text6.backgroundColor = UIColor.clearColor()
        text6.font = UIFont.systemFontOfSize(CGFloat(16))
        text6.textColor = UIColor.blackColor()
        text6.textAlignment = NSTextAlignment.Left
        text6.editable = false
        text6.scrollEnabled = true
        text6.text="電話番号、メールアドレスのタップで電話、メール送信が行えます。"
        scroll.addSubview(text6)
        
        //image7生成
        let img7 = UIImage(named: "guide217.png")
        image7.image = img7
        image7.frame = CGRectMake((parent.view.frame.width-320)/2, 2786, 300, 231)
        scroll.addSubview(image7)
        
        //TextView7生成
        text7.frame = CGRectMake(0, 3016, parent.view.frame.width-20, 80)
        text7.backgroundColor = UIColor.clearColor()
        text7.font = UIFont.systemFontOfSize(CGFloat(16))
        text7.textColor = UIColor.blackColor()
        text7.textAlignment = NSTextAlignment.Left
        text7.editable = false
        text7.scrollEnabled = true
        text7.text="連絡網データの修正が必要な場合は「修正」ボタンをタップします。"
        scroll.addSubview(text7)

        //image8生成
        let img8 = UIImage(named: "guide63.png")
        image8.image = img8
        image8.frame = CGRectMake((parent.view.frame.width-320)/2, 3096, 300, 195)
        scroll.addSubview(image8)
        
        //TextView8生成
        text8.frame = CGRectMake(0, 3300, parent.view.frame.width-20, 100)
        text8.backgroundColor = UIColor.clearColor()
        text8.font = UIFont.systemFontOfSize(CGFloat(16))
        text8.textColor = UIColor.blackColor()
        text8.textAlignment = NSTextAlignment.Left
        text8.editable = false
        text8.scrollEnabled = true
        text8.text="画面にパスワードを入力します。\n「入力」をタップすると一覧表が表示されます。"
        scroll.addSubview(text8)
        
        //image9生成
        let img9 = UIImage(named: "guide219.png")
        image9.image = img9
        image9.frame = CGRectMake((parent.view.frame.width-320)/2, 3400, 300, 426)
        scroll.addSubview(image9)

        //TextView9生成
        text9.frame = CGRectMake(0, 3846, parent.view.frame.width-20, 110)
        text9.backgroundColor = UIColor.clearColor()
        text9.font = UIFont.systemFontOfSize(CGFloat(16))
        text9.textColor = UIColor.blackColor()
        text9.textAlignment = NSTextAlignment.Left
        text9.editable = false
        text9.scrollEnabled = true
        text9.text="内容を修正し「登録」をタップします。\n\n削除が必要な場合は前の画面で「削除」をタップし、削除したいデータを選択してください。"
        scroll.addSubview(text9)
        
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
