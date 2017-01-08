//
//  TyphoonViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/12/01.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class TyphoonViewController: UIViewController {
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
    let lblTyphoon      = UILabel(frame: CGRectZero)
    let btnTyphoon1     = UIButton(frame: CGRectZero)
    let btnTyphoon2     = UIButton(frame: CGRectZero)
    let btnTyphoon3     = UIButton(frame: CGRectZero)
    let padY1           = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let padY2           = UIView(frame: CGRectZero)
    let padY3           = UIView(frame: CGRectZero)
    let padY4           = UIView(frame: CGRectZero)
    let padY5           = UIView(frame: CGRectZero)
    let btnTyphoonWeather = UIButton(frame: CGRectZero)
    let btnTyphoonRiver   = UIButton(frame: CGRectZero)
    let btnTyphoonRoad       = UIButton(frame: CGRectZero)
    let btnTyphoonTel        = UIButton(frame: CGRectZero)
    let btnTyphoonCaution    = UIButton(frame: CGRectZero)
    let btnTyphoonBousaiNet  = UIButton(frame: CGRectZero)
    let pad21            = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let pad22            = UIView(frame: CGRectZero)
    let pad23            = UIView(frame: CGRectZero)
    let pad31            = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let pad32            = UIView(frame: CGRectZero)
    let pad33            = UIView(frame: CGRectZero)
    //別クラスのインスタンス保持用変数
    private var mInfoDialog: InfoDialog!
    private var mTyphoonSelectDialog: TyphoonSelectDialog!
    //結果表示用クラス保持用
    internal var mTyphoonResultDialog: TyphoonResultDialog!
    //データ保存用
    let userDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.2, green:0.2, blue:0.9, alpha:1.0)
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
        //非常召集基準（風水害）
        lblTyphoon.text = "非常召集基準（風水害）"
        lblTyphoon.textColor = UIColor.whiteColor()
        lblTyphoon.textAlignment = NSTextAlignment.Center
        lblTyphoon.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblTyphoon)
        //非常警備の基準（全て）
        btnTyphoon1.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon1.layer.masksToBounds = true
        btnTyphoon1.setTitle("非常警備の基準(全て)", forState: UIControlState.Normal)
        btnTyphoon1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnTyphoon1.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnTyphoon1.tag=5
        btnTyphoon1.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoon1.addTarget(self, action: #selector(self.showSelectTyphoon1(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnTyphoon1)
        //気象警報による非常招集
        btnTyphoon2.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon2.layer.masksToBounds = true
        btnTyphoon2.setTitle("気象警報による非常招集", forState: UIControlState.Normal)
        btnTyphoon2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnTyphoon2.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnTyphoon2.tag=6
        btnTyphoon2.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoon2.addTarget(self, action: #selector(self.showSelectTyphoon2(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnTyphoon2)
        //河川水位による非常招集
        btnTyphoon3.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon3.layer.masksToBounds = true
        btnTyphoon3.setTitle("河川水位による非常招集", forState: UIControlState.Normal)
        btnTyphoon3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnTyphoon3.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnTyphoon3.tag=7
        btnTyphoon3.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoon3.addTarget(self, action: #selector(self.showSelectTyphoon3(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnTyphoon3)
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
        //情報（気象）
        btnTyphoonWeather.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonWeather.layer.masksToBounds = true
        btnTyphoonWeather.setTitle("情報(気象)", forState: UIControlState.Normal)
        btnTyphoonWeather.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnTyphoonWeather.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnTyphoonWeather.tag=9
        btnTyphoonWeather.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonWeather.addTarget(self, action: #selector(self.showInfoWeather(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnTyphoonWeather)
        //情報（河川）
        btnTyphoonRiver.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonRiver.layer.masksToBounds = true
        btnTyphoonRiver.setTitle("情報(河川)", forState: UIControlState.Normal)
        btnTyphoonRiver.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnTyphoonRiver.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnTyphoonRiver.tag=10
        btnTyphoonRiver.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonRiver.addTarget(self, action: #selector(self.showInfoRiver(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnTyphoonRiver)
        //情報（道路）
        btnTyphoonRoad.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonRoad.layer.masksToBounds = true
        btnTyphoonRoad.setTitle("情報(道路)", forState: UIControlState.Normal)
        btnTyphoonRoad.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnTyphoonRoad.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnTyphoonRoad.tag=11
        btnTyphoonRoad.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonRoad.addTarget(self, action: #selector(self.showInfoRoad(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnTyphoonRoad)
        //連絡網
        btnTyphoonTel.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonTel.layer.masksToBounds = true
        btnTyphoonTel.setTitle("連絡網", forState: UIControlState.Normal)
        btnTyphoonTel.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnTyphoonTel.tag=12
        btnTyphoonTel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnTyphoonTel)
        //留意事項
        btnTyphoonCaution.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonCaution.layer.masksToBounds = true
        btnTyphoonCaution.setTitle("留意事項", forState: UIControlState.Normal)
        btnTyphoonCaution.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnTyphoonCaution.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnTyphoonCaution.tag=13
        btnTyphoonCaution.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonCaution.addTarget(self, action: #selector(self.showInfoCaution(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnTyphoonCaution)
        //防災ネット
        btnTyphoonBousaiNet.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonBousaiNet.layer.masksToBounds = true
        btnTyphoonBousaiNet.setTitle("防災ネット", forState: UIControlState.Normal)
        btnTyphoonBousaiNet.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnTyphoonBousaiNet.tag=14
        btnTyphoonBousaiNet.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnTyphoonBousaiNet)
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
        mTyphoonResultDialog = TyphoonResultDialog(parentView: self) //このViewControllerを渡してあげる
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
            //非常召集基準（風水害）ラベル
            Constraint(lblTyphoon, .Bottom, to:padY2, .Top, constant:8),
            Constraint(lblTyphoon, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(lblTyphoon, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY2
            Constraint(padY2, .Bottom, to:btnTyphoon1, .Top, constant:0),
            Constraint(padY2, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY2, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //非常警備の基準(全て)ボタン
            Constraint(btnTyphoon1, .Bottom, to:padY3, .Top, constant:0),
            Constraint(btnTyphoon1, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnTyphoon1, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY3
            Constraint(padY3, .Bottom, to:btnTyphoon2, .Top, constant:0),
            Constraint(padY3, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY3, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //気象警報による非常招集ボタン Y座標の中心
            Constraint(btnTyphoon2, .CenterY, to:self.view, .CenterY, constant:0),
            Constraint(btnTyphoon2, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnTyphoon2, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY4
            Constraint(padY4, .Top, to:btnTyphoon2, .Bottom, constant:0),
            Constraint(padY4, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY4, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //河川水位による非常招集ボタン
            Constraint(btnTyphoon3, .Top, to:padY4, .Bottom, constant:0),
            Constraint(btnTyphoon3, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnTyphoon3, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY5
            Constraint(padY5, .Top, to:btnTyphoon3, .Bottom, constant:0),
            Constraint(padY5, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY5, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //pad21
            Constraint(pad21, .Bottom, to:btnTyphoonTel, .Top, constant:-8),
            Constraint(pad21, .Leading, to:self.view, .Leading, constant:0),
            Constraint(pad21, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //情報(気象)ボタン
            Constraint(btnTyphoonWeather, .Bottom, to:btnTyphoonTel, .Top, constant:-8),
            Constraint(btnTyphoonWeather, .Leading, to:pad21, .Trailing, constant:0),
            Constraint(btnTyphoonWeather, .Width, to:self.view, .Width, multiplier:0.3, constant:0)
            ])
        self.view.addConstraints([
            //pad22
            Constraint(pad22, .Bottom, to:btnTyphoonTel, .Top, constant:-8),
            Constraint(pad22, .Leading, to:btnTyphoonWeather, .Trailing, constant:0),
            Constraint(pad22, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //情報(河川)ボタン
            Constraint(btnTyphoonRiver, .Bottom, to:btnTyphoonTel, .Top, constant:-8),
            Constraint(btnTyphoonRiver, .Leading, to:pad22, .Trailing, constant:0),
            Constraint(btnTyphoonRiver, .Width, to:btnTyphoonWeather, .Width, constant:0)
            ])
        self.view.addConstraints([
            //pad23
            Constraint(pad23, .Bottom, to:btnTyphoonTel, .Top, constant:-8),
            Constraint(pad23, .Leading, to:btnTyphoonRiver, .Trailing, constant:0),
            Constraint(pad23, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //情報(道路)ボタン
            Constraint(btnTyphoonRoad, .Bottom, to:btnTyphoonTel, .Top ,constant:-8),
            Constraint(btnTyphoonRoad, .Leading, to:pad23, .Trailing, constant:0),
            Constraint(btnTyphoonRoad, .Width, to:btnTyphoonWeather, .Width, constant:0)
            ])
        self.view.addConstraints([
            //pad31
            Constraint(pad31, .Top, to:btnTyphoonWeather, .Bottom, constant:8),
            Constraint(pad31, .Leading, to:self.view, .Leading, constant:0),
            Constraint(pad31, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //連絡網ボタン
            Constraint(btnTyphoonTel, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(btnTyphoonTel, .Leading, to:pad31, .Trailing, constant:0),
            Constraint(btnTyphoonTel, .Width, to:self.view, .Width, multiplier:0.3, constant:0)
            ])
        self.view.addConstraints([
            //pad32
            Constraint(pad32, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(pad32, .Leading, to:btnTyphoonTel, .Trailing, constant:0),
            Constraint(pad32, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //留意事項ボタン
            Constraint(btnTyphoonCaution, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(btnTyphoonCaution, .Leading, to:pad32, .Trailing, constant:0),
            Constraint(btnTyphoonCaution, .Width, to:btnTyphoonTel, .Width, constant:0)
            ])
        self.view.addConstraints([
            //pad33
            Constraint(pad33, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(pad33, .Leading, to:btnTyphoonCaution, .Trailing, constant:0),
            Constraint(pad33, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //防災ネットボタン
            Constraint(btnTyphoonBousaiNet, .Bottom, to:self.view, .Bottom ,constant:-8),
            Constraint(btnTyphoonBousaiNet, .Leading, to:pad33, .Trailing, constant:0),
            Constraint(btnTyphoonBousaiNet, .Width, to:btnTyphoonTel, .Width, constant:0)
            ])
    }
    
    //非常警備の基準(全て)
    func showSelectTyphoon1(sender: UIButton){
        mTyphoonResultDialog.showResult(11)
    }
    
    //気象警報による非常招集
    func showSelectTyphoon2(sender: UIButton){
        mTyphoonSelectDialog = TyphoonSelectDialog(index: 2, parentView: self)
        mTyphoonSelectDialog.showInfo()
    }
    
    //河川水位による非常招集
    func showSelectTyphoon3(sender: UIButton){
        mTyphoonSelectDialog = TyphoonSelectDialog(index: 3, parentView: self)
        mTyphoonSelectDialog.showInfo()
    }
    
    //情報(気象)
    func showInfoWeather(sender: UIButton){
        mInfoDialog.showInfo("weather")
    }
    
    //情報（河川）
    func showInfoRiver(sender: UIButton){
        mInfoDialog.showInfo("river")
    }
    
    //情報（道路）
    func showInfoRoad(sender: UIButton){
        mInfoDialog.showInfo("road")
    }
    
    //留意事項
    func showInfoCaution(sender: UIButton){
        mInfoDialog.showInfo("typhoon_caution")
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
        //インスタンス生成
        let data:ViewController = ViewController()
        
        //navigationControllerのrootViewControllerにViewControllerをセット
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
