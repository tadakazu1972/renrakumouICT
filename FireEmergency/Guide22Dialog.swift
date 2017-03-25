//
//  Guide22Dialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/20.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide22Dialog {
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
    private var image10: UIImageView!
    private var text10: UITextView!
    private var image11: UIImageView!
    private var text11: UITextView!
    private var image12: UIImageView!
    private var text12: UITextView!
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
        image10 = UIImageView()
        text10 = UITextView()
        image11 = UIImageView()
        text11 = UITextView()
        image12 = UIImageView()
        text12 = UITextView()
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
        image9 = nil
        text9 = nil
        image10 = nil
        text10 = nil
        image11 = nil
        text11 = nil
        image12 = nil
        text12 = nil
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
        scroll.contentSize = CGSizeMake(300,5500)
        self.win1.addSubview(scroll)
        
        //TextView0生成
        text0.frame = CGRectMake(0,0, 300, 30)
        text0.backgroundColor = UIColor.clearColor()
        text0.font = UIFont.systemFontOfSize(CGFloat(16))
        text0.textColor = UIColor.blackColor()
        text0.textAlignment = NSTextAlignment.Left
        text0.editable = false
        text0.scrollEnabled = true
        text0.text="２　連絡網データ作成(CSVファイル読込)"
        scroll.addSubview(text0)
        
        //TextView1生成
        text1.frame = CGRectMake(0,40, parent.view.frame.width-20, 208)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(16))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        text1.scrollEnabled = true
        text1.text="①エクセルデータの作成\n氏名、電話番号、メールアドレス、非常招集区分、所属(大分類)、所属(小分類)、勤務区分を入力してください。\n※非常招集区分、勤務区分の「数字」は必ず【全角】で入力してください。\n※入力データ以外の項目や番号は入力しないでください。\n※勤務場所(大分類)の入力例　旭→正、旭消防署→誤"
        scroll.addSubview(text1)

        //image1生成
        let img1 = UIImage(named: "guide221.png")
        image1.image = img1
        image1.frame = CGRectMake((parent.view.frame.width-320)/2, 250, 300, 173)
        scroll.addSubview(image1)
        
        //TextView2生成
        text2.frame = CGRectMake(0,433, parent.view.frame.width-20, 100)
        text2.backgroundColor = UIColor.clearColor()
        text2.font = UIFont.systemFontOfSize(CGFloat(16))
        text2.textColor = UIColor.blackColor()
        text2.textAlignment = NSTextAlignment.Left
        text2.editable = false
        text2.scrollEnabled = true
        text2.text="②エクセルデータの保存\n作成したデータに名前を付けて保存します。保存にあたりファイルの種類を「CSV(カンマ区切り)」とします。"
        scroll.addSubview(text2)
        
        //image2生成
        let img2 = UIImage(named: "guide222.png")
        image2.image = img2
        image2.frame = CGRectMake((parent.view.frame.width-320)/2, 543, 300, 376)
        scroll.addSubview(image2)
        
        //TextView3生成
        text3.frame = CGRectMake(0,949, parent.view.frame.width-20, 132)
        text3.backgroundColor = UIColor.clearColor()
        text3.font = UIFont.systemFontOfSize(CGFloat(16))
        text3.textColor = UIColor.blackColor()
        text3.textAlignment = NSTextAlignment.Left
        text3.editable = false
        text3.scrollEnabled = true
        text3.text="③文字コードの変更\nWindowsアクセサリのメモ帳を起動し、先ほどCSV形式で保存したファイルを読み込みます。読み込む際、「テキスト文書(*.txt)」から「すべてのファイル」に切り替えてファイルを表示させます。"
        scroll.addSubview(text3)
        
        //image3生成
        let img3 = UIImage(named: "guide223.png")
        image3.image = img3
        image3.frame = CGRectMake((parent.view.frame.width-320)/2, 1077, 300, 210)
        scroll.addSubview(image3)
        
        //TextView4生成
        text4.frame = CGRectMake(0, 1307, parent.view.frame.width-20, 158)
        text4.backgroundColor = UIColor.clearColor()
        text4.font = UIFont.systemFontOfSize(CGFloat(16))
        text4.textColor = UIColor.blackColor()
        text4.textAlignment = NSTextAlignment.Left
        text4.editable = false
        text4.scrollEnabled = true
        text4.text="④メモ帳で表示した連絡網データの保存\n連絡網データを表示し「氏名、電話番号、メールアドレス、非常招集区分、勤務場所(大分類)、勤務場所(小分類)、勤務区分」が入力されているのを確認します。\n確認後、文字コードを「UTF-8」に変更し名前を付けて保存します。"
        scroll.addSubview(text4)
        
        //image4生成
        let img4 = UIImage(named: "guide224.png")
        image4.image = img4
        image4.frame = CGRectMake((parent.view.frame.width-320)/2, 1473, 300, 366)
        scroll.addSubview(image4)
        
        //TextView5生成
        text5.frame = CGRectMake(0, 1853, parent.view.frame.width-20, 100)
        text5.backgroundColor = UIColor.clearColor()
        text5.font = UIFont.systemFontOfSize(CGFloat(16))
        text5.textColor = UIColor.blackColor()
        text5.textAlignment = NSTextAlignment.Left
        text5.editable = false
        text5.scrollEnabled = true
        text5.text="⑤作成したデータの送信\n④で保存したデータを個人所有のスマートフォンにメール送信します。\niPhone標準の「メール」で受信できるメールアドレスに送信してください。"
        scroll.addSubview(text5)
        
        //image5生成
        let img5 = UIImage(named: "guide225.png")
        image5.image = img5
        image5.frame = CGRectMake((parent.view.frame.width-320)/2, 1963, 300, 85)
        scroll.addSubview(image5)
        
        //TextView6生成
        text6.frame = CGRectMake(0, 2068, parent.view.frame.width-20, 80)
        text6.backgroundColor = UIColor.clearColor()
        text6.font = UIFont.systemFontOfSize(CGFloat(16))
        text6.textColor = UIColor.blackColor()
        text6.textAlignment = NSTextAlignment.Left
        text6.editable = false
        text6.scrollEnabled = true
        text6.text="⑥メールの受信\n「メール」を起動してiPhoneに送信したメールを開きます。"
        scroll.addSubview(text6)
        
        //image6生成
        let img6 = UIImage(named: "guide226.png")
        image6.image = img6
        image6.frame = CGRectMake((parent.view.frame.width-320)/2, 2148, 300, 426)
        scroll.addSubview(image6)
        
        //image7生成
        let img7 = UIImage(named: "guide227.png")
        image7.image = img7
        image7.frame = CGRectMake((parent.view.frame.width-320)/2, 2594, 300, 264)
        scroll.addSubview(image7)
        
        //TextView7生成
        text7.frame = CGRectMake(0, 2884, parent.view.frame.width-20, 40)
        text7.backgroundColor = UIColor.clearColor()
        text7.font = UIFont.systemFontOfSize(CGFloat(16))
        text7.textColor = UIColor.blackColor()
        text7.textAlignment = NSTextAlignment.Left
        text7.editable = false
        text7.scrollEnabled = true
        text7.text="⑦添付ファイルを１秒以上長押します。"
        scroll.addSubview(text7)
        
        //image8生成
        let img8 = UIImage(named: "guide228.png")
        image8.image = img8
        image8.frame = CGRectMake((parent.view.frame.width-320)/2, 2924, 300, 300)
        scroll.addSubview(image8)
        
        //TextView8生成
        text8.frame = CGRectMake(0, 3244, parent.view.frame.width-20, 100)
        text8.backgroundColor = UIColor.clearColor()
        text8.font = UIFont.systemFontOfSize(CGFloat(16))
        text8.textColor = UIColor.blackColor()
        text8.textAlignment = NSTextAlignment.Left
        text8.editable = false
        text8.scrollEnabled = true
        text8.text="⑧中段に出てくるアイコン一覧から「非常招集にコピー」を選択しタップします。\n※アイコンが見えない場合は横にスワイプしてください。"
        scroll.addSubview(text8)
        
        //image9生成
        let img9 = UIImage(named: "guide229.png")
        image9.image = img9
        image9.frame = CGRectMake((parent.view.frame.width-320)/2, 3350, 300, 426)
        scroll.addSubview(image9)
        
        //TextView9生成
        text9.frame = CGRectMake(0, 3796, parent.view.frame.width-20, 100)
        text9.backgroundColor = UIColor.clearColor()
        text9.font = UIFont.systemFontOfSize(CGFloat(16))
        text9.textColor = UIColor.blackColor()
        text9.textAlignment = NSTextAlignment.Left
        text9.editable = false
        text9.scrollEnabled = true
        text9.text="⑨「非常招集」アプリに切り替わりますので「基礎データ入力」→「連絡網データ操作」に移動し、「CSVファイル読込」をタップしてください。"
        scroll.addSubview(text9)
        
        //image10生成
        let img10 = UIImage(named: "guide2210.png")
        image10.image = img10
        image10.frame = CGRectMake((parent.view.frame.width-320)/2, 3900, 300, 426)
        scroll.addSubview(image10)
        
        //TextView10生成
        text10.frame = CGRectMake(0, 4346, parent.view.frame.width-20, 80)
        text10.backgroundColor = UIColor.clearColor()
        text10.font = UIFont.systemFontOfSize(CGFloat(16))
        text10.textColor = UIColor.blackColor()
        text10.textAlignment = NSTextAlignment.Left
        text10.editable = false
        text10.scrollEnabled = true
        text10.text="⑨添付ファイルからコピーしたCSVファイルの中身が表示されます。確認した後、「読込」をタップしてください。"
        scroll.addSubview(text10)

        //image11生成
        let img11 = UIImage(named: "guide2211.png")
        image11.image = img11
        image11.frame = CGRectMake((parent.view.frame.width-320)/2, 4436, 300, 426)
        scroll.addSubview(image11)

        //TextView11生成
        text11.frame = CGRectMake(0, 4882, parent.view.frame.width-20, 40)
        text11.backgroundColor = UIColor.clearColor()
        text11.font = UIFont.systemFontOfSize(CGFloat(16))
        text11.textColor = UIColor.blackColor()
        text11.textAlignment = NSTextAlignment.Left
        text11.editable = false
        text11.scrollEnabled = true
        text11.text="⑩CSVファイルの読込完了です。"
        scroll.addSubview(text11)
        
        //image12生成
        let img12 = UIImage(named: "guide2212.png")
        image12.image = img12
        image12.frame = CGRectMake((parent.view.frame.width-320)/2, 4922, 300, 426)
        scroll.addSubview(image12)
        
        //TextView12生成
        text12.frame = CGRectMake(0, 5368, parent.view.frame.width-20, 100)
        text12.backgroundColor = UIColor.clearColor()
        text12.font = UIFont.systemFontOfSize(CGFloat(16))
        text12.textColor = UIColor.blackColor()
        text12.textAlignment = NSTextAlignment.Left
        text12.editable = false
        text12.scrollEnabled = true
        text12.text="※連絡網データを「非常招集アプリ」に取り込んだ後は、メール（添付ファイル）を削除してください。"
        scroll.addSubview(text12)
        
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
