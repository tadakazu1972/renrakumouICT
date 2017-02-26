//
//  ContactSearchViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/02/26.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class ContactSearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    //メイン画面
    let lblData         = UILabel(frame: CGRectZero)
    let btnSelectAll    = UIButton(frame: CGRectZero)
    let lblSearch1      = UILabel(frame: CGRectZero)
    let lblSearch2      = UILabel(frame: CGRectZero)
    let lblKubun        = UILabel(frame: CGRectZero)
    let txtKubun        = UITextField(frame: CGRectZero)
    let picKubun        = UIPickerView(frame: CGRectZero)
    let kubunArray: NSArray = ["すべて","１号招集","２号招集","３号招集","４号招集"]
    let lblSyozoku0     = UILabel(frame: CGRectZero)
    let txtSyozoku0     = UITextField(frame: CGRectZero)
    let picSyozoku0     = UIPickerView(frame: CGRectZero)
    let syozoku0Array: NSArray = ["すべて","消防局","北","都島","福島","此花","中央","西","港","大正","天王寺","浪速","西淀川","淀川","東淀川","東成","生野","旭","城東","鶴見","住之江","阿倍野","住吉","東住吉","平野","西成","水上","教育訓練センター"]
    let lblSyozoku      = UILabel(frame: CGRectZero)
    let txtSyozoku      = UITextField(frame: CGRectZero)
    let picSyozoku      = UIPickerView(frame: CGRectZero)
    let syozokuArray: NSArray = [["すべて"],
                                 ["すべて","総務課","人事課","施設課","予防課","規制課","警防課","司令課","救急課"],
                                 ["すべて","北本署","梅田","浮田","南森町","与力","大淀町","本庄"],
                                 ["すべて","都島本署","高倉","東野田"],
                                 ["すべて","福島本署","上福島","海老江"],
                                 ["すべて","此花本署","桜島","西九条"],
                                 ["すべて","中央本署","東雲","道頓堀","南坂町","上町"],
                                 ["すべて","西本署","江戸堀","新町"],
                                 ["すべて","港本署","田中"],
                                 ["すべて","大正本署","泉尾","鶴町"],
                                 ["すべて","天王寺本署","元町"],
                                 ["すべて","浪速本署","恵美須","立葉","浪速出張所"],
                                 ["すべて","西淀川本署","佃","大和田","竹島"],
                                 ["すべて","淀川本署","十三橋","加島","東三国"],
                                 ["すべて","東淀川本署","豊里","小松","井高野","柴島","西淡路"],
                                 ["すべて","東成本署","中本","深江"],
                                 ["すべて","生野本署","勝山","中川","巽"],
                                 ["すべて","旭本署","新森","赤川"],
                                 ["すべて","城東本署","放出","中浜","関目"],
                                 ["すべて","鶴見本署","今津","矢田"],
                                 ["すべて","住之江本署","平林","加賀屋","南港"],
                                 ["すべて","阿倍野本署","清明通","阪南"],
                                 ["すべて","住吉本署","苅田","万代"],
                                 ["すべて","東住吉本署","北田辺","杭全","矢田"],
                                 ["すべて","平野本署","加美","長吉","喜連","加美正覚寺"],
                                 ["すべて","西成本署","海道","津守"],
                                 ["すべて","水上"],
                                 ["すべて","教育訓練センター"]]
    let lblKinmu        = UILabel(frame: CGRectZero)
    let txtKinmu        = UITextField(frame: CGRectZero)
    let picKinmu        = UIPickerView(frame: CGRectZero)
    let kinmuArray: NSArray = ["すべて","日勤","１部","２部"]
    let btnSearch       = UIButton(frame: CGRectZero)
    let btnCancel       = UIButton(frame: CGRectZero)
    //別クラスのインスタンス保持用変数
    private var mInfoDialog: InfoDialog!
    private var mContactLoadDialog2: ContactLoadDialog2!
    //所属(大分類)のインデックス保存用
    private var syozoku0Index : Int = 0
    //SQLite用
    internal var mDBHelper: DBHelper!
    //ContactUpdateSelectDialogから送られてくる各テキストフィールドに放り込むデータ保存用
    private var mSelected: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mDBHelper = DBHelper()
        
        self.view.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        //連絡網ラベル
        lblData.text = "連絡網"
        lblData.adjustsFontSizeToFitWidth = true
        lblData.textColor = UIColor.blackColor()
        lblData.textAlignment = NSTextAlignment.Left
        lblData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblData)
        //全部選択ボタン
        btnSelectAll.backgroundColor = UIColor.lightGrayColor()
        btnSelectAll.layer.masksToBounds = true
        btnSelectAll.setTitle("データ全件一覧表示", forState: UIControlState.Normal)
        btnSelectAll.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnSelectAll.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnSelectAll.layer.cornerRadius = 8.0
        btnSelectAll.addTarget(self, action: #selector(self.onClickbtnSelectAll(_:)), forControlEvents: .TouchUpInside)
        btnSelectAll.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnSelectAll)
        //グループ検索ラベル
        lblSearch1.text = "■グループ検索"
        lblSearch1.adjustsFontSizeToFitWidth = true
        lblSearch1.textAlignment = NSTextAlignment.Left
        lblSearch1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblSearch1)
        //グループ検索の説明文ラベル
        lblSearch2.text = "以下の条件を設定し「検索」を押してください"
        lblSearch2.adjustsFontSizeToFitWidth = true
        lblSearch2.textAlignment = NSTextAlignment.Left
        lblSearch2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblSearch2)
        
        //pickerViewとともにポップアップするツールバーとボタンの設定
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(title:"選択", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.selectRow))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil) //小ワザ。上の選択ボタンを右寄せにするためのダミースペース
        toolbar.setItems([flexibleSpace, doneItem], animated: true)
        
        //非常招集区分ラベル
        lblKubun.text = "・非常招集区分"
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
        lblSyozoku0.text = "・所属(大分類)"
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
        lblSyozoku.text = "・所属(小分類)"
        lblSyozoku.adjustsFontSizeToFitWidth = true
        lblSyozoku.textAlignment = NSTextAlignment.Left
        lblSyozoku.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblSyozoku)
        //所属(小分類)テキストフィールド
        txtSyozoku.borderStyle = UITextBorderStyle.Bezel
        txtSyozoku.text = "すべて"
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
        lblKinmu.text = "・勤務区分"
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
        btnCancel.addTarget(self, action: #selector(self.onClickbtnCancel(_:)), forControlEvents: .TouchUpInside)
        btnCancel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnCancel)
        //検索ボタン
        btnSearch.backgroundColor = UIColor.redColor()
        btnSearch.layer.masksToBounds = true
        btnSearch.setTitle("検索", forState: UIControlState.Normal)
        btnSearch.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnSearch.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        btnSearch.layer.cornerRadius = 8.0
        btnSearch.addTarget(self, action: #selector(self.onClickbtnSearch(_:)), forControlEvents: .TouchUpInside)
        btnSearch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnSearch)
        
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
            //全件一覧表示ボタン
            Constraint(btnSelectAll, .Top, to:lblData, .Bottom, constant:24),
            Constraint(btnSelectAll, .Leading, to:self.view, .Leading, constant:16),
            Constraint(btnSelectAll, .Trailing, to:self.view, .Trailing, constant:-16)
            ])
        self.view.addConstraints([
            //グループ検索ラベル
            Constraint(lblSearch1, .Top, to:btnSelectAll, .Bottom, constant:36),
            Constraint(lblSearch1, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblSearch1, .Trailing, to:self.view, .Trailing, constant:-16)
            ])
        self.view.addConstraints([
            //グループ検索の説明ラベル
            Constraint(lblSearch2, .Top, to:lblSearch1, .Bottom, constant:24),
            Constraint(lblSearch2, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblSearch2, .Trailing, to:self.view, .Trailing, constant:-16)
            ])
        self.view.addConstraints([
            //非常招集区分ラベル
            Constraint(lblKubun, .Top, to:lblSearch2, .Bottom, constant:24),
            Constraint(lblKubun, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblKubun, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //非常招集区分テキストフィールド
            Constraint(txtKubun, .Top, to:lblSearch2, .Bottom, constant:24),
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
            //検索ボタン
            Constraint(btnSearch, .Bottom, to:self.view, .Bottom, constant:-10),
            Constraint(btnSearch, .Leading, to:self.view, .CenterX, constant:8),
            Constraint(btnSearch, .Trailing, to:self.view, .Trailing, constant:-8),
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
            picComponent = (syozokuArray[syozoku0Index] as! NSArray)[row] as? String
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
            txtSyozoku.text = (syozokuArray[syozoku0Index] as! NSArray)[0] as? String
            break
        case 3:
            txtSyozoku.text = (syozokuArray[syozoku0Index] as! NSArray)[row] as? String
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
    
    //全件一覧表示ボタンクリック
    func onClickbtnSelectAll(sender : UIButton){
        mDBHelper.selectAll()
        mContactLoadDialog2 = ContactLoadDialog2(parentView: self, resultFrom: mDBHelper.resultArray)
        mContactLoadDialog2.showResult()
    }
    
    //検索ボタンクリック
    func onClickbtnSearch(sender : UIButton){
        //DBにつないでselect文実行
        mDBHelper.select(txtKubun.text!, syozoku0: txtSyozoku0.text!, syozoku: txtSyozoku.text!, kinmu: txtKinmu.text!)
        mContactLoadDialog2 = ContactLoadDialog2(parentView: self, resultFrom: mDBHelper.resultArray)
        mContactLoadDialog2.showResult()
    }
    
    //キャンセルボタンクリック
    func onClickbtnCancel(sender : UIButton){
        //自己を破棄し、呼び出し元へ遷移
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
