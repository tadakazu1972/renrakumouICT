//
//  DataViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/09/11.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //メイン画面
    let btnData         = UIButton(frame: CGRectZero)
    let btnEarthquake   = UIButton(frame: CGRectZero)
    let btnTyphoon      = UIButton(frame: CGRectZero)
    let btnKokuminhogo  = UIButton(frame: CGRectZero)
    let btnKinentai     = UIButton(frame: CGRectZero)
    let btnContact      = UIButton(frame: CGRectZero) //連絡網データ操作起動の入口ボタン
    let pad1            = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let pad2            = UIView(frame: CGRectZero)
    let pad3            = UIView(frame: CGRectZero)
    let pad4            = UIView(frame: CGRectZero)
    let lblData         = UILabel(frame: CGRectZero)
    let lblKinmu        = UILabel(frame: CGRectZero)
    let picKinmu        = UIPickerView(frame: CGRectZero)
    let kinmuArray: NSArray = ["消防局","北","都島","福島","此花","中央","西","港","大正","天王寺","浪速","西淀川","淀川","東淀川","東成","生野","旭","城東","鶴見","住之江","阿倍野","住吉","東住吉","平野","西成","水上","教育訓練センター"]
    let lblTsunami      = UILabel(frame: CGRectZero)
    let picTsunami      = UIPickerView(frame: CGRectZero)
    let lblKubun        = UILabel(frame: CGRectZero)
    let picKubun        = UIPickerView(frame: CGRectZero)
    let kubunArray: NSArray = ["１号招集","２号招集","３号招集","４号招集"]
    let btnSave         = UIButton(frame: CGRectZero)
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
    //別クラスのインスタンス保持用変数
    private var mInfoDialog: InfoDialog!
    //データ保存用
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var mainStation: String?
    var mainStationRow: Int?
    var tsunamiStation: String?
    var tsunamiStationRow: Int?
    var kubun: String?
    var kubunRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        //Button生成
        //基礎データ入力
        btnData.backgroundColor = UIColor.blueColor()
        btnData.layer.masksToBounds = true
        btnData.setTitle("アプリ説明書", forState: UIControlState.Normal)
        btnData.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnData.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        btnData.layer.cornerRadius = 8.0
        btnData.tag = 0
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
        btnKinentai.addTarget(self, action: #selector(self.onClickbtnKinentai(_:)), forControlEvents: .TouchUpInside)
        btnKinentai.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnKinentai)
        //あなたのデータを入力してください
        lblData.text = "所属等を設定し、登録ボタンを押してください"
        lblData.adjustsFontSizeToFitWidth = true
        lblData.textColor = UIColor.blackColor()
        lblData.textAlignment = NSTextAlignment.Center
        lblData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblData)
        //勤務消防署ラベル
        lblKinmu.text = "■勤務消防署"
        lblKinmu.adjustsFontSizeToFitWidth = true
        lblKinmu.textAlignment = NSTextAlignment.Left
        lblKinmu.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKinmu)
        //勤務消防署PickerView
        picKinmu.delegate = self
        picKinmu.dataSource = self
        picKinmu.translatesAutoresizingMaskIntoConstraints = false
        picKinmu.tag = 1
        mainStation = userDefaults.stringForKey("mainStation") //保存した値を呼び出し
        mainStationRow = userDefaults.integerForKey("mainStationRow") //保存した値を呼び出し
        picKinmu.selectRow(mainStationRow!, inComponent:0, animated:false) //呼び出したrow値でピッカー初期化
        self.view.addSubview(picKinmu)
        //大津波・津波警報時参集指定署ラベル
        lblTsunami.text = "■大津波・津波警報時参集指定署"
        lblTsunami.adjustsFontSizeToFitWidth = true
        lblTsunami.textAlignment = NSTextAlignment.Left
        lblTsunami.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblTsunami)
        //大津波・津波警報時参集指定署PickerView
        picTsunami.delegate = self
        picTsunami.dataSource = self
        picTsunami.translatesAutoresizingMaskIntoConstraints = false
        picTsunami.tag = 2
        tsunamiStation = userDefaults.stringForKey("tsunamiStation")
        tsunamiStationRow = userDefaults.integerForKey("tsunamiStationRow")
        picTsunami.selectRow(tsunamiStationRow!, inComponent:0, animated:false)
        self.view.addSubview(picTsunami)
        //非常招集区分ラベル
        lblKubun.text = "■非常招集区分"
        lblKubun.adjustsFontSizeToFitWidth = true
        lblKubun.textAlignment = NSTextAlignment.Left
        lblKubun.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKubun)
        //非常招集区分PickerView
        picKubun.delegate = self
        picKubun.dataSource = self
        picKubun.translatesAutoresizingMaskIntoConstraints = false
        picKubun.tag = 3
        kubun = userDefaults.stringForKey("kubun")
        kubunRow = userDefaults.integerForKey("kubunRow")
        picKubun.selectRow(kubunRow!, inComponent:0, animated:false)
        self.view.addSubview(picKubun)
        //データ登録ボタン
        btnSave.backgroundColor = UIColor.redColor()
        btnSave.layer.masksToBounds = true
        btnSave.setTitle("登録", forState: UIControlState.Normal)
        btnSave.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnSave.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        btnSave.layer.cornerRadius = 8.0
        btnSave.tag = 5
        btnSave.addTarget(self, action: #selector(self.onClickbtnSave(_:)), forControlEvents: .TouchUpInside)
        btnSave.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnSave)
        //pad
        pad1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad1)
        pad2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad2)
        pad3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad3)
        pad4.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad4)
        //垂直方向のpad
        padY1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY1)
        padY2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY2)
        
        //連絡網データ操作
        btnContact.backgroundColor = UIColor.blueColor()
        btnContact.layer.masksToBounds = true
        btnContact.setTitle("連絡網データ操作", forState: UIControlState.Normal)
        btnContact.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnContact.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        btnContact.layer.cornerRadius = 8.0
        btnContact.tag = 6
        btnContact.addTarget(self, action: #selector(self.onClickbtnContact(_:)), forControlEvents: .TouchUpInside)
        btnContact.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnContact)
        
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
            //アプリ説明書ボタン
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
            Constraint(padY1, .Height, to:self.view, .Height, multiplier:0.01, constant:0)
            ])
        self.view.addConstraints([
            //あなたのデータを入力してくださいラベル
            Constraint(lblData, .Top, to:padY1, .Bottom, constant:8),
            Constraint(lblData, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(lblData, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //勤務消防署ラベル
            Constraint(lblKinmu, .Top, to:lblData, .Bottom, constant:8),
            Constraint(lblKinmu, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblKinmu, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //勤務消防署PickerView
            Constraint(picKinmu, .Top, to:lblKinmu, .Top, constant:0),
            Constraint(picKinmu, .Height, to:self.view, .Height, multiplier:0.2, constant:0)
            ])
        self.view.addConstraints([
            //大津波・津波警報時参集指定署ラベル
            Constraint(lblTsunami, .Top, to:picKinmu, .Bottom, constant:0),
            Constraint(lblTsunami, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblTsunami, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //大津波・津波警報時参集指定署PickerView
            Constraint(picTsunami, .Top, to:lblTsunami, .Top, constant:0),
            Constraint(picTsunami, .Height, to:self.view, .Height, multiplier:0.2, constant:0)
            ])
        self.view.addConstraints([
            //非常招集区分ラベル
            Constraint(lblKubun, .Top, to:picTsunami, .Bottom, constant:0),
            Constraint(lblKubun, .Leading, to:self.view, .Leading, constant:16),
            Constraint(lblKubun, .Width, to:self.view, .Width, multiplier:0.8, constant:0)
            ])
        self.view.addConstraints([
            //非常招集区分PickerView
            Constraint(picKubun, .Top, to:lblKubun, .Top, constant:0),
            Constraint(picKubun, .Height, to:self.view, .Height, multiplier:0.2, constant:0)
            ])
        self.view.addConstraints([
            //登録ボタン
            Constraint(btnSave, .Bottom, to:btnContact, .Top, constant:-10),
            Constraint(btnSave, .CenterX, to:self.view, .CenterX, constant:8),
            Constraint(btnSave, .Width, to:self.view, .Width, multiplier:0.5, constant:8)
            ])
        self.view.addConstraints([
            //アプリ説明書ボタン
            Constraint(btnContact, .Bottom, to:self.view, .Bottom, constant:-8),
            Constraint(btnContact, .Leading, to:self.view, .Leading, constant:8),
            Constraint(btnContact, .Trailing, to:self.view, .TrailingMargin, constant:8)
            ])
    }
    
    //表示例数
    func numberOfComponentsInPickerView(pickerView: UIPickerView)-> Int{
        return 1
    }
    
    //表示行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int{
        //返す行数
        var rowNum: Int
        //３種類のピッカーをタグで場合分け
        if (pickerView.tag==1){
            rowNum = kinmuArray.count
        } else if (pickerView.tag==2){
            rowNum = kinmuArray.count
        } else {
            rowNum = kubunArray.count
        }
        return rowNum
    }
    
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
        //返す列
        var picComponent: String?
        //３種類のピッカーをタグで場合分け
        if (pickerView.tag==1){
            picComponent = kinmuArray[row] as? String
        } else if (pickerView.tag==2){
            picComponent = kinmuArray[row] as? String
        } else {
            picComponent = kubunArray[row] as? String
        }
        return picComponent
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row:Int, inComponent component:Int) {
        print("列:\(row)")
        if (pickerView.tag==3){
            print("値:\(kubunArray[row])")
        } else {
        print("値:\(kinmuArray[row])")
        }
        //３種類のピッカーをタグで場合分け
        if (pickerView.tag==1){
            //一時保存
            mainStation = kinmuArray[row] as? String
            mainStationRow = row
        } else if (pickerView.tag==2){
            //一時保存
            tsunamiStation = kinmuArray[row] as? String
            tsunamiStationRow = row
        } else {
            //一時保存
            kubun = kubunArray[row] as? String
            kubunRow = row
        }
    }
    
    //登録ボタンクリック
    func onClickbtnSave(sender : UIButton){
        userDefaults.setObject(mainStation, forKey:"mainStation")
        userDefaults.setInteger(mainStationRow!, forKey:"mainStationRow")
        userDefaults.setObject(tsunamiStation, forKey:"tsunamiStation")
        userDefaults.setInteger(tsunamiStationRow!, forKey:"tsunamiStationRow")
        userDefaults.setObject(kubun, forKey:"kubun")
        userDefaults.setInteger(kubunRow!, forKey:"kubunRow")
    }
    
    //震災画面遷移
    func onClickbtnEarthquake(sender : UIButton){
        //dataViewControllerのインスタンス生成
        let data:ViewController = ViewController()
        
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
    
    //連絡網データ操作遷移
    func onClickbtnContact(sender : UIButton){
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
