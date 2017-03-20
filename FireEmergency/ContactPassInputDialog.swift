//
//  ContactPassInputDialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/20.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class ContactPassInputDialog : UITextField {
    //ボタン押したら出るUIWindow
    private var parent: UIViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var textField1: UITextField!
    private var btnClose: UIButton!
    private var btnInput: UIButton!
    //データ保存用
    let userDefaults = NSUserDefaults.standardUserDefaults()
    //遷移先分岐用
    private var mIndex: Int!
    //SQLite用
    internal var mDBHelper: DBHelper!
    private var mContactLoadDialog2: ContactLoadDialog2!
    private var mContactUpdateSelectDialog: ContactUpdateSelectDialog!
    private var mContactDeleteDialog: ContactDeleteDialog!
    
    //UITextFieldを便宜的に親として継承しているため。UIViewControllerを継承したくないための策。
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //コンストラクタ
    init(parentView: UIViewController){
        super.init(frame: CGRectZero)
        
        parent      = parentView
        win1        = UIWindow()
        text1       = UITextView()
        textField1  = UITextField()
        btnClose    = UIButton()
        btnInput   = UIButton()
        mIndex = 0
        mDBHelper = DBHelper()
    }
    
    //デコンストラクタ
    deinit{
        parent      = nil
        win1        = nil
        text1       = nil
        textField1  = nil
        btnClose    = nil
        btnInput    = nil
        mIndex = nil
        mDBHelper = nil
    }
    
    //表示
    func showResult(index: Int){
        //分岐先保存
        mIndex = index
        
        //元の画面を暗く
        parent.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.whiteColor()
        win1.frame = CGRectMake(80,10,parent.view.frame.width-40,200)
        win1.layer.position = CGPointMake(parent.view.frame.width/2, 200)
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKeyWindow()
        //表示
        self.win1.makeKeyAndVisible()
        
        //１セット目
        //text1生成
        text1.frame = CGRectMake(10,10, self.win1.frame.width - 20, 40)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(14))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        text1.scrollEnabled = true
        text1.text = "パスワードを入力してください"
        self.win1.addSubview(text1)
        //textField1
        textField1.frame = CGRectMake(10,60, self.win1.frame.width - 20, 40)
        textField1.backgroundColor = UIColor.clearColor()
        textField1.font = UIFont.systemFontOfSize((CGFloat(14)))
        textField1.textAlignment = NSTextAlignment.Center
        textField1.placeholder = "パスワードを入力してください"
        textField1.borderStyle = UITextBorderStyle.RoundedRect
        self.win1.addSubview(textField1)
        
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
        
        //入力ボタン生成
        btnInput.frame = CGRectMake(0,0,100,30)
        btnInput.backgroundColor = UIColor.redColor()
        btnInput.setTitle("入力", forState: .Normal)
        btnInput.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnInput.layer.masksToBounds = true
        btnInput.layer.cornerRadius = 10.0
        btnInput.layer.position = CGPointMake(self.win1.frame.width/2+60, self.win1.frame.height-20)
        btnInput.addTarget(self, action: #selector(self.onClickInput(_:)), forControlEvents: .TouchUpInside)
        self.win1.addSubview(btnInput)
    }
    
    //閉じる
    @objc func onClickClose(sender: UIButton){
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
    }
    
    //判定
    @objc func onClickInput(sender: UIButton){
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
        //対応の結果であるアクションプランを表示
        if textField1.text == userDefaults.stringForKey("password") {
            userDefaults.setBool(true, forKey: "passCheck")
            //遷移 parentで実行
            switch mIndex {
            case 0:
                mDBHelper.selectAll()
                mContactLoadDialog2 = ContactLoadDialog2(parentView: parent, resultFrom: mDBHelper.resultArray)
                mContactLoadDialog2.showResult()
                break
            case 1:
                break
            case 2:
                mDBHelper.selectAll2() //_idを含む呼び出す。後でその_idをもって上書きするデータを指定するから。
                mContactUpdateSelectDialog = ContactUpdateSelectDialog(parentView: parent, resultFrom: mDBHelper.resultArray)
                mContactUpdateSelectDialog.showResult()
                break
            case 3:
                mDBHelper.selectAll2() //_idを含む2を呼び出し
                mContactDeleteDialog = ContactDeleteDialog(parentView: parent as! ContactViewController, resultFrom: mDBHelper.resultArray)
                mContactDeleteDialog.showResult()
                break
            default:
                break
            }
        } else {
            //誤りならfalseに
            userDefaults.setBool(false, forKey: "passCheck")
        }
    }
}
