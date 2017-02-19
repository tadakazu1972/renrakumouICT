//
//  ContactNewViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/02/19.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class ContactNewViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    //メイン画面
    let lblData         = UILabel(frame: CGRectZero)
    let txtName         = UITextField(frame: CGRectZero)
    let txtTel          = UITextField(frame: CGRectZero)
    let txtMail         = UITextField(frame: CGRectZero)
    let lblSyozoku0     = UILabel(frame: CGRectZero)
    let picSyozoku0     = UIPickerView(frame: CGRectZero)
    let syozoku0Array: NSArray = ["消防局","北","都島","福島","此花","中央","西","港","大正","天王寺","浪速","西淀川","淀川","東淀川","東成","生野","旭","城東","鶴見","住之江","阿倍野","住吉","東住吉","平野","西成","水上","教育訓練センター"]
    let lblSyozoku      = UILabel(frame: CGRectZero)
    let picSyozoku      = UIPickerView(frame: CGRectZero)
    let lblKubun        = UILabel(frame: CGRectZero)
    let picKubun        = UIPickerView(frame: CGRectZero)
    let kubunArray: NSArray = ["１号招集","２号招集","３号招集","４号招集"]
    let lblKinmu        = UILabel(frame: CGRectZero)
    let picKinmu        = UIPickerView(frame: CGRectZero)
    let kinmuArray: NSArray = ["日勤","１部","２部"]
    let btnSave         = UIButton(frame: CGRectZero)
    let btnCancel       = UIButton(frame: CGRectZero)
    //別クラスのインスタンス保持用変数
    private var mInfoDialog: InfoDialog!
    //データ保存用
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var mainStation: String?
    var mainStationRow: Int?
    var tsunamiStation: String?
    var tsunamiStationRow: Int?
    var kubun: String?
    var kubunRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        //あなたのデータを入力してください
        lblData.text = "新規データ入力"
        lblData.adjustsFontSizeToFitWidth = true
        lblData.textColor = UIColor.blackColor()
        lblData.textAlignment = NSTextAlignment.Left
        lblData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblData)
        //名前テキストフィールド
        txtName.placeholder = "氏名を入力してください"
        txtName.adjustsFontSizeToFitWidth = true
        txtName.textColor = UIColor.blackColor()
        txtName.delegate = self
        txtName.borderStyle = UITextBorderStyle.Line
        txtName.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txtName)
        //所属(大分類)ラベル
        lblSyozoku0.text = "■所属(大分類)"
        lblSyozoku0.adjustsFontSizeToFitWidth = true
        lblSyozoku0.textAlignment = NSTextAlignment.Left
        lblSyozoku0.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblSyozoku0)
        //所属(大分類)PickerView
        picSyozoku0.delegate = self
        picSyozoku0.dataSource = self
        picSyozoku0.translatesAutoresizingMaskIntoConstraints = false
        picSyozoku0.tag = 1
        mainStation = userDefaults.stringForKey("mainStation") //保存した値を呼び出し
        mainStationRow = userDefaults.integerForKey("mainStationRow") //保存した値を呼び出し
        picSyozoku0.selectRow(mainStationRow!, inComponent:0, animated:false) //呼び出したrow値でピッカー初期化
        self.view.addSubview(picSyozoku0)
        //所属(小分類)ラベル
        lblSyozoku.text = "■所属(小分類)"
        lblSyozoku.adjustsFontSizeToFitWidth = true
        lblSyozoku.textAlignment = NSTextAlignment.Left
        lblSyozoku.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblSyozoku)
        //所属(小分類)PickerView
        picSyozoku.delegate = self
        picSyozoku.dataSource = self
        picSyozoku.translatesAutoresizingMaskIntoConstraints = false
        picSyozoku.tag = 2
        tsunamiStation = userDefaults.stringForKey("tsunamiStation")
        tsunamiStationRow = userDefaults.integerForKey("tsunamiStationRow")
        picSyozoku.selectRow(tsunamiStationRow!, inComponent:0, animated:false)
        self.view.addSubview(picSyozoku)
        //非常招集区分ラベル
        lblKubun.text = "■非常招集区分"
        lblKubun.adjustsFontSizeToFitWidth = true
        lblKubun.textAlignment = NSTextAlignment.Left
        lblKubun.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKubun)
        //非常招集区分PickerView
        picKubun.delegate = self
        picKubun.dataSource = self
        picKubun.translatesAutoresizingMaskIntoConstraints = false
        picKubun.tag = 3
        kubun = userDefaults.stringForKey("kubun")
        kubunRow = userDefaults.integerForKey("kubunRow")
        picKubun.selectRow(kubunRow!, inComponent:0, animated:false)
        self.view.addSubview(picKubun)
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
        
        //ボタン押したら表示するDialog生成
        mInfoDialog = InfoDialog(parentView: self) //このViewControllerを渡してあげる
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
            //新規データ入力ラベル
            Constraint(lblData, .Top, to:self.view, .Top, constant:28),
            Constraint(lblData, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblData, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //名前テキストフィールド
            Constraint(txtName, .Top, to:lblData, .Bottom, constant:24),
            Constraint(txtName, .Leading, to:self.view, .Leading, constant:16),
            Constraint(txtName, .Trailing, to:self.view, .Trailing, constant:-16)
            ])
        self.view.addConstraints([
            //所属(大分類)ラベル
            Constraint(lblSyozoku0, .Top, to:self.view, .CenterY, constant:8),
            Constraint(lblSyozoku0, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblSyozoku0, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //所属(大分類)PickerView
            Constraint(picSyozoku0, .Top, to:self.view, .CenterY, constant:8),
            Constraint(picSyozoku0, .Leading, to:self.view, .CenterX, constant:0),
            Constraint(picSyozoku0, .Trailing, to:self.view, .Trailing, constant:8),
            Constraint(picSyozoku0, .Height, to:self.view, .Height, multiplier:0.2, constant:0)
            ])
        self.view.addConstraints([
            //所属(小分類)ラベル
            Constraint(lblSyozoku, .Top, to:lblSyozoku0, .Bottom, constant:8),
            Constraint(lblSyozoku, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblSyozoku, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //所属(小分類)PickerView
            Constraint(picSyozoku, .Top, to:lblSyozoku0, .Bottom, constant:8),
            Constraint(picSyozoku, .Leading, to:self.view, .CenterX, constant:0),
            Constraint(picSyozoku, .Trailing, to:self.view, .Trailing, constant:8),
            Constraint(picSyozoku, .Height, to:self.view, .Height, multiplier:0.2, constant:0)
            ])
        self.view.addConstraints([
            //非常招集区分ラベル
            Constraint(lblKubun, .Top, to:lblSyozoku, .Bottom, constant:8),
            Constraint(lblKubun, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblKubun, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //非常招集区分PickerView
            Constraint(picKubun, .Top, to:lblSyozoku, .Bottom, constant:8),
            Constraint(picKubun, .Leading, to:self.view, .CenterX, constant:0),
            Constraint(picKubun, .Trailing, to:self.view, .Trailing, constant:8),
            Constraint(picKubun, .Height, to:self.view, .Height, multiplier:0.2, constant:0)
            ])
        self.view.addConstraints([
            //キャンセルボタン
            Constraint(btnCancel, .Bottom, to:self.view, .Bottom, constant:-10),
            Constraint(btnCancel, .Leading, to:self.view, .Leading, constant:8),
            Constraint(btnCancel, .Trailing, to:self.view, .CenterX, constant:-8)
            ])
        self.view.addConstraints([
            //登録ボタン
            Constraint(btnSave, .Bottom, to:self.view, .Bottom, constant:-10),
            Constraint(btnSave, .Leading, to:self.view, .CenterX, constant:8),
            Constraint(btnSave, .Trailing, to:self.view, .Trailing, constant:-8),
            ])
    }
    
    //表示例数
    func numberOfComponentsInPickerView(pickerView: UIPickerView)-> Int{
        return 1
    }
    
    //表示行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int{
        //返す行数
        var rowNum: Int
        //３種類のピッカーをタグで場合分け
        if (pickerView.tag==1){
            rowNum = syozoku0Array.count
        } else if (pickerView.tag==2){
            rowNum = syozoku0Array.count
        } else {
            rowNum = kubunArray.count
        }
        return rowNum
    }
    
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
        //返す列
        var picComponent: String?
        //３種類のピッカーをタグで場合分け
        if (pickerView.tag==1){
            picComponent = syozoku0Array[row] as? String
        } else if (pickerView.tag==2){
            picComponent = syozoku0Array[row] as? String
        } else {
            picComponent = kubunArray[row] as? String
        }
        return picComponent
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row:Int, inComponent component:Int) {
        print("列:\(row)")
        if (pickerView.tag==3){
            print("値:\(kubunArray[row])")
        } else {
            print("値:\(kinmuArray[row])")
        }
        //３種類のピッカーをタグで場合分け
        if (pickerView.tag==1){
            //一時保存
            //mainStation = syozoku0Array[row] as? String
            //mainStationRow = row
        } else if (pickerView.tag==2){
            //一時保存
            //tsunamiStation = syozoku0Array[row] as? String
            //tsunamiStationRow = row
        } else {
            //一時保存
            //kubun = kubunArray[row] as? String
            //kubunRow = row
        }
    }
    
    //登録ボタンクリック
    func onClickbtnSave(sender : UIButton){
        
    }
    
    //キャンセルボタンクリック
    func onClickbtnCancel(sender : UIButton){
        //KinentaiViewControllerのインスタンス生成
        let data:ContactViewController = ContactViewController()
        
        //navigationControllerのrootViewControllerにKinentaiViewControllerをセット
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        
        //画面遷移
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
