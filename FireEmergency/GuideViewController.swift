//
//  GuideViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/02/26.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {
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
    let lblGuide        = UILabel(frame: CGRectZero)
    let btnGuide1       = UIButton(frame: CGRectZero)
    let btnGuide2       = UIButton(frame: CGRectZero)
    let btnGuide3       = UIButton(frame: CGRectZero)
    let btnGuide4       = UIButton(frame: CGRectZero)
    let btnGuide5       = UIButton(frame: CGRectZero)
    let btnGuide6       = UIButton(frame: CGRectZero)
    let padY1           = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let padY2           = UIView(frame: CGRectZero)
    let padY3           = UIView(frame: CGRectZero)
    let padY4           = UIView(frame: CGRectZero)
    let padY5           = UIView(frame: CGRectZero)
    let padY6           = UIView(frame: CGRectZero)
    //別クラスのインスタンス保持用変数
    private var mInfoDialog: InfoDialog!
    private var mBousainetDialog: BousainetDialog!
    private var mEarthSelectDialog: EarthSelectDialog!
    private var mContactLoadDialog: ContactLoadDialog!
    private var mContactLoadDialog2: ContactLoadDialog2!
    private var mContactUpdateSelectDialog: ContactUpdateSelectDialog!
    private var mContactDeleteDialog: ContactDeleteDialog!
    private var mContactImportCSVDialog: ContactImportCSVDialog!
    private var mGuide1Dialog: Guide1Dialog!
    private var mGuide2SelectDialog: Guide2SelectDialog!
    private var mGuide3Dialog: Guide3Dialog!
    private var mGuide4SelectDialog: Guide4SelectDialog!
    private var mGuide5Dialog: Guide5Dialog!
    //結果表示用クラス保持用
    internal var mEarthResultDialog: EarthResultDialog!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        //Button生成
        //使用目的
        btnData.backgroundColor = UIColor.blueColor()
        btnData.layer.masksToBounds = true
        btnData.setTitle("参集アプリの使用目的", forState: UIControlState.Normal)
        btnData.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnData.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        btnData.layer.cornerRadius = 8.0
        btnData.tag = 0
        btnData.addTarget(self, action: #selector(self.showPurpose(_:)), forControlEvents: .TouchUpInside)
        btnData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnData)
        //震災
        btnEarthquake.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnEarthquake.layer.masksToBounds = true
        btnEarthquake.setTitle("震災", forState: UIControlState.Normal)
        btnEarthquake.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquake.tag=1
        btnEarthquake.translatesAutoresizingMaskIntoConstraints = false
        btnEarthquake.addTarget(self, action: #selector(self.onClickbtnEarthquake(_:)), forControlEvents: .TouchUpInside)
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
        //アプリ説明書
        lblGuide.text = "アプリ説明書"
        lblGuide.textColor = UIColor.blackColor()
        lblGuide.textAlignment = NSTextAlignment.Center
        lblGuide.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblGuide)
        //説明１
        btnGuide1.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide1.layer.masksToBounds = true
        btnGuide1.setTitle("基礎データ入力ボタン", forState: UIControlState.Normal)
        btnGuide1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnGuide1.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnGuide1.translatesAutoresizingMaskIntoConstraints = false
        btnGuide1.addTarget(self, action: #selector(self.showGuide1(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnGuide1)
        //説明２
        btnGuide2.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide2.layer.masksToBounds = true
        btnGuide2.setTitle("連絡網データ操作", forState: UIControlState.Normal)
        btnGuide2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnGuide2.translatesAutoresizingMaskIntoConstraints = false
        btnGuide2.addTarget(self, action: #selector(self.showGuide2(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnGuide2)
        //説明３
        btnGuide3.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide3.layer.masksToBounds = true
        btnGuide3.setTitle("各事象操作画面切り替えボタン", forState: UIControlState.Normal)
        btnGuide3.titleLabel?.font = UIFont.systemFontOfSize(16)
        btnGuide3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnGuide3.translatesAutoresizingMaskIntoConstraints = false
        btnGuide3.addTarget(self, action: #selector(self.showGuide3(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnGuide3)
        //説明４
        btnGuide4.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide4.layer.masksToBounds = true
        btnGuide4.setTitle("非常招集確認ボタン", forState: UIControlState.Normal)
        btnGuide4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnGuide4.translatesAutoresizingMaskIntoConstraints = false
        btnGuide4.addTarget(self, action: #selector(self.showGuide4(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnGuide4)
        //説明５
        btnGuide5.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide5.layer.masksToBounds = true
        btnGuide5.setTitle("情報確認ボタン", forState: UIControlState.Normal)
        btnGuide5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnGuide5.translatesAutoresizingMaskIntoConstraints = false
        btnGuide5.addTarget(self, action: #selector(self.showGuide5(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnGuide5)
        //説明６
        btnGuide6.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide6.layer.masksToBounds = true
        btnGuide6.setTitle("連絡網ボタン", forState: UIControlState.Normal)
        btnGuide6.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnGuide6.translatesAutoresizingMaskIntoConstraints = false
        btnGuide6.addTarget(self, action: #selector(self.showGuide6(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnGuide6)

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
        
        //ボタン押したら表示するDialog生成
        mInfoDialog = InfoDialog(parentView: self) //このViewControllerを渡してあげる
        mBousainetDialog = BousainetDialog(parentView: self)
        mGuide1Dialog = Guide1Dialog(parentView: self)
        mGuide2SelectDialog = Guide2SelectDialog(parentView: self)
        mGuide3Dialog = Guide3Dialog(parentView: self)
        mGuide4SelectDialog = Guide4SelectDialog(parentView: self)
        mGuide5Dialog = Guide5Dialog(parentView: self)
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
            //アプリ説明書ラベル
            Constraint(lblGuide, .Bottom, to:padY2, .Top, constant:8),
            Constraint(lblGuide, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(lblGuide, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY2
            Constraint(padY2, .Bottom, to:btnGuide1, .Top, constant:0),
            Constraint(padY2, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY2, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //説明１ボタン
            Constraint(btnGuide1, .Bottom, to:padY3, .Top, constant:0),
            Constraint(btnGuide1, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnGuide1, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY3
            Constraint(padY3, .Bottom, to:btnGuide2, .Top, constant:0),
            Constraint(padY3, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY3, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //説明２ボタン
            Constraint(btnGuide2, .Bottom, to:padY4, .Top, constant:0),
            Constraint(btnGuide2, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnGuide2, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY4
            Constraint(padY4, .Bottom, to:btnGuide3, .Top, constant:0),
            Constraint(padY4, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY4, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //説明３ボタン Y座標の中心
            Constraint(btnGuide3, .CenterY, to:self.view, .CenterY, constant:0),
            Constraint(btnGuide3, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnGuide3, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY5
            Constraint(padY5, .Top, to:btnGuide3, .Bottom, constant:0),
            Constraint(padY5, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY5, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //説明４ボタン
            Constraint(btnGuide4, .Top, to:padY5, .Bottom, constant:0),
            Constraint(btnGuide4, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnGuide4, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //padY6
            Constraint(padY6, .Top, to:btnGuide4, .Bottom, constant:0),
            Constraint(padY6, .Leading, to:self.view, .Leading, constant:0),
            Constraint(padY6, .Height, to:self.view, .Height, multiplier:0.03, constant:0)
            ])
        self.view.addConstraints([
            //説明５ボタン
            Constraint(btnGuide5, .Top, to:padY6, .Bottom, constant:0),
            Constraint(btnGuide5, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnGuide5, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //説明６ボタン
            Constraint(btnGuide6, .Top, to:btnGuide5, .Bottom, constant:16),
            Constraint(btnGuide6, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnGuide6, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
    }
    
    //参集アプリの使用目的
    func showPurpose(sender: UIButton){
        mInfoDialog.showInfo("purpose")
    }
    
    //説明１
    func showGuide1(sender: UIButton){
        mGuide1Dialog.showInfo()
    }
    
    //説明２
    func showGuide2(sender: UIButton){
        mGuide2SelectDialog.showInfo()
    }
    
    //説明３
    func showGuide3(sender: UIButton){
        mGuide3Dialog.showInfo()
    }
    
    //説明４
    func showGuide4(sender: UIButton){
        mGuide4SelectDialog.showInfo()
    }
    
    //説明５
    func showGuide5(sender: UIButton){
        mGuide5Dialog.showInfo()
    }
    
    //説明６
    func showGuide6(sender: UIButton){
        
    }
    
    //情報(地震)
    func showInfoEarthquake(sender: UIButton){
        mInfoDialog.showInfo("earthquake")
    }
    
    //情報（停電）
    func showInfoBlackout(sender: UIButton){
        mInfoDialog.showInfo("blackout")
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
        let data:DataViewController = DataViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    //震災画面遷移
    func onClickbtnEarthquake(sender : UIButton){
        let data:ViewController = ViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    //風水害画面遷移
    func onClickbtnTyphoon(sender : UIButton){
        let data:TyphoonViewController = TyphoonViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    //国民保護画面遷移
    func onClickbtnKokuminhogo(sender : UIButton){
        let data:KokuminhogoViewController = KokuminhogoViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    //緊援隊画面遷移
    func onClickbtnKinentai(sender : UIButton){
        let data:KinentaiViewController = KinentaiViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
