//
//  KinentaiViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/09/11.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class KinentaiViewController: UIViewController {
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
    let lblKinentai     = UILabel(frame: CGRectZero)
    let btnKinentai1    = UIButton(frame: CGRectZero)
    let btnKinentai2    = UIButton(frame: CGRectZero)
    let btnKinentai3    = UIButton(frame: CGRectZero)
    let btnKinentai4    = UIButton(frame: CGRectZero)
    let btnKinentai5    = UIButton(frame: CGRectZero)
    let padY1           = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let padY2           = UIView(frame: CGRectZero)
    let padY3           = UIView(frame: CGRectZero)
    let padY4           = UIView(frame: CGRectZero)
    let padY5           = UIView(frame: CGRectZero)
    let padY6           = UIView(frame: CGRectZero)
    let btnKinentaiEarthquake = UIButton(frame: CGRectZero)
    let btnKinentaiBlackout   = UIButton(frame: CGRectZero)
    let btnKinentaiRoad       = UIButton(frame: CGRectZero)
    let btnKinentaiTel        = UIButton(frame: CGRectZero)
    let btnKinentaiRiver      = UIButton(frame: CGRectZero)
    let btnKinentaiWeather    = UIButton(frame: CGRectZero)
    let pad21            = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let pad22            = UIView(frame: CGRectZero)
    let pad23            = UIView(frame: CGRectZero)
    let pad31            = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let pad32            = UIView(frame: CGRectZero)
    let pad33            = UIView(frame: CGRectZero)
    //別クラスのインスタンス保持用変数
    private var mInfoDialog: InfoDialog!
    private var mKinentaiSelectDialog: KinentaiSelectDialog!
    private var mKinentaiSelectDialog2: KinentaiSelectDialog2!
    //結果表示用クラス保持用
    internal var mEarthResultDialog: EarthResultDialog!
    //データ保存用
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.8, green:0.15, blue:0.1, alpha:1.0)
        //Button生成
        //基礎データ入力
        btnData.backgroundColor = UIColor.blueColor()
        btnData.layer.masksToBounds = true
        btnData.setTitle("基礎データ入力", forState: UIControlState.Normal)
        btnData.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnData.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        btnData.layer.cornerRadius = 8.0
        btnData.tag = 0
        btnData.addTarget(self, action: #selector(self.onClickbtnData(_:)), forControlEvents: .TouchUpInside)
        btnData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnData)
        //震災
        btnEarthquake.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake.layer.masksToBounds = true
        btnEarthquake.setTitle("震災", forState: UIControlState.Normal)
        btnEarthquake.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquake.tag=1
        btnEarthquake.addTarget(self, action: #selector(self.onClickbtnEarthquake(_:)), forControlEvents: .TouchUpInside)
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
        //緊急消防援助隊出場基準表
        lblKinentai.text = "緊急消防援助隊出場基準表"
        lblKinentai.textColor = UIColor.yellowColor()
        lblKinentai.textAlignment = NSTextAlignment.Center
        lblKinentai.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKinentai)
        //地震(震央「陸」)
        btnKinentai1.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai1.layer.masksToBounds = true
        btnKinentai1.setTitle("地震(震央「陸」)", forState: UIControlState.Normal)
        btnKinentai1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentai1.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnKinentai1.tag=5
        btnKinentai1.translatesAutoresizingMaskIntoConstraints = false
        btnKinentai1.addTarget(self, action: #selector(self.showSelectKinentai1(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKinentai1)
        //地震(震央「海」)
        btnKinentai2.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai2.layer.masksToBounds = true
        btnKinentai2.setTitle("地震(震央「海域」)", forState: UIControlState.Normal)
        btnKinentai2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentai2.tag=6
        btnKinentai2.translatesAutoresizingMaskIntoConstraints = false
        btnKinentai2.addTarget(self, action: #selector(self.showSelectKinentai2(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKinentai2)
        //アクションプラン
        btnKinentai3.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai3.layer.masksToBounds = true
        btnKinentai3.setTitle("アクションプラン", forState: UIControlState.Normal)
        btnKinentai3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentai3.tag=7
        btnKinentai3.translatesAutoresizingMaskIntoConstraints = false
        btnKinentai3.addTarget(self, action: #selector(self.showSelectKinentai3(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKinentai3)
        //大津波警報・噴火
        btnKinentai4.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai4.layer.masksToBounds = true
        btnKinentai4.setTitle("大津波警報・噴火", forState: UIControlState.Normal)
        btnKinentai4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentai4.tag=8
        btnKinentai4.translatesAutoresizingMaskIntoConstraints = false
        btnKinentai4.addTarget(self, action: #selector(self.showSelectKinentai4(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKinentai4)
        //特殊災害(NBC含む)
        btnKinentai5.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai5.layer.masksToBounds = true
        btnKinentai5.setTitle("特殊災害(NBC含む)", forState: UIControlState.Normal)
        btnKinentai5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentai5.tag=9
        btnKinentai5.translatesAutoresizingMaskIntoConstraints = false
        btnKinentai5.addTarget(self, action: #selector(self.showSelectKinentai5(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKinentai5)
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
        btnKinentaiEarthquake.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentaiEarthquake.layer.masksToBounds = true
        btnKinentaiEarthquake.setTitle("情報(地震)", forState: UIControlState.Normal)
        btnKinentaiEarthquake.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentaiEarthquake.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnKinentaiEarthquake.tag=10
        btnKinentaiEarthquake.translatesAutoresizingMaskIntoConstraints = false
        btnKinentaiEarthquake.addTarget(self, action: #selector(self.showInfoEarthquake(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKinentaiEarthquake)
        //情報(停電)
        btnKinentaiBlackout.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentaiBlackout.layer.masksToBounds = true
        btnKinentaiBlackout.setTitle("情報(停電)", forState: UIControlState.Normal)
        btnKinentaiBlackout.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentaiBlackout.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnKinentaiBlackout.tag=11
        btnKinentaiBlackout.translatesAutoresizingMaskIntoConstraints = false
        btnKinentaiBlackout.addTarget(self, action: #selector(self.showInfoBlackout(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKinentaiBlackout)
        //情報(道路)
        btnKinentaiRoad.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentaiRoad.layer.masksToBounds = true
        btnKinentaiRoad.setTitle("情報(道路)", forState: UIControlState.Normal)
        btnKinentaiRoad.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentaiRoad.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnKinentaiRoad.tag=12
        btnKinentaiRoad.translatesAutoresizingMaskIntoConstraints = false
        btnKinentaiRoad.addTarget(self, action: #selector(self.showInfoRoad(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKinentaiRoad)
        //連絡網
        btnKinentaiTel.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentaiTel.layer.masksToBounds = true
        btnKinentaiTel.setTitle("連絡網", forState: UIControlState.Normal)
        btnKinentaiTel.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentaiTel.tag=13
        btnKinentaiTel.translatesAutoresizingMaskIntoConstraints = false
        btnKinentaiTel.addTarget(self, action: #selector(self.showContactLoad(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKinentaiTel)
        //情報(河川)
        btnKinentaiRiver.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentaiRiver.layer.masksToBounds = true
        btnKinentaiRiver.setTitle("情報(河川)", forState: UIControlState.Normal)
        btnKinentaiRiver.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentaiRiver.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnKinentaiRiver.tag=14
        btnKinentaiRiver.translatesAutoresizingMaskIntoConstraints = false
        btnKinentaiRiver.addTarget(self, action: #selector(self.showInfoRiver(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKinentaiRiver)
        //情報(気象)
        btnKinentaiWeather.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentaiWeather.layer.masksToBounds = true
        btnKinentaiWeather.setTitle("情報(気象)", forState: UIControlState.Normal)
        btnKinentaiWeather.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKinentaiWeather.tag=15
        btnKinentaiWeather.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnKinentaiWeather)
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
        //mEarthResultDialog = EarthResultDialog(parentView: self) //このViewControllerを渡してあげる
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
            //緊急消防援助隊出場基準表ラベル
            Constraint(lblKinentai, .Bottom, to:padY2, .Top, constant:8),
            Constraint(lblKinentai, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(lblKinentai, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //padY2
            Constraint(padY2, .Bottom, to:btnKinentai1, .Top, constant:0),
            Constraint(padY2, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY2, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
        ])
        self.view.addConstraints([
            //地震(震央「陸」)
            Constraint(btnKinentai1, .Bottom, to:padY3, .Top, constant:0),
            Constraint(btnKinentai1, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnKinentai1, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //padY3
            Constraint(padY3, .Bottom, to:btnKinentai2, .Top, constant:0),
            Constraint(padY3, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY3, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
        ])
        self.view.addConstraints([
            //地震(震央「海」)
            Constraint(btnKinentai2, .Bottom, to:padY4, .Top, constant:0),
            Constraint(btnKinentai2, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnKinentai2, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //padY4
            Constraint(padY4, .Bottom, to:btnKinentai3, .Top, constant:0),
            Constraint(padY4, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY4, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
        ])
        self.view.addConstraints([
            //アクションプラン
            Constraint(btnKinentai3, .CenterY, to:self.view, .CenterY, constant:0),
            Constraint(btnKinentai3, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnKinentai3, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //padY5
            Constraint(padY5, .Top, to:btnKinentai3, .Bottom, constant:0),
            Constraint(padY5, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY5, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
        ])
        self.view.addConstraints([
            //大津波警報・噴火
            Constraint(btnKinentai4, .Top, to:padY5, .Bottom, constant:0),
            Constraint(btnKinentai4, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnKinentai4, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //padY6
            Constraint(padY6, .Top, to:btnKinentai4, .Bottom, constant:0),
            Constraint(padY6, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY6, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
        ])
        self.view.addConstraints([
            //特殊災害(NBC含む)
            Constraint(btnKinentai5, .Top, to:padY6, .Bottom, constant:0),
            Constraint(btnKinentai5, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnKinentai5, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
        ])
        self.view.addConstraints([
            //pad21
            Constraint(pad21, .Bottom, to:btnKinentaiTel, .Top, constant:-8),
            Constraint(pad21, .Leading, to:self.view, .Leading, constant:0),
            Constraint(pad21, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //情報(地震)ボタン
            Constraint(btnKinentaiEarthquake, .Bottom, to:btnKinentaiTel, .Top, constant:-8),
            Constraint(btnKinentaiEarthquake, .Leading, to:pad21, .Trailing, constant:0),
            Constraint(btnKinentaiEarthquake, .Width, to:self.view, .Width, multiplier:0.3, constant:0)
        ])
        self.view.addConstraints([
            //pad22
            Constraint(pad22, .Bottom, to:btnKinentaiTel, .Top, constant:-8),
            Constraint(pad22, .Leading, to:btnKinentaiEarthquake, .Trailing, constant:0),
            Constraint(pad22, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //情報(停電)ボタン
            Constraint(btnKinentaiBlackout, .Bottom, to:btnKinentaiTel, .Top, constant:-8),
            Constraint(btnKinentaiBlackout, .Leading, to:pad22, .Trailing, constant:0),
            Constraint(btnKinentaiBlackout, .Width, to:btnKinentaiEarthquake, .Width, constant:0)
        ])
        self.view.addConstraints([
            //pad23
            Constraint(pad23, .Bottom, to:btnKinentaiTel, .Top, constant:-8),
            Constraint(pad23, .Leading, to:btnKinentaiBlackout, .Trailing, constant:0),
            Constraint(pad23, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //情報(道路)ボタン
            Constraint(btnKinentaiRoad, .Bottom, to:btnKinentaiTel, .Top ,constant:-8),
            Constraint(btnKinentaiRoad, .Leading, to:pad23, .Trailing, constant:0),
            Constraint(btnKinentaiRoad, .Width, to:btnKinentaiEarthquake, .Width, constant:0)
        ])
        self.view.addConstraints([
            //pad31
            Constraint(pad31, .Top, to:btnKinentaiEarthquake, .Bottom, constant:8),
            Constraint(pad31, .Leading, to:self.view, .Leading, constant:0),
            Constraint(pad31, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //連絡網ボタン
            Constraint(btnKinentaiTel, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(btnKinentaiTel, .Leading, to:pad31, .Trailing, constant:0),
            Constraint(btnKinentaiTel, .Width, to:self.view, .Width, multiplier:0.3, constant:0)
        ])
        self.view.addConstraints([
            //pad32
            Constraint(pad32, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(pad32, .Leading, to:btnKinentaiTel, .Trailing, constant:0),
            Constraint(pad32, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //情報(河川)
            Constraint(btnKinentaiRiver, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(btnKinentaiRiver, .Leading, to:pad32, .Trailing, constant:0),
            Constraint(btnKinentaiRiver, .Width, to:btnKinentaiTel, .Width, constant:0)
        ])
        self.view.addConstraints([
            //pad33
            Constraint(pad33, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(pad33, .Leading, to:btnKinentaiRiver, .Trailing, constant:0),
            Constraint(pad33, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
        ])
        self.view.addConstraints([
            //情報(気象)
            Constraint(btnKinentaiWeather, .Bottom, to:self.view, .Bottom ,constant:-8),
            Constraint(btnKinentaiWeather, .Leading, to:pad33, .Trailing, constant:0),
            Constraint(btnKinentaiWeather, .Width, to:btnKinentaiTel, .Width, constant:0)
        ])
    }
    
    //地震(震央「陸」)
    func showSelectKinentai1(sender: UIButton){
        mKinentaiSelectDialog = KinentaiSelectDialog(index: 1, parentView: self)
        mKinentaiSelectDialog.showInfo()
    }
    
    //地震(震央「海域」)
    func showSelectKinentai2(sender: UIButton){
        mKinentaiSelectDialog = KinentaiSelectDialog(index: 2, parentView: self)
        mKinentaiSelectDialog.showInfo()
    }
    
    //アクションプラン
    func showSelectKinentai3(sender: UIButton){
        mKinentaiSelectDialog = KinentaiSelectDialog(index: 3, parentView: self)
        mKinentaiSelectDialog.showInfo()
    }
    
    //大津波警報・噴火
    func showSelectKinentai4(sender: UIButton){
        mKinentaiSelectDialog = KinentaiSelectDialog(index: 4, parentView: self)
        mKinentaiSelectDialog.showInfo()
    }
    
    //特殊災害(NBC含む)
    func showSelectKinentai5(sender: UIButton){
        //特殊災害はKinentaiSelectDialogをすっとばしていきなり都道府県選択のKinentaiSelectDIalog2を呼び出す
        mKinentaiSelectDialog2 = KinentaiSelectDialog2(index: 51, parentView: self)
        mKinentaiSelectDialog2.showInfo()
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
        let data:ContactSearchViewController = ContactSearchViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    //情報（停電）
    func showInfoBlackout(sender: UIButton){
        mInfoDialog.showInfo("blackout")
    }

    //情報(河川)
    func showInfoRiver(sender: UIButton){
        mInfoDialog.showInfo("river")
    }
    
    //情報(気象)
    func showInfoWeather(sender: UIButton){
        mInfoDialog.showInfo("earthquake")
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
    
    //震災画面遷移
    func onClickbtnEarthquake(sender : UIButton){
        //dataViewControllerのインスタンス生成
        let data:ViewController = ViewController()
        
        //navigationControllerのrootViewControllerにKokuminhogoViewControllerをセット
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

