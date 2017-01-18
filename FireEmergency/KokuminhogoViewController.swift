//
//  KokuminhogoViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/11/06.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class KokuminhogoViewController: UIViewController {
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
    let lblKokuminhogo   = UILabel(frame: CGRectZero)
    let btnKokuminhogo1  = UIButton(frame: CGRectZero)
    let btnKokuminhogo2  = UIButton(frame: CGRectZero)
    let btnKokuminhogo3  = UIButton(frame: CGRectZero)
    let btnKokuminhogo4  = UIButton(frame: CGRectZero)
    let btnKokuminhogo5  = UIButton(frame: CGRectZero)
    let padY1           = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let padY2           = UIView(frame: CGRectZero)
    let padY3           = UIView(frame: CGRectZero)
    let padY4           = UIView(frame: CGRectZero)
    let padY5           = UIView(frame: CGRectZero)
    let padY6           = UIView(frame: CGRectZero)
    let btnKokuminhogoKankeikikan = UIButton(frame: CGRectZero)
    let btnKokuminhogoBlackout    = UIButton(frame: CGRectZero)
    let btnKokuminhogoRoad        = UIButton(frame: CGRectZero)
    let btnKokuminhogoTel         = UIButton(frame: CGRectZero)
    let btnKokuminhogoCaution     = UIButton(frame: CGRectZero)
    let btnKokuminhogoBousaiNet   = UIButton(frame: CGRectZero)
    let pad21            = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let pad22            = UIView(frame: CGRectZero)
    let pad23            = UIView(frame: CGRectZero)
    let pad31            = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let pad32            = UIView(frame: CGRectZero)
    let pad33            = UIView(frame: CGRectZero)
    //別クラスのインスタンス保持用変数
    private var mInfoDialog: InfoDialog!
    private var mBousainetDialog: BousainetDialog!
    //結果表示用クラス保持用
    internal var mKokuminhogoResultDialog: KokuminhogoResultDialog!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.0, green:0.55, blue:0.0, alpha:1.0)
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
        btnEarthquake.addTarget(self, action: #selector(self.onClickbtnKokuminhogo(_:)), forControlEvents: .TouchUpInside)
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
        //非常警備基準（国民保護）
        lblKokuminhogo.text = "非常警備基準（国民保護）"
        lblKokuminhogo.textColor = UIColor.whiteColor()
        lblKokuminhogo.textAlignment = NSTextAlignment.Center
        lblKokuminhogo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKokuminhogo)
        //１号非常招集
        btnKokuminhogo1.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogo1.layer.masksToBounds = true
        btnKokuminhogo1.setTitle("１号非常招集", forState: UIControlState.Normal)
        btnKokuminhogo1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogo1.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnKokuminhogo1.tag=5
        btnKokuminhogo1.translatesAutoresizingMaskIntoConstraints = false
        btnKokuminhogo1.addTarget(self, action: #selector(self.showKokuminhogo1(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKokuminhogo1)
        //２号非常招集
        btnKokuminhogo2.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogo2.layer.masksToBounds = true
        btnKokuminhogo2.setTitle("２号非常招集", forState: UIControlState.Normal)
        btnKokuminhogo2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogo2.tag=6
        btnKokuminhogo2.translatesAutoresizingMaskIntoConstraints = false
        btnKokuminhogo2.addTarget(self, action: #selector(self.showKokuminhogo2(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKokuminhogo2)
        //３号非常招集
        btnKokuminhogo3.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogo3.layer.masksToBounds = true
        btnKokuminhogo3.setTitle("３号非常招集", forState: UIControlState.Normal)
        btnKokuminhogo3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogo3.tag=7
        btnKokuminhogo3.translatesAutoresizingMaskIntoConstraints = false
        btnKokuminhogo3.addTarget(self, action: #selector(self.showKokuminhogo3(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKokuminhogo3)
        //４号非常招集
        btnKokuminhogo4.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogo4.layer.masksToBounds = true
        btnKokuminhogo4.setTitle("４号非常招集", forState: UIControlState.Normal)
        btnKokuminhogo4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogo4.tag=8
        btnKokuminhogo4.translatesAutoresizingMaskIntoConstraints = false
        btnKokuminhogo4.addTarget(self, action: #selector(self.showKokuminhogo4(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKokuminhogo4)
        //５号非常招集
        btnKokuminhogo5.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogo5.layer.masksToBounds = true
        btnKokuminhogo5.setTitle("５号非常招集", forState: UIControlState.Normal)
        btnKokuminhogo5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogo5.tag=9
        btnKokuminhogo5.translatesAutoresizingMaskIntoConstraints = false
        btnKokuminhogo5.addTarget(self, action: #selector(self.showKokuminhogo5(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKokuminhogo5)
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
        //情報（関係機関）
        btnKokuminhogoKankeikikan.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogoKankeikikan.layer.masksToBounds = true
        btnKokuminhogoKankeikikan.setTitle("情報(関係機関)", forState: UIControlState.Normal)
        btnKokuminhogoKankeikikan.titleLabel!.adjustsFontSizeToFitWidth = true
        btnKokuminhogoKankeikikan.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogoKankeikikan.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnKokuminhogoKankeikikan.tag=9
        btnKokuminhogoKankeikikan.translatesAutoresizingMaskIntoConstraints = false
        btnKokuminhogoKankeikikan.addTarget(self, action: #selector(self.showInfoKankeikikan(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKokuminhogoKankeikikan)
        //情報（停電）
        btnKokuminhogoBlackout.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogoBlackout.layer.masksToBounds = true
        btnKokuminhogoBlackout.setTitle("情報(停電)", forState: UIControlState.Normal)
        btnKokuminhogoBlackout.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogoBlackout.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnKokuminhogoBlackout.tag=10
        btnKokuminhogoBlackout.translatesAutoresizingMaskIntoConstraints = false
        btnKokuminhogoBlackout.addTarget(self, action: #selector(self.showInfoBlackout(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKokuminhogoBlackout)
        //情報（道路）
        btnKokuminhogoRoad.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogoRoad.layer.masksToBounds = true
        btnKokuminhogoRoad.setTitle("情報(道路)", forState: UIControlState.Normal)
        btnKokuminhogoRoad.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogoRoad.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnKokuminhogoRoad.tag=11
        btnKokuminhogoRoad.translatesAutoresizingMaskIntoConstraints = false
        btnKokuminhogoRoad.addTarget(self, action: #selector(self.showInfoRoad(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKokuminhogoRoad)
        //連絡網
        btnKokuminhogoTel.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogoTel.layer.masksToBounds = true
        btnKokuminhogoTel.setTitle("連絡網", forState: UIControlState.Normal)
        btnKokuminhogoTel.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogoTel.tag=12
        btnKokuminhogoTel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnKokuminhogoTel)
        //留意事項
        btnKokuminhogoCaution.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogoCaution.layer.masksToBounds = true
        btnKokuminhogoCaution.setTitle("留意事項", forState: UIControlState.Normal)
        btnKokuminhogoCaution.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogoCaution.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnKokuminhogoCaution.tag=13
        btnKokuminhogoCaution.translatesAutoresizingMaskIntoConstraints = false
        btnKokuminhogoCaution.addTarget(self, action: #selector(ViewController.showInfoCaution(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKokuminhogoCaution)
        //防災ネット
        btnKokuminhogoBousaiNet.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKokuminhogoBousaiNet.layer.masksToBounds = true
        btnKokuminhogoBousaiNet.setTitle("防災ネット", forState: UIControlState.Normal)
        btnKokuminhogoBousaiNet.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnKokuminhogoBousaiNet.tag=9
        btnKokuminhogoBousaiNet.translatesAutoresizingMaskIntoConstraints = false
        btnKokuminhogoBousaiNet.addTarget(self, action: #selector(self.showInfoBousainet(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnKokuminhogoBousaiNet)
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
        mKokuminhogoResultDialog = KokuminhogoResultDialog(parentView: self) //このViewControllerを渡してあげる
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
            Constraint(lblKokuminhogo, .Bottom, to:padY2, .Top, constant:8),
            Constraint(lblKokuminhogo, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(lblKokuminhogo, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY2
            Constraint(padY2, .Bottom, to:btnKokuminhogo1, .Top, constant:0),
            Constraint(padY2, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY2, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //震度５強以上ボタン
            Constraint(btnKokuminhogo1, .Bottom, to:padY3, .Top, constant:0),
            Constraint(btnKokuminhogo1, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnKokuminhogo1, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY3
            Constraint(padY3, .Bottom, to:btnKokuminhogo2, .Top, constant:0),
            Constraint(padY3, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY3, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //震度５弱ボタン
            Constraint(btnKokuminhogo2, .Bottom, to:padY4, .Top, constant:0),
            Constraint(btnKokuminhogo2, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnKokuminhogo2, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY4
            Constraint(padY4, .Bottom, to:btnKokuminhogo3, .Top, constant:0),
            Constraint(padY4, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY4, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //震度４ボタン Y座標の中心
            Constraint(btnKokuminhogo3, .CenterY, to:self.view, .CenterY, constant:0),
            Constraint(btnKokuminhogo3, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnKokuminhogo3, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY5
            Constraint(padY5, .Top, to:btnKokuminhogo3, .Bottom, constant:0),
            Constraint(padY5, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY5, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //震度３以下ボタン
            Constraint(btnKokuminhogo4, .Top, to:padY5, .Bottom, constant:0),
            Constraint(btnKokuminhogo4, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnKokuminhogo4, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY6
            Constraint(padY6, .Top, to:btnKokuminhogo4, .Bottom, constant:0),
            Constraint(padY6, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY6, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //東海地震に伴う非常招集ボタン
            Constraint(btnKokuminhogo5, .Top, to:padY6, .Bottom, constant:0),
            Constraint(btnKokuminhogo5, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnKokuminhogo5, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //pad21
            Constraint(pad21, .Bottom, to:btnKokuminhogoTel, .Top, constant:-8),
            Constraint(pad21, .Leading, to:self.view, .Leading, constant:0),
            Constraint(pad21, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //情報(関係機関)ボタン
            Constraint(btnKokuminhogoKankeikikan, .Bottom, to:btnKokuminhogoTel, .Top, constant:-8),
            Constraint(btnKokuminhogoKankeikikan, .Leading, to:pad21, .Trailing, constant:0),
            Constraint(btnKokuminhogoKankeikikan, .Width, to:self.view, .Width, multiplier:0.3, constant:0)
            ])
        self.view.addConstraints([
            //pad22
            Constraint(pad22, .Bottom, to:btnKokuminhogoTel, .Top, constant:-8),
            Constraint(pad22, .Leading, to:btnKokuminhogoKankeikikan, .Trailing, constant:0),
            Constraint(pad22, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //情報(停電)ボタン
            Constraint(btnKokuminhogoBlackout, .Bottom, to:btnKokuminhogoTel, .Top, constant:-8),
            Constraint(btnKokuminhogoBlackout, .Leading, to:pad22, .Trailing, constant:0),
            Constraint(btnKokuminhogoBlackout, .Width, to:btnKokuminhogoKankeikikan, .Width, constant:0)
            ])
        self.view.addConstraints([
            //pad23
            Constraint(pad23, .Bottom, to:btnKokuminhogoTel, .Top, constant:-8),
            Constraint(pad23, .Leading, to:btnKokuminhogoBlackout, .Trailing, constant:0),
            Constraint(pad23, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //情報(道路)ボタン
            Constraint(btnKokuminhogoRoad, .Bottom, to:btnKokuminhogoTel, .Top ,constant:-8),
            Constraint(btnKokuminhogoRoad, .Leading, to:pad23, .Trailing, constant:0),
            Constraint(btnKokuminhogoRoad, .Width, to:btnKokuminhogoKankeikikan, .Width, constant:0)
            ])
        self.view.addConstraints([
            //pad31
            Constraint(pad31, .Top, to:btnKokuminhogoKankeikikan, .Bottom, constant:8),
            Constraint(pad31, .Leading, to:self.view, .Leading, constant:0),
            Constraint(pad31, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //連絡網ボタン
            Constraint(btnKokuminhogoTel, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(btnKokuminhogoTel, .Leading, to:pad31, .Trailing, constant:0),
            Constraint(btnKokuminhogoTel, .Width, to:self.view, .Width, multiplier:0.3, constant:0)
            ])
        self.view.addConstraints([
            //pad32
            Constraint(pad32, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(pad32, .Leading, to:btnKokuminhogoTel, .Trailing, constant:0),
            Constraint(pad32, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //留意事項ボタン
            Constraint(btnKokuminhogoCaution, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(btnKokuminhogoCaution, .Leading, to:pad32, .Trailing, constant:0),
            Constraint(btnKokuminhogoCaution, .Width, to:btnKokuminhogoTel, .Width, constant:0)
            ])
        self.view.addConstraints([
            //pad33
            Constraint(pad33, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(pad33, .Leading, to:btnKokuminhogoCaution, .Trailing, constant:0),
            Constraint(pad33, .Width, to:self.view, .Width, multiplier:0.024, constant:0)
            ])
        self.view.addConstraints([
            //防災ネットボタン
            Constraint(btnKokuminhogoBousaiNet, .Bottom, to:self.view, .Bottom ,constant:-8),
            Constraint(btnKokuminhogoBousaiNet, .Leading, to:pad33, .Trailing, constant:0),
            Constraint(btnKokuminhogoBousaiNet, .Width, to:btnKokuminhogoTel, .Width, constant:0)
            ])
    }
    
    //１号非常召集
    func showKokuminhogo1(sender: UIButton){
        mKokuminhogoResultDialog.showResult(1)
    }
    
    //２号非常召集
    func showKokuminhogo2(sender: UIButton){
        mKokuminhogoResultDialog.showResult(2)
    }

    //３号非常召集
    func showKokuminhogo3(sender: UIButton){
        mKokuminhogoResultDialog.showResult(3)
    }

    //４号非常召集
    func showKokuminhogo4(sender: UIButton){
        mKokuminhogoResultDialog.showResult(4)
    }

    //５号非常召集
    func showKokuminhogo5(sender: UIButton){
        mKokuminhogoResultDialog.showResult(5)
    }
    
    //情報(関係機関)
    func showInfoKankeikikan(sender: UIButton){
        mInfoDialog.showInfo("kankeikikan")
    }
    
    //情報（停電）
    func showInfoBlackout(sender: UIButton){
        mInfoDialog.showInfo("blackout")
    }
    
    //情報（道路）
    func showInfoRoad(sender: UIButton){
        mInfoDialog.showInfo("road")
    }
    
    //留意事項
    func showInfoCaution(sender: UIButton){
        mInfoDialog.showInfo("kokuminhogo_caution")
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
    
    //震災画面遷移
    func onClickbtnKokuminhogo(sender : UIButton){
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
