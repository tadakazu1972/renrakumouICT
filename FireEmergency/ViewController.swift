//
//  ViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/09/11.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    //メイン画面
    let lblData         = UILabel(frame: CGRect.zero)
    let btnSelectAll    = UIButton(frame: CGRect.zero)
    let lblSearch1      = UILabel(frame: CGRect.zero)
    let lblSearch2      = UILabel(frame: CGRect.zero)
    let lblKubun        = UILabel(frame: CGRect.zero)
    let txtKubun        = UITextField(frame: CGRect.zero)
    let picKubun        = UIPickerView(frame: CGRect.zero)
    let kubunArray: NSArray = ["すべて","１号","２号","３号","４号"]
    let lblSyozoku0     = UILabel(frame: CGRect.zero)
    let txtSyozoku0     = UITextField(frame: CGRect.zero)
    let picSyozoku0     = UIPickerView(frame: CGRect.zero)
    let syozoku0Array: NSArray = ["すべて","企画担当","活用推進担当","システムマネジメント担当"]
    let lblSyozoku      = UILabel(frame: CGRect.zero)
    let txtSyozoku      = UITextField(frame: CGRect.zero)
    let picSyozoku      = UIPickerView(frame: CGRect.zero)
    let syozokuArray: NSArray = [["すべて"],
                                 ["すべて","企画グループ","支援グループ"],
                                 ["すべて","活用推進グループ","基盤グループ"],
                                 ["すべて","システムマネジメント担当"]]
    let lblKinmu        = UILabel(frame: CGRect.zero)
    let txtKinmu        = UITextField(frame: CGRect.zero)
    let picKinmu        = UIPickerView(frame: CGRect.zero)
    let kinmuArray: NSArray = ["すべて","本庁舎","阿波座センタービル","災害本部","阿倍野防災センター","北区役所","都島区役所","福島区役所","此花区役所","中央区役所","西区役所","港区役所","大正区役所","天王寺区役所","浪速区役所","西淀川区役所","淀川区役所","東淀川区役所","東成区役所","生野区役所","旭区役所","城東区役所","鶴見区役所","住之江区役所","阿倍野区役所","住吉区役所","東住吉区役所","平野区役所","西成区役所"]
    let btnSearch       = UIButton(frame: CGRect.zero)
    let btnCancel       = UIButton(frame: CGRect.zero)
    //震度ボタン
    let btnEarthquake1  = UIButton(frame: CGRect.zero)
    let btnEarthquake2  = UIButton(frame: CGRect.zero)
    let btnEarthquake3  = UIButton(frame: CGRect.zero)
    let btnEarthquake4  = UIButton(frame: CGRect.zero)
    //情報ボタン類
    let btnEarthquakeEarthquake = UIButton(frame: CGRect.zero)
    let btnEarthquakeBlackout   = UIButton(frame: CGRect.zero)
    let btnEarthquakeRoad       = UIButton(frame: CGRect.zero)
    let btnEarthquakeTel        = UIButton(frame: CGRect.zero)
    let btnEarthquakeCaution    = UIButton(frame: CGRect.zero)
    let btnEarthquakeBousaiNet  = UIButton(frame: CGRect.zero)
    let pad21            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad22            = UIView(frame: CGRect.zero)
    let pad23            = UIView(frame: CGRect.zero)
    let pad31            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad32            = UIView(frame: CGRect.zero)
    let pad33            = UIView(frame: CGRect.zero)
    //別クラスのインスタンス保持用変数
    fileprivate var mViewController: ViewController!
    fileprivate var mInfoDialog: InfoDialog!
    fileprivate var mBousainetDialog: BousainetDialog!
    fileprivate var mContactLoadDialog2: ContactLoadDialog2!
    fileprivate var mContactViewContoller: ContactViewController!
    //所属(大分類)のインデックス保存用
    fileprivate var syozoku0Index : Int = 0
    //データ保存用
    let userDefaults = UserDefaults.standard
    //SQLite用
    internal var mDBHelper: DBHelper!
    //ContactUpdateSelectDialogから送られてくる各テキストフィールドに放り込むデータ保存用
    fileprivate var mSelected: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DB生成
        mDBHelper = DBHelper()
        mDBHelper.createTable()
        
        //初回起動判定
        if userDefaults.bool(forKey: "firstLaunch"){
            
            //DBダミーデータ生成
            mDBHelper.insert("大阪　太郎",tel: "09066080765",mail: "tadakazu1972@gmail.com",kubun: "４号招集",syozoku0: "消防局",syozoku: "警防課",kinmu: "日勤")
            mDBHelper.insert("難波　二郎",tel: "07077777777",mail: "ta-nakamichi@city.osaka.lg.jp",kubun: "３号招集",syozoku0: "北消防署",syozoku: "与力",kinmu: "１部")
            
            //２回目以降ではfalseに
            userDefaults.set(false, forKey: "firstLaunch")
        }
        
        //背景色
        self.view.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        //連絡網ラベル
        lblData.text = "ICT戦略室災害時連絡網"
        lblData.adjustsFontSizeToFitWidth = true
        lblData.textColor = UIColor.black
        lblData.textAlignment = NSTextAlignment.left
        lblData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblData)
        //全部選択ボタン
        btnSelectAll.backgroundColor = UIColor.blue
        btnSelectAll.layer.masksToBounds = true
        btnSelectAll.setTitle("データ全件一覧表示", for: UIControlState())
        btnSelectAll.setTitleColor(UIColor.white, for: UIControlState())
        btnSelectAll.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnSelectAll.layer.cornerRadius = 8.0
        btnSelectAll.addTarget(self, action: #selector(self.onClickbtnSelectAll(_:)), for: .touchUpInside)
        btnSelectAll.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnSelectAll)
        //グループ検索ラベル
        lblSearch1.text = "■グループ検索"
        lblSearch1.adjustsFontSizeToFitWidth = true
        lblSearch1.textAlignment = NSTextAlignment.left
        lblSearch1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblSearch1)
        //グループ検索の説明文ラベル
        lblSearch2.text = "以下の条件を設定し「検索」を押してください"
        lblSearch2.adjustsFontSizeToFitWidth = true
        lblSearch2.textAlignment = NSTextAlignment.left
        lblSearch2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblSearch2)
        
        //pickerViewとともにポップアップするツールバーとボタンの設定
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 35))
        let doneItem = UIBarButtonItem(title:"選択", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.selectRow))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil) //小ワザ。上の選択ボタンを右寄せにするためのダミースペース
        toolbar.setItems([flexibleSpace, doneItem], animated: true)
        
        //非常招集区分ラベル
        lblKubun.text = "・非常招集区分"
        lblKubun.adjustsFontSizeToFitWidth = true
        lblKubun.textAlignment = NSTextAlignment.left
        lblKubun.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKubun)
        //非常招集区分テキストフィールド
        txtKubun.borderStyle = UITextBorderStyle.bezel
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
        lblSyozoku0.text = "・担当"
        lblSyozoku0.adjustsFontSizeToFitWidth = true
        lblSyozoku0.textAlignment = NSTextAlignment.left
        lblSyozoku0.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblSyozoku0)
        //所属(大分類)テキストフィールド
        txtSyozoku0.borderStyle = UITextBorderStyle.bezel
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
        lblSyozoku.text = "・グループ"
        lblSyozoku.adjustsFontSizeToFitWidth = true
        lblSyozoku.textAlignment = NSTextAlignment.left
        lblSyozoku.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblSyozoku)
        //所属(小分類)テキストフィールド
        txtSyozoku.borderStyle = UITextBorderStyle.bezel
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
        lblKinmu.text = "・参集場所"
        lblKinmu.adjustsFontSizeToFitWidth = true
        lblKinmu.textAlignment = NSTextAlignment.left
        lblKinmu.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKinmu)
        //勤務区分テキストフィールド
        txtKinmu.borderStyle = UITextBorderStyle.bezel
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
        
        
        
        //震度５強以上
        btnEarthquake1.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake1.layer.masksToBounds = true
        btnEarthquake1.setTitle("震度５強以上", for: UIControlState())
        btnEarthquake1.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquake1.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnEarthquake1.tag=5
        btnEarthquake1.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquake1.addTarget(self, action: #selector(self.showSelectEarthquake1(_:)), for: .touchUpInside)
        self.view.addSubview(btnEarthquake1)
        //震度５弱
        btnEarthquake2.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake2.layer.masksToBounds = true
        btnEarthquake2.setTitle("震度５弱", for: UIControlState())
        btnEarthquake2.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquake2.tag=6
        btnEarthquake2.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquake2.addTarget(self, action: #selector(self.showSelectEarthquake2(_:)), for: .touchUpInside)
        self.view.addSubview(btnEarthquake2)
        //震度４
        btnEarthquake3.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake3.layer.masksToBounds = true
        btnEarthquake3.setTitle("震度４", for: UIControlState())
        btnEarthquake3.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquake3.tag=7
        btnEarthquake3.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquake3.addTarget(self, action: #selector(self.showSelectEarthquake3(_:)), for: .touchUpInside)
        self.view.addSubview(btnEarthquake3)
        //震度３以下
        btnEarthquake4.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake4.layer.masksToBounds = true
        btnEarthquake4.setTitle("震度３以下", for: UIControlState())
        btnEarthquake4.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquake4.tag=8
        btnEarthquake4.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquake4.addTarget(self, action: #selector(self.showSelectEarthquake4(_:)), for: .touchUpInside)
        self.view.addSubview(btnEarthquake4)
        
        //情報（地震）
        btnEarthquakeEarthquake.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquakeEarthquake.layer.masksToBounds = true
        btnEarthquakeEarthquake.setTitle("情報(地震)", for: UIControlState())
        btnEarthquakeEarthquake.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquakeEarthquake.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnEarthquakeEarthquake.tag=10
        btnEarthquakeEarthquake.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeEarthquake.addTarget(self, action: #selector(self.showInfoEarthquake(_:)), for: .touchUpInside)
        self.view.addSubview(btnEarthquakeEarthquake)
        //情報（停電）
        btnEarthquakeBlackout.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquakeBlackout.layer.masksToBounds = true
        btnEarthquakeBlackout.setTitle("情報(停電)", for: UIControlState())
        btnEarthquakeBlackout.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquakeBlackout.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnEarthquakeBlackout.tag=11
        btnEarthquakeBlackout.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeBlackout.addTarget(self, action: #selector(self.showInfoBlackout(_:)), for: .touchUpInside)
        self.view.addSubview(btnEarthquakeBlackout)
        //情報（道路）
        btnEarthquakeRoad.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquakeRoad.layer.masksToBounds = true
        btnEarthquakeRoad.setTitle("情報(道路)", for: UIControlState())
        btnEarthquakeRoad.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquakeRoad.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnEarthquakeRoad.tag=12
        btnEarthquakeRoad.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeRoad.addTarget(self, action: #selector(self.showInfoRoad(_:)), for: .touchUpInside)
        self.view.addSubview(btnEarthquakeRoad)
        //連絡網
        btnEarthquakeTel.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquakeTel.layer.masksToBounds = true
        btnEarthquakeTel.setTitle("連絡網", for: UIControlState())
        btnEarthquakeTel.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquakeTel.tag=13
        btnEarthquakeTel.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeTel.addTarget(self, action: #selector(self.showContactLoad(_:)), for: .touchUpInside)
        self.view.addSubview(btnEarthquakeTel)
        //留意事項
        btnEarthquakeCaution.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquakeCaution.layer.masksToBounds = true
        btnEarthquakeCaution.setTitle("留意事項", for: UIControlState())
        btnEarthquakeCaution.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquakeCaution.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnEarthquakeCaution.tag=14
        btnEarthquakeCaution.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeCaution.addTarget(self, action: #selector(ViewController.showInfoCaution(_:)), for: .touchUpInside)
        self.view.addSubview(btnEarthquakeCaution)
        //防災ネット
        btnEarthquakeBousaiNet.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquakeBousaiNet.layer.masksToBounds = true
        btnEarthquakeBousaiNet.setTitle("防災ネット", for: UIControlState())
        btnEarthquakeBousaiNet.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquakeBousaiNet.tag=15
        btnEarthquakeBousaiNet.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeBousaiNet.addTarget(self, action: #selector(ViewController.showInfoBousainet(_:)), for: .touchUpInside)
        self.view.addSubview(btnEarthquakeBousaiNet)
        //pad
        pad21.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad21)
        pad22.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad22)
        pad23.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad23)
        //pad
        pad31.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad31)
        pad32.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad32)
        pad33.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad33)
        
        //キャンセルボタン
        btnCancel.backgroundColor = UIColor.blue
        btnCancel.layer.masksToBounds = true
        btnCancel.setTitle("連絡網データ操作", for: UIControlState())
        btnCancel.setTitleColor(UIColor.white, for: UIControlState())
        btnCancel.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        btnCancel.layer.cornerRadius = 8.0
        btnCancel.addTarget(self, action: #selector(self.onClickbtnCancel(_:)), for: .touchUpInside)
        btnCancel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnCancel)
        //検索ボタン
        btnSearch.backgroundColor = UIColor.red
        btnSearch.layer.masksToBounds = true
        btnSearch.setTitle("検索", for: UIControlState())
        btnSearch.setTitleColor(UIColor.white, for: UIControlState())
        btnSearch.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        btnSearch.layer.cornerRadius = 8.0
        btnSearch.addTarget(self, action: #selector(self.onClickbtnSearch(_:)), for: .touchUpInside)
        btnSearch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnSearch)
        
        //ボタン押したら表示するDialog生成
        mInfoDialog = InfoDialog(parentView: self) //このViewControllerを渡してあげる
        mBousainetDialog = BousainetDialog(parentView: self)
    }
    
    //制約ひな型
    func Constraint(_ item: AnyObject, _ attr: NSLayoutAttribute, to: AnyObject?, _ attrTo: NSLayoutAttribute, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, relate: NSLayoutRelation = .equal, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
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
            Constraint(lblData, .top, to:self.view, .top, constant:28),
            Constraint(lblData, .leading, to:self.view, .leading, constant:16),
            Constraint(lblData, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //全件一覧表示ボタン
            Constraint(btnSelectAll, .top, to:lblData, .bottom, constant:24),
            Constraint(btnSelectAll, .leading, to:self.view, .leading, constant:16),
            Constraint(btnSelectAll, .trailing, to:self.view, .trailing, constant:-16)
            ])
        self.view.addConstraints([
            //グループ検索ラベル
            Constraint(lblSearch1, .top, to:btnSelectAll, .bottom, constant:36),
            Constraint(lblSearch1, .leading, to:self.view, .leading, constant:16),
            Constraint(lblSearch1, .trailing, to:self.view, .trailing, constant:-16)
            ])
        self.view.addConstraints([
            //グループ検索の説明ラベル
            Constraint(lblSearch2, .top, to:lblSearch1, .bottom, constant:24),
            Constraint(lblSearch2, .leading, to:self.view, .leading, constant:16),
            Constraint(lblSearch2, .trailing, to:self.view, .trailing, constant:-16)
            ])
        self.view.addConstraints([
            //非常招集区分ラベル
            Constraint(lblKubun, .top, to:lblSearch2, .bottom, constant:24),
            Constraint(lblKubun, .leading, to:self.view, .leading, constant:16),
            Constraint(lblKubun, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //非常招集区分テキストフィールド
            Constraint(txtKubun, .top, to:lblSearch2, .bottom, constant:24),
            Constraint(txtKubun, .leading, to:self.view, .centerX, constant:0),
            Constraint(txtKubun, .trailing, to:self.view, .trailing, constant:-16)
            ])
        self.view.addConstraints([
            //所属(大分類)ラベル
            Constraint(lblSyozoku0, .top, to:lblKubun, .bottom, constant:24),
            Constraint(lblSyozoku0, .leading, to:self.view, .leading, constant:16),
            Constraint(lblSyozoku0, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //所属(大分類)テキストフィールド
            Constraint(txtSyozoku0, .top, to:lblKubun, .bottom, constant:24),
            Constraint(txtSyozoku0, .leading, to:self.view, .centerX, constant:0),
            Constraint(txtSyozoku0, .trailing, to:self.view, .trailing, constant:-16)
            ])
        self.view.addConstraints([
            //所属(小分類)ラベル
            Constraint(lblSyozoku, .top, to:lblSyozoku0, .bottom, constant:24),
            Constraint(lblSyozoku, .leading, to:self.view, .leading, constant:16),
            Constraint(lblSyozoku, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //所属(小分類)テキストフィールド
            Constraint(txtSyozoku, .top, to:lblSyozoku0, .bottom, constant:24),
            Constraint(txtSyozoku, .leading, to:self.view, .centerX, constant:0),
            Constraint(txtSyozoku, .trailing, to:self.view, .trailing, constant:-16)
            ])
        self.view.addConstraints([
            //勤務区分ラベル
            Constraint(lblKinmu, .top, to:lblSyozoku, .bottom, constant:24),
            Constraint(lblKinmu, .leading, to:self.view, .leading, constant:16),
            Constraint(lblKinmu, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //勤務区分テキストフィールド
            Constraint(txtKinmu, .top, to:lblSyozoku, .bottom, constant:24),
            Constraint(txtKinmu, .leading, to:self.view, .centerX, constant:0),
            Constraint(txtKinmu, .trailing, to:self.view, .trailing, constant:-16)
            ])
        self.view.addConstraints([
            //キャンセルボタン
            Constraint(btnCancel, .bottom, to:self.view, .bottom, constant:-10),
            Constraint(btnCancel, .leading, to:self.view, .leading, constant:8),
            Constraint(btnCancel, .trailing, to:self.view, .centerX, constant:-8)
            ])
        self.view.addConstraints([
            //検索ボタン
            Constraint(btnSearch, .bottom, to:self.view, .bottom, constant:-10),
            Constraint(btnSearch, .leading, to:self.view, .centerX, constant:8),
            Constraint(btnSearch, .trailing, to:self.view, .trailing, constant:-8),
            ])
        
        //震度ボタン
        self.view.addConstraints([
            //震度５強以上ボタン
            Constraint(btnEarthquake1, .top, to:lblKinmu, .bottom, constant:32),
            Constraint(btnEarthquake1, .leading, to:self.view, .leading, constant:8),
            Constraint(btnEarthquake1, .width, to:self.view, .width, constant:0, multiplier:0.2)
            ])
        self.view.addConstraints([
            //震度５弱ボタン
            Constraint(btnEarthquake2, .top, to:lblKinmu, .bottom, constant:32),
            Constraint(btnEarthquake2, .leading, to:btnEarthquake1, .trailing, constant:8),
            Constraint(btnEarthquake2, .width, to:self.view, .width, constant:0, multiplier:0.2)
            ])
        self.view.addConstraints([
            //震度４ボタン
            Constraint(btnEarthquake3, .top, to:lblKinmu, .bottom, constant:32),
            Constraint(btnEarthquake3, .leading, to:btnEarthquake2, .trailing, constant:8),
            Constraint(btnEarthquake3, .width, to:self.view, .width, constant:0, multiplier:0.2)
            ])
        self.view.addConstraints([
            //震度３以下ボタン
            Constraint(btnEarthquake4, .top, to:lblKinmu, .bottom, constant:32),
            Constraint(btnEarthquake4, .leading, to:btnEarthquake3, .trailing, constant:8),
            Constraint(btnEarthquake4, .width, to:self.view, .width, constant:0, multiplier:0.2)
            ])
        
        //情報ボタン
        self.view.addConstraints([
            //pad21
            Constraint(pad21, .bottom, to:btnEarthquakeTel, .top, constant:-8),
            Constraint(pad21, .leading, to:self.view, .leading, constant:0),
            Constraint(pad21, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(地震)ボタン
            Constraint(btnEarthquakeEarthquake, .bottom, to:btnEarthquakeTel, .top, constant:-8),
            Constraint(btnEarthquakeEarthquake, .leading, to:pad21, .trailing, constant:0),
            Constraint(btnEarthquakeEarthquake, .width, to:self.view, .width, constant:0, multiplier:0.3)
            ])
        self.view.addConstraints([
            //pad22
            Constraint(pad22, .bottom, to:btnEarthquakeTel, .top, constant:-8),
            Constraint(pad22, .leading, to:btnEarthquakeEarthquake, .trailing, constant:0),
            Constraint(pad22, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(停電)ボタン
            Constraint(btnEarthquakeBlackout, .bottom, to:btnEarthquakeTel, .top, constant:-8),
            Constraint(btnEarthquakeBlackout, .leading, to:pad22, .trailing, constant:0),
            Constraint(btnEarthquakeBlackout, .width, to:btnEarthquakeEarthquake, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad23
            Constraint(pad23, .bottom, to:btnEarthquakeTel, .top, constant:-8),
            Constraint(pad23, .leading, to:btnEarthquakeBlackout, .trailing, constant:0),
            Constraint(pad23, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(道路)ボタン
            Constraint(btnEarthquakeRoad, .bottom, to:btnEarthquakeTel, .top ,constant:-8),
            Constraint(btnEarthquakeRoad, .leading, to:pad23, .trailing, constant:0),
            Constraint(btnEarthquakeRoad, .width, to:btnEarthquakeEarthquake, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad31
            Constraint(pad31, .top, to:btnEarthquakeEarthquake, .bottom, constant:8),
            Constraint(pad31, .leading, to:self.view, .leading, constant:0),
            Constraint(pad31, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //連絡網ボタン
            Constraint(btnEarthquakeTel, .bottom, to:btnSearch, .top, constant:-32),
            Constraint(btnEarthquakeTel, .leading, to:pad31, .trailing, constant:0),
            Constraint(btnEarthquakeTel, .width, to:self.view, .width, constant:0, multiplier:0.3)
            ])
        self.view.addConstraints([
            //pad32
            Constraint(pad32, .bottom, to:btnSearch, .top, constant:-8),
            Constraint(pad32, .leading, to:btnEarthquakeTel, .trailing, constant:0),
            Constraint(pad32, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //留意事項ボタン
            Constraint(btnEarthquakeCaution, .bottom, to:btnSearch, .top, constant:-32),
            Constraint(btnEarthquakeCaution, .leading, to:pad32, .trailing, constant:0),
            Constraint(btnEarthquakeCaution, .width, to:btnEarthquakeTel, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad33
            Constraint(pad33, .bottom, to:btnSearch, .top, constant:-8),
            Constraint(pad33, .leading, to:btnEarthquakeCaution, .trailing, constant:0),
            Constraint(pad33, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //防災ネットボタン
            Constraint(btnEarthquakeBousaiNet, .bottom, to:btnSearch, .top ,constant:-32),
            Constraint(btnEarthquakeBousaiNet, .leading, to:pad33, .trailing, constant:0),
            Constraint(btnEarthquakeBousaiNet, .width, to:btnEarthquakeTel, .width, constant:0)
            ])
    }
    
    //表示例数
    func numberOfComponents(in pickerView: UIPickerView)-> Int{
        return 1
    }
    
    //表示行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int{
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
            rowNum = (syozokuArray[syozoku0Index] as AnyObject).count
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
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row:Int, inComponent component:Int) {
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
    func onClickbtnSelectAll(_ sender : UIButton){
        mDBHelper.selectAll()
        mContactLoadDialog2 = ContactLoadDialog2(parentView: self, resultFrom: mDBHelper.resultArray)
        mContactLoadDialog2.showResult()
    }
    
    //震度５強以上
    func showSelectEarthquake1(_ sender: UIButton){
    }
    
    //震度５弱
    func showSelectEarthquake2(_ sender: UIButton){
    }
    
    //震度４
    func showSelectEarthquake3(_ sender: UIButton){
    }
    
    //震度３以下
    func showSelectEarthquake4(_ sender: UIButton){
    }
    
    //情報(地震)
    func showInfoEarthquake(_ sender: UIButton){
        mInfoDialog.showInfo("earthquake")
    }
    
    //情報（道路）
    func showInfoRoad(_ sender: UIButton){
        mInfoDialog.showInfo("road")
    }
    
    //連絡網
    func showContactLoad(_ sender: UIButton){
        let data:ContactViewController = ContactViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.present(nav, animated: true, completion: nil)
    }
    
    //情報（停電）
    func showInfoBlackout(_ sender: UIButton){
        mInfoDialog.showInfo("blackout")
    }
    
    //留意事項
    func showInfoCaution(_ sender: UIButton){
        mInfoDialog.showInfo("caution")
    }
    
    //防災ネット
    func showInfoBousainet(_ sender: UIButton){
        mBousainetDialog.showInfo()
    }
    
    //検索ボタンクリック
    func onClickbtnSearch(_ sender : UIButton){
        //DBにつないでselect文実行
        mDBHelper.select(txtKubun.text!, syozoku0: txtSyozoku0.text!, syozoku: txtSyozoku.text!, kinmu: txtKinmu.text!)
        mContactLoadDialog2 = ContactLoadDialog2(parentView: self, resultFrom: mDBHelper.resultArray)
        mContactLoadDialog2.showResult()
    }
    
    //連絡網データ操作ボタンクリック
    func onClickbtnCancel(_ sender : UIButton){
        let data:ContactViewController = ContactViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.present(nav, animated: true, completion: nil)
    }
    
    //いつものん
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

