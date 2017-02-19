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
    let lblKubun        = UILabel(frame: CGRectZero)
    let txtKubun        = UITextField(frame: CGRectZero)
    let picKubun        = UIPickerView(frame: CGRectZero)
    let kubunArray: NSArray = ["１号招集","２号招集","３号招集","４号招集"]
    let lblSyozoku0     = UILabel(frame: CGRectZero)
    let txtSyozoku0     = UITextField(frame: CGRectZero)
    let picSyozoku0     = UIPickerView(frame: CGRectZero)
    let syozoku0Array: NSArray = ["消防局","北","都島","福島","此花","中央","西","港","大正","天王寺","浪速","西淀川","淀川","東淀川","東成","生野","旭","城東","鶴見","住之江","阿倍野","住吉","東住吉","平野","西成","水上","教育訓練センター"]
    let lblSyozoku      = UILabel(frame: CGRectZero)
    let txtSyozoku      = UITextField(frame: CGRectZero)
    let picSyozoku      = UIPickerView(frame: CGRectZero)
    let syozokuArray: NSArray = [["総務課","人事課","施設課","予防課","規制課","警防課","司令課","救急課"],
                                 ["北本署","梅田","浮田","南森町","与力","大淀町","本庄"],
                                 ["都島本署","高倉","東野田"],
                                 ["福島本署","上福島","海老江"],
                                 ["此花本署","桜島","西九条"],
                                 ["中央本署","東雲","道頓堀","南坂町","上町"],
                                 ["西本署","江戸堀","新町"],
                                 ["港本署","田中"],
                                 ["大正本署","泉尾","鶴町"],
                                 ["天王寺本署","元町"],
                                 ["浪速本署","恵美須","立葉","浪速出張所"],
                                 ["西淀川本署","佃","大和田","竹島"],
                                 ["淀川本署","十三橋","加島","東三国"],
                                 ["東淀川本署","豊里","小松","井高野","柴島","西淡路"],
                                 ["東成本署","中本","深江"],
                                 ["生野本署","勝山","中川","巽"],
                                 ["旭本署","新森","赤川"],
                                 ["城東本署","放出","中浜","関目"],
                                 ["鶴見本署","今津","矢田"],
                                 ["住之江本署","平林","加賀屋","南港"],
                                 ["阿倍野本署","清明通","阪南"],
                                 ["住吉本署","苅田","万代"],
                                 ["東住吉本署","北田辺","杭全","矢田"],
                                 ["平野本署","加美","長吉","喜連","加美正覚寺"],
                                 ["西成本署","海道","津守"],
                                 ["水上"],
                                 ["教育訓練センター"]]
    let lblKinmu        = UILabel(frame: CGRectZero)
    let txtKinmu        = UITextField(frame: CGRectZero)
    let picKinmu        = UIPickerView(frame: CGRectZero)
    let kinmuArray: NSArray = ["日勤","１部","２部"]
    let btnSave         = UIButton(frame: CGRectZero)
    let btnCancel       = UIButton(frame: CGRectZero)
    //別クラスのインスタンス保持用変数
    private var mInfoDialog: InfoDialog!
    //所属(大分類)のインデックス保存用
    private var syozoku0Index : Int = 0
    
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
        txtName.borderStyle = UITextBorderStyle.Bezel
        txtName.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txtName)
        //電話番号テキストフィールド
        txtTel.placeholder = "電話番号を入力してください"
        txtTel.adjustsFontSizeToFitWidth = true
        txtTel.textColor = UIColor.blackColor()
        txtTel.delegate = self
        txtTel.borderStyle = UITextBorderStyle.Bezel
        txtTel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txtTel)
        //メールアドレステキストフィールド
        txtMail.placeholder = "メールアドレスを入力してください"
        txtMail.adjustsFontSizeToFitWidth = true
        txtMail.textColor = UIColor.blackColor()
        txtMail.delegate = self
        txtMail.borderStyle = UITextBorderStyle.Bezel
        txtMail.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txtMail)
        
        //pickerViewとともにポップアップするツールバーとボタンの設定
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(title:"選択", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.selectRow))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil) //小ワザ。上の選択ボタンを右寄せにするためのダミースペース
        toolbar.setItems([flexibleSpace, doneItem], animated: true)
        
        //非常招集区分ラベル
        lblKubun.text = "■非常招集区分"
        lblKubun.adjustsFontSizeToFitWidth = true
        lblKubun.textAlignment = NSTextAlignment.Left
        lblKubun.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKubun)
        //非常招集区分テキストフィールド
        txtKubun.borderStyle = UITextBorderStyle.Bezel
        txtKubun.text = kubunArray[0] as? String
        txtKubun.inputView = picKubun //これでテキストフィールドとピッカービューを紐付け
        txtKubun.inputAccessoryView = toolbar //上で設定したポップアップと紐付け
        txtKubun.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txtKubun)
        //非常招集区分PickerView
        picKubun.delegate = self
        picKubun.dataSource = self
        picKubun.translatesAutoresizingMaskIntoConstraints = false
        picKubun.tag = 1
        picKubun.selectRow(0, inComponent:0, animated:false)
        
        //所属(大分類)ラベル
        lblSyozoku0.text = "■所属(大分類)"
        lblSyozoku0.adjustsFontSizeToFitWidth = true
        lblSyozoku0.textAlignment = NSTextAlignment.Left
        lblSyozoku0.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblSyozoku0)
        //所属(大分類)テキストフィールド
        txtSyozoku0.borderStyle = UITextBorderStyle.Bezel
        txtSyozoku0.text = syozoku0Array[0] as? String
        txtSyozoku0.inputView = picSyozoku0
        txtSyozoku0.inputAccessoryView = toolbar
        txtSyozoku0.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txtSyozoku0)
        //所属(大分類)PickerView
        picSyozoku0.delegate = self
        picSyozoku0.dataSource = self
        picSyozoku0.translatesAutoresizingMaskIntoConstraints = false
        picSyozoku0.tag = 2
        picSyozoku0.selectRow(0, inComponent:0, animated:false) //呼び出したrow値でピッカー初期化

        //所属(小分類)ラベル
        lblSyozoku.text = "■所属(小分類)"
        lblSyozoku.adjustsFontSizeToFitWidth = true
        lblSyozoku.textAlignment = NSTextAlignment.Left
        lblSyozoku.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblSyozoku)
        //所属(小分類)テキストフィールド
        txtSyozoku.borderStyle = UITextBorderStyle.Bezel
        txtSyozoku.text = syozokuArray[0][0] as? String
        txtSyozoku.inputView = picSyozoku
        txtSyozoku.inputAccessoryView = toolbar
        txtSyozoku.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txtSyozoku)
        //所属(小分類)PickerView
        picSyozoku.delegate = self
        picSyozoku.dataSource = self
        picSyozoku.translatesAutoresizingMaskIntoConstraints = false
        picSyozoku.tag = 3
        picSyozoku.selectRow(0, inComponent:0, animated:false)
        
        //勤務区分ラベル
        lblKinmu.text = "■勤務区分"
        lblKinmu.adjustsFontSizeToFitWidth = true
        lblKinmu.textAlignment = NSTextAlignment.Left
        lblKinmu.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKinmu)
        //勤務区分テキストフィールド
        txtKinmu.borderStyle = UITextBorderStyle.Bezel
        txtKinmu.text = kinmuArray[0] as? String
        txtKinmu.inputView = picKinmu
        txtKinmu.inputAccessoryView = toolbar
        txtKinmu.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txtKinmu)
        //勤務区分ピッカービュー
        picKinmu.delegate = self
        picKinmu.dataSource = self
        picKinmu.translatesAutoresizingMaskIntoConstraints = false
        picKinmu.tag = 4
        picKinmu.selectRow(0, inComponent:0, animated:false)
        
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
            //電話テキストフィールド
            Constraint(txtTel, .Top, to:txtName, .Bottom, constant:24),
            Constraint(txtTel, .Leading, to:self.view, .Leading, constant:16),
            Constraint(txtTel, .Trailing, to:self.view, .Trailing, constant:-16)
            ])
        self.view.addConstraints([
            //メールアドレステキストフィールド
            Constraint(txtMail, .Top, to:txtTel, .Bottom, constant:24),
            Constraint(txtMail, .Leading, to:self.view, .Leading, constant:16),
            Constraint(txtMail, .Trailing, to:self.view, .Trailing, constant:-16)
            ])
        self.view.addConstraints([
            //非常招集区分ラベル
            Constraint(lblKubun, .Top, to:txtMail, .Bottom, constant:24),
            Constraint(lblKubun, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblKubun, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //非常招集区分テキストフィールド
            Constraint(txtKubun, .Top, to:txtMail, .Bottom, constant:24),
            Constraint(txtKubun, .Leading, to:self.view, .CenterX, constant:0),
            Constraint(txtKubun, .Trailing, to:self.view, .Trailing, constant:-16)
            ])
        self.view.addConstraints([
            //所属(大分類)ラベル
            Constraint(lblSyozoku0, .Top, to:lblKubun, .Bottom, constant:24),
            Constraint(lblSyozoku0, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblSyozoku0, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //所属(大分類)テキストフィールド
            Constraint(txtSyozoku0, .Top, to:lblKubun, .Bottom, constant:24),
            Constraint(txtSyozoku0, .Leading, to:self.view, .CenterX, constant:0),
            Constraint(txtSyozoku0, .Trailing, to:self.view, .Trailing, constant:-16)
            ])
        self.view.addConstraints([
            //所属(小分類)ラベル
            Constraint(lblSyozoku, .Top, to:lblSyozoku0, .Bottom, constant:24),
            Constraint(lblSyozoku, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblSyozoku, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //所属(小分類)テキストフィールド
            Constraint(txtSyozoku, .Top, to:lblSyozoku0, .Bottom, constant:24),
            Constraint(txtSyozoku, .Leading, to:self.view, .CenterX, constant:0),
            Constraint(txtSyozoku, .Trailing, to:self.view, .Trailing, constant:-16)
            ])
        self.view.addConstraints([
            //勤務区分ラベル
            Constraint(lblKinmu, .Top, to:lblSyozoku, .Bottom, constant:24),
            Constraint(lblKinmu, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblKinmu, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //勤務区分テキストフィールド
            Constraint(txtKinmu, .Top, to:lblSyozoku, .Bottom, constant:24),
            Constraint(txtKinmu, .Leading, to:self.view, .CenterX, constant:0),
            Constraint(txtKinmu, .Trailing, to:self.view, .Trailing, constant:-16)
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
        var rowNum: Int = 1
        switch pickerView.tag {
        case 1:
            rowNum = kubunArray.count
            break
        case 2:
            rowNum = syozoku0Array.count
            break
        case 3:
            rowNum = syozokuArray[syozoku0Index].count
            break
        case 4:
            rowNum = kinmuArray.count
            break
        default:
            rowNum = kubunArray.count
            break
        }
        
        return rowNum
    }
    
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
        //返す列
        var picComponent: String?
        switch pickerView.tag {
        case 1:
            picComponent = kubunArray[row] as? String
            break
        case 2:
            picComponent = syozoku0Array[row] as? String
            break
        case 3:
            picComponent = syozokuArray[syozoku0Index][row] as? String
            break
        case 4:
            picComponent = kinmuArray[row] as? String
            break
        default:
            picComponent = kubunArray[row] as? String
            break
        }

        return picComponent
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row:Int, inComponent component:Int) {
        print("列:\(row)")
        switch pickerView.tag {
        case 1:
            txtKubun.text = kubunArray[row] as? String
            break
        case 2:
            txtSyozoku0.text = syozoku0Array[row] as? String
            //所属(小分類)の表示を変更
            syozoku0Index = row
            txtSyozoku.text = syozokuArray[syozoku0Index][0] as? String
            break
        case 3:
            txtSyozoku.text = syozokuArray[syozoku0Index][row] as? String
            break
        case 4:
            txtKinmu.text = kinmuArray[row] as? String
            break
        default:
            break
        }
    }
    
    //ツールバーで選択ボタンを押した時
    func selectRow(){
        txtKubun.endEditing(true) //閉じるアクション
        txtSyozoku0.endEditing(true)
        txtSyozoku.endEditing(true)
        txtKinmu.endEditing(true)
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
