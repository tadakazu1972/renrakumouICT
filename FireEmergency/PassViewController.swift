//
//  PassViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/14.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class PassViewController: UIViewController, UITextFieldDelegate {
    //メイン画面
    let lblPass         = UILabel(frame: CGRectZero)
    let txtPass         = UITextField(frame: CGRectZero)
    let btnSave         = UIButton(frame: CGRectZero)
    let btnCancel       = UIButton(frame: CGRectZero)
    //データ保存用
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        //パスワードを入力してください
        lblPass.text = "パスワード入力"
        lblPass.adjustsFontSizeToFitWidth = true
        lblPass.textColor = UIColor.blackColor()
        lblPass.textAlignment = NSTextAlignment.Left
        lblPass.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblPass)
        //テキストフィールド
        txtPass.placeholder = "パスワードを入力してください"
        txtPass.adjustsFontSizeToFitWidth = true
        txtPass.textColor = UIColor.blackColor()
        txtPass.delegate = self
        txtPass.borderStyle = UITextBorderStyle.Bezel
        txtPass.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txtPass)
        
        //キャンセルボタン
        btnCancel.backgroundColor = UIColor.blueColor()
        btnCancel.layer.masksToBounds = true
        btnCancel.setTitle("キャンセル", forState: UIControlState.Normal)
        btnCancel.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnCancel.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        btnCancel.layer.cornerRadius = 8.0
        btnCancel.tag = 2
        btnCancel.addTarget(self, action: #selector(self.onClickbtnCancel(_:)), forControlEvents: .TouchUpInside)
        btnCancel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnCancel)
        //データ登録ボタン
        btnSave.backgroundColor = UIColor.redColor()
        btnSave.layer.masksToBounds = true
        btnSave.setTitle("登録", forState: UIControlState.Normal)
        btnSave.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnSave.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        btnSave.layer.cornerRadius = 8.0
        btnSave.tag = 1
        btnSave.addTarget(self, action: #selector(self.onClickbtnSave(_:)), forControlEvents: .TouchUpInside)
        btnSave.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnSave)        
    }
    
    //制約ひな型
    func Constraint(item: AnyObject, _ attr: NSLayoutAttribute, to: AnyObject?, _ attrTo: NSLayoutAttribute, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, relate: NSLayoutRelation = .Equal, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        let ret = NSLayoutConstraint(
            item:       item,
            attribute:  attr,
            relatedBy:  relate,
            toItem:     to,
            attribute:  attrTo,
            multiplier: multiplier,
            constant:   constant
        )
        ret.priority = priority
        return ret
    }
    
    override func viewDidLayoutSubviews(){
        //制約
        self.view.addConstraints([
            //ラベル
            Constraint(lblPass, .Top, to:self.view, .Top, constant:100),
            Constraint(lblPass, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblPass, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //テキストフィールド
            Constraint(txtPass, .Top, to:lblPass, .Bottom, constant:24),
            Constraint(txtPass, .Leading, to:self.view, .Leading, constant:16),
            Constraint(txtPass, .Trailing, to:self.view, .Trailing, constant:-16)
            ])
        self.view.addConstraints([
            //キャンセルボタン
            Constraint(btnCancel, .Bottom, to:txtPass, .Bottom, constant:48),
            Constraint(btnCancel, .Leading, to:self.view, .Leading, constant:8),
            Constraint(btnCancel, .Trailing, to:self.view, .CenterX, constant:-8)
            ])
        self.view.addConstraints([
            //登録ボタン
            Constraint(btnSave, .Bottom, to:txtPass, .Bottom, constant:48),
            Constraint(btnSave, .Leading, to:self.view, .CenterX, constant:8),
            Constraint(btnSave, .Trailing, to:self.view, .Trailing, constant:-8),
            ])
    }
    
    //登録ボタンクリック
    func onClickbtnSave(sender : UIButton){
        //UserDefaultsに書き込み
        let pass: String = txtPass.text!
        userDefaults.setObject(pass, forKey: "password")
        
        //自己を破棄し、呼び出し元へ遷移
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //キャンセルボタンクリック
    func onClickbtnCancel(sender : UIButton){
        //自己を破棄し、呼び出し元へ遷移
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
