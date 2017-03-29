//
//  ViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/09/11.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //メイン画面
    let btnData         = UIButton(frame: CGRect.zero)
    let btnEarthquake   = UIButton(frame: CGRect.zero)
    let btnTyphoon      = UIButton(frame: CGRect.zero)
    let btnKokuminhogo  = UIButton(frame: CGRect.zero)
    let btnKinentai     = UIButton(frame: CGRect.zero)
    let pad1            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad2            = UIView(frame: CGRect.zero)
    let pad3            = UIView(frame: CGRect.zero)
    let pad4            = UIView(frame: CGRect.zero)
    let lblEarthquake   = UILabel(frame: CGRect.zero)
    let btnEarthquake1  = UIButton(frame: CGRect.zero)
    let btnEarthquake2  = UIButton(frame: CGRect.zero)
    let btnEarthquake3  = UIButton(frame: CGRect.zero)
    let btnEarthquake4  = UIButton(frame: CGRect.zero)
    let btnEarthquake5  = UIButton(frame: CGRect.zero)
    let padY1           = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let padY2           = UIView(frame: CGRect.zero)
    let padY3           = UIView(frame: CGRect.zero)
    let padY4           = UIView(frame: CGRect.zero)
    let padY5           = UIView(frame: CGRect.zero)
    let padY6           = UIView(frame: CGRect.zero)
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
    fileprivate var mEarthSelectDialog: EarthSelectDialog!
    fileprivate var mContactLoadDialog: ContactLoadDialog2!
    fileprivate var mPassInputDialog: PassInputDialog!
    //結果表示用クラス保持用
    internal var mEarthResultDialog: EarthResultDialog!
    //データ保存用
    let userDefaults = UserDefaults.standard
    //SQLite用
    internal var mDBHelper: DBHelper!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DB生成
        mDBHelper = DBHelper()
        mDBHelper.createTable()
        
        //初回起動判定
        if userDefaults.bool(forKey: "firstLaunch"){
            //初回起動時処理 一度も基礎データ入力されないorデータ入力画面でもスピナーをさわらない場合はセットされない=結果でnilが表示される　それを防止
            userDefaults.set("消防局", forKey: "mainStation")
            userDefaults.set("消防局", forKey: "tsunamiStation")
            userDefaults.set("１号招集", forKey: "kubun")
            
            //DBダミーデータ生成
            mDBHelper.insert("大阪　太郎",tel: "09066080765",mail: "tadakazu1972@gmail.com",kubun: "４号招集",syozoku0: "消防局",syozoku: "警防課",kinmu: "日勤")
            mDBHelper.insert("難波　二郎",tel: "07077777777",mail: "ta-nakamichi@city.osaka.lg.jp",kubun: "３号招集",syozoku0: "北消防署",syozoku: "与力",kinmu: "１部")
            
            //２回目以降ではfalseに
            userDefaults.set(false, forKey: "firstLaunch")
        }
        
        self.view.backgroundColor = UIColor(red:0.9, green:0.7, blue:0.2, alpha:1.0)
        //Button生成
        //基礎データ入力
        btnData.backgroundColor = UIColor.blue
        btnData.layer.masksToBounds = true
        btnData.setTitle("基礎データ入力", for: UIControlState())
        btnData.setTitleColor(UIColor.white, for: UIControlState())
        btnData.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        btnData.layer.cornerRadius = 8.0
        btnData.tag = 0
        btnData.addTarget(self, action: #selector(self.onClickbtnData(_:)), for: .touchUpInside)
        btnData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnData)
        //震災
        btnEarthquake.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake.layer.masksToBounds = true
        btnEarthquake.setTitle("震災", for: UIControlState())
        btnEarthquake.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquake.tag=1
        btnEarthquake.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnEarthquake)
        //風水害
        btnTyphoon.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon.layer.masksToBounds = true
        btnTyphoon.setTitle("風水害", for: UIControlState())
        btnTyphoon.setTitleColor(UIColor.black, for: UIControlState())
        btnTyphoon.tag=2
        btnTyphoon.addTarget(self, action: #selector(self.onClickbtnTyphoon(_:)), for: .touchUpInside)
        btnTyphoon.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnTyphoon)
        //国民保護
        btnKokuminhogo.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogo.layer.masksToBounds = true
        btnKokuminhogo.setTitle("国民保", for: UIControlState())
        btnKokuminhogo.setTitleColor(UIColor.black, for: UIControlState())
        btnKokuminhogo.tag=3
        btnKokuminhogo.addTarget(self, action: #selector(self.onClickbtnKokuminhogo(_:)), for: .touchUpInside)
        btnKokuminhogo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnKokuminhogo)
        //緊援隊
        btnKinentai.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai.layer.masksToBounds = true
        btnKinentai.setTitle("緊援隊", for: UIControlState())
        btnKinentai.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentai.tag=4
        btnKinentai.addTarget(self, action: #selector(self.onClickbtnKinentai(_:)), for: .touchUpInside)
        btnKinentai.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnKinentai)
        //pad
        pad1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad1)
        pad2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad2)
        pad3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad3)
        pad4.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad4)
        //非常召集基準（震災）
        lblEarthquake.text = "非常招集基準（震災）"
        lblEarthquake.textColor = UIColor.white
        lblEarthquake.textAlignment = NSTextAlignment.center
        lblEarthquake.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblEarthquake)
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
        //東海地震に伴う非常召集
        btnEarthquake5.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake5.layer.masksToBounds = true
        btnEarthquake5.setTitle("東海地震に伴う非常招集", for: UIControlState())
        btnEarthquake5.setTitleColor(UIColor.black, for: UIControlState())
        btnEarthquake5.tag=9
        btnEarthquake5.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquake5.addTarget(self, action: #selector(self.showSelectEarthquake5(_:)), for: .touchUpInside)
        self.view.addSubview(btnEarthquake5)
        //垂直方向のpad
        padY1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY1)
        padY2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY2)
        padY3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY3)
        padY4.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY4)
        padY5.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY5)
        padY6.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY6)
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
        
        //ボタン押したら表示するDialog生成
        mInfoDialog = InfoDialog(parentView: self) //このViewControllerを渡してあげる
        mBousainetDialog = BousainetDialog(parentView: self)
        mEarthResultDialog = EarthResultDialog(parentView: self) //このViewControllerを渡してあげる
        mPassInputDialog = PassInputDialog(parentView: self)
        
        //passCheckをfalseで初期化
        userDefaults.set(false, forKey: "passCheck")
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
            //基礎データ入力ボタン
            Constraint(btnData, .top, to:self.view, .top, constant:20),
            Constraint(btnData, .leading, to:self.view, .leading, constant:8),
            Constraint(btnData, .trailing, to:self.view, .trailingMargin, constant:8)
        ])
        self.view.addConstraints([
            //pad1
            Constraint(pad1, .top, to:btnData, .bottom, constant:8),
            Constraint(pad1, .leading, to:self.view, .leading, constant:0),
            Constraint(pad1, .width, to:self.view, .width, constant:0, multiplier:0.024)
        ])
        self.view.addConstraints([
            //震災ボタン
            Constraint(btnEarthquake, .top, to:btnData, .bottom, constant:8),
            Constraint(btnEarthquake, .leading, to:pad1, .trailing, constant:0),
            Constraint(btnEarthquake, .width, to:self.view, .width, constant:0, multiplier:0.22)
        ])
        self.view.addConstraints([
            //pad2
            Constraint(pad2, .top, to:btnData, .bottom, constant:8),
            Constraint(pad2, .leading, to:btnEarthquake, .trailing, constant:0),
            Constraint(pad2, .width, to:self.view, .width, constant:0, multiplier:0.024)
        ])
        self.view.addConstraints([
            //風水害ボタン
            Constraint(btnTyphoon, .top, to:btnData, .bottom, constant:8),
            Constraint(btnTyphoon, .leading, to:pad2, .trailing, constant:0),
            Constraint(btnTyphoon, .width, to:btnEarthquake, .width, constant:0)
        ])
        self.view.addConstraints([
            //pad3
            Constraint(pad3, .top, to:btnData, .bottom, constant:8),
            Constraint(pad3, .leading, to:btnTyphoon, .trailing, constant:0),
            Constraint(pad3, .width, to:self.view, .width, constant:0, multiplier:0.024)
        ])
        self.view.addConstraints([
            //国民保護ボタン
            Constraint(btnKokuminhogo, .top, to:btnData, .bottom ,constant:8),
            Constraint(btnKokuminhogo, .leading, to:pad3, .trailing, constant:0),
            Constraint(btnKokuminhogo, .width, to:btnEarthquake, .width, constant:0)
        ])
        self.view.addConstraints([
            //pad4
            Constraint(pad4, .top, to:btnData, .bottom, constant:8),
            Constraint(pad4, .leading, to:btnKokuminhogo, .trailing, constant:0),
            Constraint(pad4, .width, to:self.view, .width, constant:0, multiplier:0.024)
        ])
        self.view.addConstraints([
            //緊援隊ボタン
            Constraint(btnKinentai, .top, to:btnData, .bottom, constant:8),
            Constraint(btnKinentai, .leading, to:pad4, .trailing, constant:0),
            Constraint(btnKinentai, .width, to:btnEarthquake, .width, constant:0)
        ])
        self.view.addConstraints([
            //padY1
            Constraint(padY1, .top, to:btnEarthquake, .bottom, constant:0),
            Constraint(padY1, .leading, to:self.view, .leading, constant:0),
            Constraint(padY1, .height, to:self.view, .height, constant:0, multiplier:0.05)
        ])
        self.view.addConstraints([
            //非常召集基準（震災）ラベル
            Constraint(lblEarthquake, .bottom, to:padY2, .top, constant:8),
            Constraint(lblEarthquake, .centerX, to:self.view, .centerX, constant:8),
            Constraint(lblEarthquake, .width, to:self.view, .width, constant:0, multiplier:0.8)
        ])
        self.view.addConstraints([
            //padY2
            Constraint(padY2, .bottom, to:btnEarthquake1, .top, constant:0),
            Constraint(padY2, .leading, to:self.view, .leading, constant:0),
            Constraint(padY2, .height, to:self.view, .height, constant:0, multiplier:0.03)
        ])
        self.view.addConstraints([
            //震度５強以上ボタン
            Constraint(btnEarthquake1, .bottom, to:padY3, .top, constant:0),
            Constraint(btnEarthquake1, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnEarthquake1, .width, to:self.view, .width, constant:0, multiplier:0.8)
        ])
        self.view.addConstraints([
            //padY3
            Constraint(padY3, .bottom, to:btnEarthquake2, .top, constant:0),
            Constraint(padY3, .leading, to:self.view, .leading, constant:0),
            Constraint(padY3, .height, to:self.view, .height, constant:0, multiplier:0.03)
        ])
        self.view.addConstraints([
            //震度５弱ボタン
            Constraint(btnEarthquake2, .bottom, to:padY4, .top, constant:0),
            Constraint(btnEarthquake2, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnEarthquake2, .width, to:self.view, .width, constant:0, multiplier:0.8)
        ])
        self.view.addConstraints([
            //padY4
            Constraint(padY4, .bottom, to:btnEarthquake3, .top, constant:0),
            Constraint(padY4, .leading, to:self.view, .leading, constant:0),
            Constraint(padY4, .height, to:self.view, .height, constant:0, multiplier:0.03)
        ])
        self.view.addConstraints([
            //震度４ボタン Y座標の中心
            Constraint(btnEarthquake3, .centerY, to:self.view, .centerY, constant:0),
            Constraint(btnEarthquake3, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnEarthquake3, .width, to:self.view, .width, constant:0, multiplier:0.8)
        ])
        self.view.addConstraints([
            //padY5
            Constraint(padY5, .top, to:btnEarthquake3, .bottom, constant:0),
            Constraint(padY5, .leading, to:self.view, .leading, constant:0),
            Constraint(padY5, .height, to:self.view, .height, constant:0, multiplier:0.03)
        ])
        self.view.addConstraints([
            //震度３以下ボタン
            Constraint(btnEarthquake4, .top, to:padY5, .bottom, constant:0),
            Constraint(btnEarthquake4, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnEarthquake4, .width, to:self.view, .width, constant:0, multiplier:0.8)
        ])
        self.view.addConstraints([
            //padY6
            Constraint(padY6, .top, to:btnEarthquake4, .bottom, constant:0),
            Constraint(padY6, .leading, to:self.view, .leading, constant:0),
            Constraint(padY6, .height, to:self.view, .height, constant:0, multiplier:0.03)
        ])
        self.view.addConstraints([
            //東海地震に伴う非常招集ボタン
            Constraint(btnEarthquake5, .top, to:padY6, .bottom, constant:0),
            Constraint(btnEarthquake5, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnEarthquake5, .width, to:self.view, .width, constant:0, multiplier:0.8)
        ])
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
            Constraint(btnEarthquakeTel, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(btnEarthquakeTel, .leading, to:pad31, .trailing, constant:0),
            Constraint(btnEarthquakeTel, .width, to:self.view, .width, constant:0, multiplier:0.3)
        ])
        self.view.addConstraints([
            //pad32
            Constraint(pad32, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(pad32, .leading, to:btnEarthquakeTel, .trailing, constant:0),
            Constraint(pad32, .width, to:self.view, .width, constant:0, multiplier:0.024)
        ])
        self.view.addConstraints([
            //留意事項ボタン
            Constraint(btnEarthquakeCaution, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(btnEarthquakeCaution, .leading, to:pad32, .trailing, constant:0),
            Constraint(btnEarthquakeCaution, .width, to:btnEarthquakeTel, .width, constant:0)
        ])
        self.view.addConstraints([
            //pad33
            Constraint(pad33, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(pad33, .leading, to:btnEarthquakeCaution, .trailing, constant:0),
            Constraint(pad33, .width, to:self.view, .width, constant:0, multiplier:0.024)
        ])
        self.view.addConstraints([
            //防災ネットボタン
            Constraint(btnEarthquakeBousaiNet, .bottom, to:self.view, .bottom ,constant:-8),
            Constraint(btnEarthquakeBousaiNet, .leading, to:pad33, .trailing, constant:0),
            Constraint(btnEarthquakeBousaiNet, .width, to:btnEarthquakeTel, .width, constant:0)
        ])
    }
    
    //震度５強以上
    func showSelectEarthquake1(_ sender: UIButton){
        mEarthSelectDialog = EarthSelectDialog(index: 1, parentView: self)
        mEarthSelectDialog.showInfo()
    }
    
    //震度５弱
    func showSelectEarthquake2(_ sender: UIButton){
        mEarthSelectDialog = EarthSelectDialog(index: 2, parentView: self)
        mEarthSelectDialog.showInfo()
    }
    
    //震度４
    func showSelectEarthquake3(_ sender: UIButton){
        mEarthSelectDialog = EarthSelectDialog(index: 3, parentView: self)
        mEarthSelectDialog.showInfo()
    }
    
    //震度３以下
    func showSelectEarthquake4(_ sender: UIButton){
        mEarthSelectDialog = EarthSelectDialog(index: 4, parentView: self)
        mEarthSelectDialog.showInfo()
    }
    
    //東海地震に伴う非常招集
    func showSelectEarthquake5(_ sender: UIButton){
        mEarthSelectDialog = EarthSelectDialog(index: 5, parentView: self)
        mEarthSelectDialog.showInfo()
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
        //初期設定のままだと設定画面に遷移
        if userDefaults.string(forKey: "password") == "nil" {
            //PasViewController呼び出し
            let data:PassViewController = PassViewController()
            let nav = UINavigationController(rootViewController: data)
            nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
            self.present(nav, animated: true, completion: nil)
        } else if !userDefaults.bool(forKey: "passCheck"){
            //パスワードチェック呼び出し
            mPassInputDialog.showResult()
        } else {
            //合っていれば表示
            let data:ContactSearchViewController = ContactSearchViewController()
            let nav = UINavigationController(rootViewController: data)
            nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
            self.present(nav, animated: true, completion: nil)
        }
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
    
    //基礎データ入力画面遷移
    func onClickbtnData(_ sender : UIButton){
        //dataViewControllerのインスタンス生成
        let data:DataViewController = DataViewController()
        
        //navigationControllerのrootViewControllerにdataViewControllerをセット
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        
        //画面遷移
        self.present(nav, animated: true, completion: nil)
    }
    
    //風水害画面遷移
    func onClickbtnTyphoon(_ sender : UIButton){
        //インスタンス生成
        let data:TyphoonViewController = TyphoonViewController()
        
        //navigationControllerのrootViewControllerにTyphoonViewControllerをセット
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        
        //画面遷移
        self.present(nav, animated: true, completion: nil)
    }
    
    //国民保護画面遷移
    func onClickbtnKokuminhogo(_ sender : UIButton){
        //KokuminhogoViewControllerのインスタンス生成
        let data:KokuminhogoViewController = KokuminhogoViewController()
        
        //navigationControllerのrootViewControllerにKokuminhogoViewControllerをセット
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        
        //画面遷移
        self.present(nav, animated: true, completion: nil)
    }
    
    //緊援隊画面遷移
    func onClickbtnKinentai(_ sender : UIButton){
        //KinentaiViewControllerのインスタンス生成
        let data:KinentaiViewController = KinentaiViewController()
        
        //navigationControllerのrootViewControllerにKinentaiViewControllerをセット
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        
        //画面遷移
        self.present(nav, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

