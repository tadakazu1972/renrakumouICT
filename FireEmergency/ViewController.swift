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
    let btnData         = UIButton(frame: CGRectZero)
    let btnEarthquake   = UIButton(frame: CGRectZero)
    let btnTyphoon      = UIButton(frame: CGRectZero)
    let btnKokuminhogo  = UIButton(frame: CGRectZero)
    let btnKinentai     = UIButton(frame: CGRectZero)
    let pad1            = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let pad2            = UIView(frame: CGRectZero)
    let pad3            = UIView(frame: CGRectZero)
    let pad4            = UIView(frame: CGRectZero)
    let lblEarthquake   = UILabel(frame: CGRectZero)
    let btnEarthquake1  = UIButton(frame: CGRectZero)
    let btnEarthquake2  = UIButton(frame: CGRectZero)
    let btnEarthquake3  = UIButton(frame: CGRectZero)
    let btnEarthquake4  = UIButton(frame: CGRectZero)
    let btnEarthquake5  = UIButton(frame: CGRectZero)
    let padY1           = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let padY2           = UIView(frame: CGRectZero)
    let padY3           = UIView(frame: CGRectZero)
    let padY4           = UIView(frame: CGRectZero)
    let padY5           = UIView(frame: CGRectZero)
    let padY6           = UIView(frame: CGRectZero)
    let btnEarthquakeEarthquake = UIButton(frame: CGRectZero)
    let btnEarthquakeBlackout   = UIButton(frame: CGRectZero)
    let btnEarthquakeRoad       = UIButton(frame: CGRectZero)
    let btnEarthquakeTel        = UIButton(frame: CGRectZero)
    let btnEarthquakeCaution    = UIButton(frame: CGRectZero)
    let btnEarthquakeBousaiNet  = UIButton(frame: CGRectZero)
    let pad21            = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let pad22            = UIView(frame: CGRectZero)
    let pad23            = UIView(frame: CGRectZero)
    let pad31            = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let pad32            = UIView(frame: CGRectZero)
    let pad33            = UIView(frame: CGRectZero)
    //別クラスのインスタンス保持用変数
    private var mInfoDialog: InfoDialog!
    private var mBousainetDialog: BousainetDialog!
    private var mEarthSelectDialog: EarthSelectDialog!
    private var mContactLoadDialog: ContactLoadDialog2!
    //結果表示用クラス保持用
    internal var mEarthResultDialog: EarthResultDialog!
    //データ保存用
    let userDefaults = NSUserDefaults.standardUserDefaults()
    //SQLite用
    private var mDBHelper: DBHelper!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DB生成
        mDBHelper = DBHelper()
        mDBHelper.createTable()
        
        //初回起動判定
        if userDefaults.boolForKey("firstLaunch"){
            //初回起動時処理 一度も基礎データ入力されないorデータ入力画面でもスピナーをさわらない場合はセットされない=結果でnilが表示される　それを防止
            userDefaults.setObject("消防局", forKey: "mainStation")
            userDefaults.setObject("消防局", forKey: "tsunamiStation")
            userDefaults.setObject("１号招集", forKey: "kubun")
            
            //DBダミーデータ生成
            mDBHelper.insert("大阪　太郎",tel: "09066080765",mail: "tadakazu1972@gmail.com",kubun: "４号招集",syozoku0: "消防局",syozoku: "警防課",kinmu: "日勤")
            mDBHelper.insert("難波　二郎",tel: "07077777777",mail: "ta-nakamichi@city.osaka.lg.jp",kubun: "３号招集",syozoku0: "北消防署",syozoku: "与力",kinmu: "１部")
            
            //２回目以降ではfalseに
            userDefaults.setBool(false, forKey: "firstLaunch")
        }
        
        self.view.backgroundColor = UIColor(red:0.9, green:0.7, blue:0.2, alpha:1.0)
        //Button生成
        //基礎データ入力
        btnData.backgroundColor = UIColor.blueColor()
        btnData.layer.masksToBounds = true
        btnData.setTitle("基礎データ入力", forState: UIControlState.Normal)
        btnData.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnData.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        btnData.layer.cornerRadius = 8.0
        btnData.tag = 0
        btnData.addTarget(self, action: #selector(ViewController.onClickbtnData(_:)), forControlEvents: .TouchUpInside)
        btnData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnData)
        //震災
        btnEarthquake.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake.layer.masksToBounds = true
        btnEarthquake.setTitle("震災", forState: UIControlState.Normal)
        btnEarthquake.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquake.tag=1
        btnEarthquake.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnEarthquake)
        //風水害
        btnTyphoon.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon.layer.masksToBounds = true
        btnTyphoon.setTitle("風水害", forState: UIControlState.Normal)
        btnTyphoon.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnTyphoon.tag=2
        btnTyphoon.addTarget(self, action: #selector(self.onClickbtnTyphoon(_:)), forControlEvents: .TouchUpInside)
        btnTyphoon.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnTyphoon)
        //国民保護
        btnKokuminhogo.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogo.layer.masksToBounds = true
        btnKokuminhogo.setTitle("国民保", forState: UIControlState.Normal)
        btnKokuminhogo.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogo.tag=3
        btnKokuminhogo.addTarget(self, action: #selector(self.onClickbtnKokuminhogo(_:)), forControlEvents: .TouchUpInside)
        btnKokuminhogo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnKokuminhogo)
        //緊援隊
        btnKinentai.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai.layer.masksToBounds = true
        btnKinentai.setTitle("緊援隊", forState: UIControlState.Normal)
        btnKinentai.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentai.tag=4
        btnKinentai.addTarget(self, action: #selector(self.onClickbtnKinentai(_:)), forControlEvents: .TouchUpInside)
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
        lblEarthquake.text = "非常召集基準（震災）"
        lblEarthquake.textColor = UIColor.whiteColor()
        lblEarthquake.textAlignment = NSTextAlignment.Center
        lblEarthquake.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblEarthquake)
        //震度５強以上
        btnEarthquake1.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake1.layer.masksToBounds = true
        btnEarthquake1.setTitle("震度５強以上", forState: UIControlState.Normal)
        btnEarthquake1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquake1.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnEarthquake1.tag=5
        btnEarthquake1.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquake1.addTarget(self, action: #selector(self.showSelectEarthquake1(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnEarthquake1)
        //震度５弱
        btnEarthquake2.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake2.layer.masksToBounds = true
        btnEarthquake2.setTitle("震度５弱", forState: UIControlState.Normal)
        btnEarthquake2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquake2.tag=6
        btnEarthquake2.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquake2.addTarget(self, action: #selector(self.showSelectEarthquake2(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnEarthquake2)
        //震度４
        btnEarthquake3.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake3.layer.masksToBounds = true
        btnEarthquake3.setTitle("震度４", forState: UIControlState.Normal)
        btnEarthquake3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquake3.tag=7
        btnEarthquake3.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquake3.addTarget(self, action: #selector(self.showSelectEarthquake3(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnEarthquake3)
        //震度３以下
        btnEarthquake4.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake4.layer.masksToBounds = true
        btnEarthquake4.setTitle("震度３以下", forState: UIControlState.Normal)
        btnEarthquake4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquake4.tag=8
        btnEarthquake4.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquake4.addTarget(self, action: #selector(self.showSelectEarthquake4(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnEarthquake4)
        //東海地震に伴う非常召集
        btnEarthquake5.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake5.layer.masksToBounds = true
        btnEarthquake5.setTitle("東海地震に伴う非常召集", forState: UIControlState.Normal)
        btnEarthquake5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquake5.tag=9
        btnEarthquake5.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquake5.addTarget(self, action: #selector(self.showSelectEarthquake5(_:)), forControlEvents: .TouchUpInside)
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
        btnEarthquakeEarthquake.setTitle("情報(地震)", forState: UIControlState.Normal)
        btnEarthquakeEarthquake.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquakeEarthquake.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnEarthquakeEarthquake.tag=10
        btnEarthquakeEarthquake.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeEarthquake.addTarget(self, action: #selector(self.showInfoEarthquake(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnEarthquakeEarthquake)
        //情報（停電）
        btnEarthquakeBlackout.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquakeBlackout.layer.masksToBounds = true
        btnEarthquakeBlackout.setTitle("情報(停電)", forState: UIControlState.Normal)
        btnEarthquakeBlackout.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquakeBlackout.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnEarthquakeBlackout.tag=11
        btnEarthquakeBlackout.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeBlackout.addTarget(self, action: #selector(self.showInfoBlackout(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnEarthquakeBlackout)
        //情報（道路）
        btnEarthquakeRoad.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquakeRoad.layer.masksToBounds = true
        btnEarthquakeRoad.setTitle("情報(道路)", forState: UIControlState.Normal)
        btnEarthquakeRoad.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquakeRoad.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnEarthquakeRoad.tag=12
        btnEarthquakeRoad.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeRoad.addTarget(self, action: #selector(self.showInfoRoad(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnEarthquakeRoad)
        //連絡網
        btnEarthquakeTel.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquakeTel.layer.masksToBounds = true
        btnEarthquakeTel.setTitle("連絡網", forState: UIControlState.Normal)
        btnEarthquakeTel.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquakeTel.tag=13
        btnEarthquakeTel.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeTel.addTarget(self, action: #selector(self.showContactLoad(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnEarthquakeTel)
        //留意事項
        btnEarthquakeCaution.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquakeCaution.layer.masksToBounds = true
        btnEarthquakeCaution.setTitle("留意事項", forState: UIControlState.Normal)
        btnEarthquakeCaution.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquakeCaution.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnEarthquakeCaution.tag=14
        btnEarthquakeCaution.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeCaution.addTarget(self, action: #selector(ViewController.showInfoCaution(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnEarthquakeCaution)
        //防災ネット
        btnEarthquakeBousaiNet.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquakeBousaiNet.layer.masksToBounds = true
        btnEarthquakeBousaiNet.setTitle("防災ネット", forState: UIControlState.Normal)
        btnEarthquakeBousaiNet.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquakeBousaiNet.tag=15
        btnEarthquakeBousaiNet.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquakeBousaiNet.addTarget(self, action: #selector(ViewController.showInfoBousainet(_:)), forControlEvents: .TouchUpInside)
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
            //基礎データ入力ボタン
            Constraint(btnData, .Top, to:self.view, .Top, constant:20),
            Constraint(btnData, .Leading, to:self.view, .Leading, constant:8),
            Constraint(btnData, .Trailing, to:self.view, .TrailingMargin, constant:8)
        ])
        self.view.addConstraints([
            //pad1
            Constraint(pad1, .Top, to:btnData, .Bottom, constant:8),
            Constraint(pad1, .Leading, to:self.view, .Leading, constant:0),
            Constraint(pad1, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //震災ボタン
            Constraint(btnEarthquake, .Top, to:btnData, .Bottom, constant:8),
            Constraint(btnEarthquake, .Leading, to:pad1, .Trailing, constant:0),
            Constraint(btnEarthquake, .Width, to:self.view, .Width, multiplier:0.22, constant:0)
        ])
        self.view.addConstraints([
            //pad2
            Constraint(pad2, .Top, to:btnData, .Bottom, constant:8),
            Constraint(pad2, .Leading, to:btnEarthquake, .Trailing, constant:0),
            Constraint(pad2, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //風水害ボタン
            Constraint(btnTyphoon, .Top, to:btnData, .Bottom, constant:8),
            Constraint(btnTyphoon, .Leading, to:pad2, .Trailing, constant:0),
            Constraint(btnTyphoon, .Width, to:btnEarthquake, .Width, constant:0)
        ])
        self.view.addConstraints([
            //pad3
            Constraint(pad3, .Top, to:btnData, .Bottom, constant:8),
            Constraint(pad3, .Leading, to:btnTyphoon, .Trailing, constant:0),
            Constraint(pad3, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //国民保護ボタン
            Constraint(btnKokuminhogo, .Top, to:btnData, .Bottom ,constant:8),
            Constraint(btnKokuminhogo, .Leading, to:pad3, .Trailing, constant:0),
            Constraint(btnKokuminhogo, .Width, to:btnEarthquake, .Width, constant:0)
        ])
        self.view.addConstraints([
            //pad4
            Constraint(pad4, .Top, to:btnData, .Bottom, constant:8),
            Constraint(pad4, .Leading, to:btnKokuminhogo, .Trailing, constant:0),
            Constraint(pad4, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //緊援隊ボタン
            Constraint(btnKinentai, .Top, to:btnData, .Bottom, constant:8),
            Constraint(btnKinentai, .Leading, to:pad4, .Trailing, constant:0),
            Constraint(btnKinentai, .Width, to:btnEarthquake, .Width, constant:0)
        ])
        self.view.addConstraints([
            //padY1
            Constraint(padY1, .Top, to:btnEarthquake, .Bottom, constant:0),
            Constraint(padY1, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY1, .Height, to:self.view, .Height, multiplier:0.05, constant:0)
        ])
        self.view.addConstraints([
            //非常召集基準（震災）ラベル
            Constraint(lblEarthquake, .Bottom, to:padY2, .Top, constant:8),
            Constraint(lblEarthquake, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(lblEarthquake, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //padY2
            Constraint(padY2, .Bottom, to:btnEarthquake1, .Top, constant:0),
            Constraint(padY2, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY2, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
        ])
        self.view.addConstraints([
            //震度５強以上ボタン
            Constraint(btnEarthquake1, .Bottom, to:padY3, .Top, constant:0),
            Constraint(btnEarthquake1, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnEarthquake1, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //padY3
            Constraint(padY3, .Bottom, to:btnEarthquake2, .Top, constant:0),
            Constraint(padY3, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY3, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
        ])
        self.view.addConstraints([
            //震度５弱ボタン
            Constraint(btnEarthquake2, .Bottom, to:padY4, .Top, constant:0),
            Constraint(btnEarthquake2, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnEarthquake2, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //padY4
            Constraint(padY4, .Bottom, to:btnEarthquake3, .Top, constant:0),
            Constraint(padY4, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY4, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
        ])
        self.view.addConstraints([
            //震度４ボタン Y座標の中心
            Constraint(btnEarthquake3, .CenterY, to:self.view, .CenterY, constant:0),
            Constraint(btnEarthquake3, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnEarthquake3, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //padY5
            Constraint(padY5, .Top, to:btnEarthquake3, .Bottom, constant:0),
            Constraint(padY5, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY5, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
        ])
        self.view.addConstraints([
            //震度３以下ボタン
            Constraint(btnEarthquake4, .Top, to:padY5, .Bottom, constant:0),
            Constraint(btnEarthquake4, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnEarthquake4, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //padY6
            Constraint(padY6, .Top, to:btnEarthquake4, .Bottom, constant:0),
            Constraint(padY6, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY6, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
        ])
        self.view.addConstraints([
            //東海地震に伴う非常招集ボタン
            Constraint(btnEarthquake5, .Top, to:padY6, .Bottom, constant:0),
            Constraint(btnEarthquake5, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnEarthquake5, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //pad21
            Constraint(pad21, .Bottom, to:btnEarthquakeTel, .Top, constant:-8),
            Constraint(pad21, .Leading, to:self.view, .Leading, constant:0),
            Constraint(pad21, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //情報(地震)ボタン
            Constraint(btnEarthquakeEarthquake, .Bottom, to:btnEarthquakeTel, .Top, constant:-8),
            Constraint(btnEarthquakeEarthquake, .Leading, to:pad21, .Trailing, constant:0),
            Constraint(btnEarthquakeEarthquake, .Width, to:self.view, .Width, multiplier:0.3, constant:0)
        ])
        self.view.addConstraints([
            //pad22
            Constraint(pad22, .Bottom, to:btnEarthquakeTel, .Top, constant:-8),
            Constraint(pad22, .Leading, to:btnEarthquakeEarthquake, .Trailing, constant:0),
            Constraint(pad22, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //情報(停電)ボタン
            Constraint(btnEarthquakeBlackout, .Bottom, to:btnEarthquakeTel, .Top, constant:-8),
            Constraint(btnEarthquakeBlackout, .Leading, to:pad22, .Trailing, constant:0),
            Constraint(btnEarthquakeBlackout, .Width, to:btnEarthquakeEarthquake, .Width, constant:0)
        ])
        self.view.addConstraints([
            //pad23
            Constraint(pad23, .Bottom, to:btnEarthquakeTel, .Top, constant:-8),
            Constraint(pad23, .Leading, to:btnEarthquakeBlackout, .Trailing, constant:0),
            Constraint(pad23, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //情報(道路)ボタン
            Constraint(btnEarthquakeRoad, .Bottom, to:btnEarthquakeTel, .Top ,constant:-8),
            Constraint(btnEarthquakeRoad, .Leading, to:pad23, .Trailing, constant:0),
            Constraint(btnEarthquakeRoad, .Width, to:btnEarthquakeEarthquake, .Width, constant:0)
        ])
        self.view.addConstraints([
            //pad31
            Constraint(pad31, .Top, to:btnEarthquakeEarthquake, .Bottom, constant:8),
            Constraint(pad31, .Leading, to:self.view, .Leading, constant:0),
            Constraint(pad31, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //連絡網ボタン
            Constraint(btnEarthquakeTel, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(btnEarthquakeTel, .Leading, to:pad31, .Trailing, constant:0),
            Constraint(btnEarthquakeTel, .Width, to:self.view, .Width, multiplier:0.3, constant:0)
        ])
        self.view.addConstraints([
            //pad32
            Constraint(pad32, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(pad32, .Leading, to:btnEarthquakeTel, .Trailing, constant:0),
            Constraint(pad32, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //留意事項ボタン
            Constraint(btnEarthquakeCaution, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(btnEarthquakeCaution, .Leading, to:pad32, .Trailing, constant:0),
            Constraint(btnEarthquakeCaution, .Width, to:btnEarthquakeTel, .Width, constant:0)
        ])
        self.view.addConstraints([
            //pad33
            Constraint(pad33, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(pad33, .Leading, to:btnEarthquakeCaution, .Trailing, constant:0),
            Constraint(pad33, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //防災ネットボタン
            Constraint(btnEarthquakeBousaiNet, .Bottom, to:self.view, .Bottom ,constant:-8),
            Constraint(btnEarthquakeBousaiNet, .Leading, to:pad33, .Trailing, constant:0),
            Constraint(btnEarthquakeBousaiNet, .Width, to:btnEarthquakeTel, .Width, constant:0)
        ])
    }
    
    //震度５強以上
    func showSelectEarthquake1(sender: UIButton){
        mEarthSelectDialog = EarthSelectDialog(index: 1, parentView: self)
        mEarthSelectDialog.showInfo()
    }
    
    //震度５弱
    func showSelectEarthquake2(sender: UIButton){
        mEarthSelectDialog = EarthSelectDialog(index: 2, parentView: self)
        mEarthSelectDialog.showInfo()
    }
    
    //震度４
    func showSelectEarthquake3(sender: UIButton){
        mEarthSelectDialog = EarthSelectDialog(index: 3, parentView: self)
        mEarthSelectDialog.showInfo()
    }
    
    //震度３以下
    func showSelectEarthquake4(sender: UIButton){
        mEarthSelectDialog = EarthSelectDialog(index: 4, parentView: self)
        mEarthSelectDialog.showInfo()
    }
    
    //東海地震に伴う非常招集
    func showSelectEarthquake5(sender: UIButton){
        mEarthSelectDialog = EarthSelectDialog(index: 5, parentView: self)
        mEarthSelectDialog.showInfo()
    }
    
    //情報(地震)
    func showInfoEarthquake(sender: UIButton){
        mInfoDialog.showInfo("earthquake")
    }
    
    //情報（道路）
    func showInfoRoad(sender: UIButton){
        mInfoDialog.showInfo("road")
    }
    
    //連絡網
    func showContactLoad(sender: UIButton){
        //まずは全部検索実施
        mDBHelper.selectAll()
        mContactLoadDialog = ContactLoadDialog2(parentView: self, resultFrom: mDBHelper.resultArray)
        mContactLoadDialog.showResult()
    }
    
    //情報（停電）
    func showInfoBlackout(sender: UIButton){
        mInfoDialog.showInfo("blackout")
    }

    //留意事項
    func showInfoCaution(sender: UIButton){
        mInfoDialog.showInfo("caution")
    }
    
    //防災ネット
    func showInfoBousainet(sender: UIButton){
        mBousainetDialog.showInfo()
    }
    
    //基礎データ入力画面遷移
    func onClickbtnData(sender : UIButton){
        //dataViewControllerのインスタンス生成
        let data:DataViewController = DataViewController()
        
        //navigationControllerのrootViewControllerにdataViewControllerをセット
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        
        //画面遷移
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    //風水害画面遷移
    func onClickbtnTyphoon(sender : UIButton){
        //インスタンス生成
        let data:TyphoonViewController = TyphoonViewController()
        
        //navigationControllerのrootViewControllerにTyphoonViewControllerをセット
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        
        //画面遷移
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    //国民保護画面遷移
    func onClickbtnKokuminhogo(sender : UIButton){
        //KokuminhogoViewControllerのインスタンス生成
        let data:KokuminhogoViewController = KokuminhogoViewController()
        
        //navigationControllerのrootViewControllerにKokuminhogoViewControllerをセット
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        
        //画面遷移
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    //緊援隊画面遷移
    func onClickbtnKinentai(sender : UIButton){
        //KinentaiViewControllerのインスタンス生成
        let data:KinentaiViewController = KinentaiViewController()
        
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

