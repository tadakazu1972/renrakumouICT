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
    let btnData         = UIButton(frame: CGRect.zero)
    let btnEarthquake   = UIButton(frame: CGRect.zero)
    let btnTyphoon      = UIButton(frame: CGRect.zero)
    let btnKokuminhogo  = UIButton(frame: CGRect.zero)
    let btnKinentai     = UIButton(frame: CGRect.zero)
    let pad1            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad2            = UIView(frame: CGRect.zero)
    let pad3            = UIView(frame: CGRect.zero)
    let pad4            = UIView(frame: CGRect.zero)
    let lblTyphoon      = UILabel(frame: CGRect.zero)
    let btnTyphoon1     = UIButton(frame: CGRect.zero)
    let btnTyphoon2     = UIButton(frame: CGRect.zero)
    let btnTyphoon3     = UIButton(frame: CGRect.zero)
    let padY1           = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let padY2           = UIView(frame: CGRect.zero)
    let padY3           = UIView(frame: CGRect.zero)
    let padY4           = UIView(frame: CGRect.zero)
    let padY5           = UIView(frame: CGRect.zero)
    let btnTyphoonWeather = UIButton(frame: CGRect.zero)
    let btnTyphoonRiver   = UIButton(frame: CGRect.zero)
    let btnTyphoonRoad       = UIButton(frame: CGRect.zero)
    let btnTyphoonTel        = UIButton(frame: CGRect.zero)
    let btnTyphoonCaution    = UIButton(frame: CGRect.zero)
    let btnTyphoonBousaiNet  = UIButton(frame: CGRect.zero)
    let pad21            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad22            = UIView(frame: CGRect.zero)
    let pad23            = UIView(frame: CGRect.zero)
    let pad31            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad32            = UIView(frame: CGRect.zero)
    let pad33            = UIView(frame: CGRect.zero)
    //別クラスのインスタンス保持用変数
    fileprivate var mInfoDialog: InfoDialog!
    fileprivate var mBousainetDialog: BousainetDialog!
    fileprivate var mTyphoonSelectDialog: TyphoonSelectDialog!
    fileprivate var mPassInputDialog: PassInputDialog!
    //結果表示用クラス保持用
    internal var mTyphoonResultDialog: TyphoonResultDialog!
    //データ保存用
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.2, green:0.2, blue:0.9, alpha:1.0)
        //Button生成
        //基礎データ入力
        btnData.backgroundColor = UIColor.red
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
        btnEarthquake.addTarget(self, action: #selector(self.onClickbtnEarthquake(_:)), for: .touchUpInside)
        btnEarthquake.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnEarthquake)
        //風水害
        btnTyphoon.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon.layer.masksToBounds = true
        btnTyphoon.setTitle("風水害", for: UIControlState())
        btnTyphoon.setTitleColor(UIColor.black, for: UIControlState())
        btnTyphoon.tag=2
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
        //非常召集基準（風水害）
        lblTyphoon.text = "非常招集基準（風水害）"
        lblTyphoon.textColor = UIColor.white
        lblTyphoon.textAlignment = NSTextAlignment.center
        lblTyphoon.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblTyphoon)
        //非常警備の基準（全て）
        btnTyphoon1.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon1.layer.masksToBounds = true
        btnTyphoon1.setTitle("非常警備の基準(全て)", for: UIControlState())
        btnTyphoon1.setTitleColor(UIColor.black, for: UIControlState())
        btnTyphoon1.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnTyphoon1.tag=5
        btnTyphoon1.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoon1.addTarget(self, action: #selector(self.showSelectTyphoon1(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoon1)
        //気象警報による非常招集
        btnTyphoon2.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon2.layer.masksToBounds = true
        btnTyphoon2.setTitle("気象警報による非常招集", for: UIControlState())
        btnTyphoon2.setTitleColor(UIColor.black, for: UIControlState())
        btnTyphoon2.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnTyphoon2.tag=6
        btnTyphoon2.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoon2.addTarget(self, action: #selector(self.showSelectTyphoon2(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoon2)
        //河川水位による非常招集
        btnTyphoon3.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon3.layer.masksToBounds = true
        btnTyphoon3.setTitle("河川水位による非常招集", for: UIControlState())
        btnTyphoon3.setTitleColor(UIColor.black, for: UIControlState())
        btnTyphoon3.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnTyphoon3.tag=7
        btnTyphoon3.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoon3.addTarget(self, action: #selector(self.showSelectTyphoon3(_:)), for: .touchUpInside)
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
        btnTyphoonWeather.setTitle("情報(気象)", for: UIControlState())
        btnTyphoonWeather.setTitleColor(UIColor.black, for: UIControlState())
        btnTyphoonWeather.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnTyphoonWeather.tag=9
        btnTyphoonWeather.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonWeather.addTarget(self, action: #selector(self.showInfoWeather(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoonWeather)
        //情報（河川）
        btnTyphoonRiver.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonRiver.layer.masksToBounds = true
        btnTyphoonRiver.setTitle("情報(河川)", for: UIControlState())
        btnTyphoonRiver.setTitleColor(UIColor.black, for: UIControlState())
        btnTyphoonRiver.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnTyphoonRiver.tag=10
        btnTyphoonRiver.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonRiver.addTarget(self, action: #selector(self.showInfoRiver(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoonRiver)
        //情報（道路）
        btnTyphoonRoad.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonRoad.layer.masksToBounds = true
        btnTyphoonRoad.setTitle("情報(道路)", for: UIControlState())
        btnTyphoonRoad.setTitleColor(UIColor.black, for: UIControlState())
        btnTyphoonRoad.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnTyphoonRoad.tag=11
        btnTyphoonRoad.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonRoad.addTarget(self, action: #selector(self.showInfoRoad(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoonRoad)
        //連絡網
        btnTyphoonTel.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonTel.layer.masksToBounds = true
        btnTyphoonTel.setTitle("連絡網", for: UIControlState())
        btnTyphoonTel.setTitleColor(UIColor.black, for: UIControlState())
        btnTyphoonTel.tag=12
        btnTyphoonTel.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonTel.addTarget(self, action: #selector(self.showContactLoad(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoonTel)
        //留意事項
        btnTyphoonCaution.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonCaution.layer.masksToBounds = true
        btnTyphoonCaution.setTitle("留意事項", for: UIControlState())
        btnTyphoonCaution.setTitleColor(UIColor.black, for: UIControlState())
        btnTyphoonCaution.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnTyphoonCaution.tag=13
        btnTyphoonCaution.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonCaution.addTarget(self, action: #selector(self.showInfoCaution(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoonCaution)
        //防災ネット
        btnTyphoonBousaiNet.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonBousaiNet.layer.masksToBounds = true
        btnTyphoonBousaiNet.setTitle("防災ネット", for: UIControlState())
        btnTyphoonBousaiNet.setTitleColor(UIColor.black, for: UIControlState())
        btnTyphoonBousaiNet.tag=14
        btnTyphoonBousaiNet.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonBousaiNet.addTarget(self, action: #selector(self.showInfoBousainet(_:)), for: .touchUpInside)
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
        mBousainetDialog = BousainetDialog(parentView: self)
        mTyphoonResultDialog = TyphoonResultDialog(parentView: self) //このViewControllerを渡してあげる
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
            //非常召集基準（風水害）ラベル
            Constraint(lblTyphoon, .bottom, to:padY2, .top, constant:8),
            Constraint(lblTyphoon, .centerX, to:self.view, .centerX, constant:8),
            Constraint(lblTyphoon, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY2
            Constraint(padY2, .bottom, to:btnTyphoon1, .top, constant:0),
            Constraint(padY2, .leading, to:self.view, .leading, constant:0),
            Constraint(padY2, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //非常警備の基準(全て)ボタン
            Constraint(btnTyphoon1, .bottom, to:padY3, .top, constant:0),
            Constraint(btnTyphoon1, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnTyphoon1, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY3
            Constraint(padY3, .bottom, to:btnTyphoon2, .top, constant:0),
            Constraint(padY3, .leading, to:self.view, .leading, constant:0),
            Constraint(padY3, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //気象警報による非常招集ボタン Y座標の中心
            Constraint(btnTyphoon2, .centerY, to:self.view, .centerY, constant:0),
            Constraint(btnTyphoon2, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnTyphoon2, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY4
            Constraint(padY4, .top, to:btnTyphoon2, .bottom, constant:0),
            Constraint(padY4, .leading, to:self.view, .leading, constant:0),
            Constraint(padY4, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //河川水位による非常招集ボタン
            Constraint(btnTyphoon3, .top, to:padY4, .bottom, constant:0),
            Constraint(btnTyphoon3, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnTyphoon3, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY5
            Constraint(padY5, .top, to:btnTyphoon3, .bottom, constant:0),
            Constraint(padY5, .leading, to:self.view, .leading, constant:0),
            Constraint(padY5, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //pad21
            Constraint(pad21, .bottom, to:btnTyphoonTel, .top, constant:-8),
            Constraint(pad21, .leading, to:self.view, .leading, constant:0),
            Constraint(pad21, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(気象)ボタン
            Constraint(btnTyphoonWeather, .bottom, to:btnTyphoonTel, .top, constant:-8),
            Constraint(btnTyphoonWeather, .leading, to:pad21, .trailing, constant:0),
            Constraint(btnTyphoonWeather, .width, to:self.view, .width, constant:0, multiplier:0.3)
            ])
        self.view.addConstraints([
            //pad22
            Constraint(pad22, .bottom, to:btnTyphoonTel, .top, constant:-8),
            Constraint(pad22, .leading, to:btnTyphoonWeather, .trailing, constant:0),
            Constraint(pad22, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(河川)ボタン
            Constraint(btnTyphoonRiver, .bottom, to:btnTyphoonTel, .top, constant:-8),
            Constraint(btnTyphoonRiver, .leading, to:pad22, .trailing, constant:0),
            Constraint(btnTyphoonRiver, .width, to:btnTyphoonWeather, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad23
            Constraint(pad23, .bottom, to:btnTyphoonTel, .top, constant:-8),
            Constraint(pad23, .leading, to:btnTyphoonRiver, .trailing, constant:0),
            Constraint(pad23, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(道路)ボタン
            Constraint(btnTyphoonRoad, .bottom, to:btnTyphoonTel, .top ,constant:-8),
            Constraint(btnTyphoonRoad, .leading, to:pad23, .trailing, constant:0),
            Constraint(btnTyphoonRoad, .width, to:btnTyphoonWeather, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad31
            Constraint(pad31, .top, to:btnTyphoonWeather, .bottom, constant:8),
            Constraint(pad31, .leading, to:self.view, .leading, constant:0),
            Constraint(pad31, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //連絡網ボタン
            Constraint(btnTyphoonTel, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(btnTyphoonTel, .leading, to:pad31, .trailing, constant:0),
            Constraint(btnTyphoonTel, .width, to:self.view, .width, constant:0, multiplier:0.3)
            ])
        self.view.addConstraints([
            //pad32
            Constraint(pad32, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(pad32, .leading, to:btnTyphoonTel, .trailing, constant:0),
            Constraint(pad32, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //留意事項ボタン
            Constraint(btnTyphoonCaution, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(btnTyphoonCaution, .leading, to:pad32, .trailing, constant:0),
            Constraint(btnTyphoonCaution, .width, to:btnTyphoonTel, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad33
            Constraint(pad33, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(pad33, .leading, to:btnTyphoonCaution, .trailing, constant:0),
            Constraint(pad33, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //防災ネットボタン
            Constraint(btnTyphoonBousaiNet, .bottom, to:self.view, .bottom ,constant:-8),
            Constraint(btnTyphoonBousaiNet, .leading, to:pad33, .trailing, constant:0),
            Constraint(btnTyphoonBousaiNet, .width, to:btnTyphoonTel, .width, constant:0)
            ])
    }
    
    //非常警備の基準(全て)
    func showSelectTyphoon1(_ sender: UIButton){
        mTyphoonResultDialog.showResult(11)
    }
    
    //気象警報による非常招集
    func showSelectTyphoon2(_ sender: UIButton){
        mTyphoonSelectDialog = TyphoonSelectDialog(index: 2, parentView: self)
        mTyphoonSelectDialog.showInfo()
    }
    
    //河川水位による非常招集
    func showSelectTyphoon3(_ sender: UIButton){
        mTyphoonSelectDialog = TyphoonSelectDialog(index: 3, parentView: self)
        mTyphoonSelectDialog.showInfo()
    }
    
    //情報(気象)
    func showInfoWeather(_ sender: UIButton){
        mInfoDialog.showInfo("weather")
    }
    
    //情報（河川）
    func showInfoRiver(_ sender: UIButton){
        mInfoDialog.showInfo("river")
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

    //留意事項
    func showInfoCaution(_ sender: UIButton){
        mInfoDialog.showInfo("typhoon_caution")
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
    
    //震災画面遷移
    func onClickbtnEarthquake(_ sender : UIButton){
        //インスタンス生成
        let data:ViewController = ViewController()
        
        //navigationControllerのrootViewControllerにViewControllerをセット
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
