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
    let btnData         = UIButton(frame: CGRect.zero)
    let btnEarthquake   = UIButton(frame: CGRect.zero)
    let btnTyphoon      = UIButton(frame: CGRect.zero)
    let btnKokuminhogo  = UIButton(frame: CGRect.zero)
    let btnKinentai     = UIButton(frame: CGRect.zero)
    let btnContact      = UIButton(frame: CGRect.zero) //連絡網データ操作起動の入口ボタン
    let pad1            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad2            = UIView(frame: CGRect.zero)
    let pad3            = UIView(frame: CGRect.zero)
    let pad4            = UIView(frame: CGRect.zero)
    let lblData         = UILabel(frame: CGRect.zero)
    let lblKinmu        = UILabel(frame: CGRect.zero)
    let picKinmu        = UIPickerView(frame: CGRect.zero)
    let kinmuArray: NSArray = ["消防局","北","都島","福島","此花","中央","西","港","大正","天王寺","浪速","西淀川","淀川","東淀川","東成","生野","旭","城東","鶴見","住之江","阿倍野","住吉","東住吉","平野","西成","水上","教育訓練センター"]
    let lblTsunami      = UILabel(frame: CGRect.zero)
    let picTsunami      = UIPickerView(frame: CGRect.zero)
    let lblKubun        = UILabel(frame: CGRect.zero)
    let picKubun        = UIPickerView(frame: CGRect.zero)
    let kubunArray: NSArray = ["１号招集","２号招集","３号招集","４号招集"]
    let btnSave         = UIButton(frame: CGRect.zero)
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
    //別クラスのインスタンス保持用変数
    fileprivate var mInfoDialog: InfoDialog!
    //データ保存用
    let userDefaults = UserDefaults.standard
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
        //アプリ説明書
        btnData.backgroundColor = UIColor.blue
        btnData.layer.masksToBounds = true
        btnData.setTitle("アプリ説明書", for: UIControlState())
        btnData.setTitleColor(UIColor.white, for: UIControlState())
        btnData.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        btnData.layer.cornerRadius = 8.0
        btnData.tag = 0
        btnData.translatesAutoresizingMaskIntoConstraints = false
        btnData.addTarget(self, action: #selector(self.onClickbtnGuide(_:)), for: .touchUpInside)
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
        //あなたのデータを入力してください
        lblData.text = "所属等を設定し、登録ボタンを押してください"
        lblData.adjustsFontSizeToFitWidth = true
        lblData.textColor = UIColor.black
        lblData.textAlignment = NSTextAlignment.center
        lblData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblData)
        //勤務消防署ラベル
        lblKinmu.text = "■勤務消防署"
        lblKinmu.adjustsFontSizeToFitWidth = true
        lblKinmu.textAlignment = NSTextAlignment.left
        lblKinmu.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKinmu)
        //勤務消防署PickerView
        picKinmu.delegate = self
        picKinmu.dataSource = self
        picKinmu.translatesAutoresizingMaskIntoConstraints = false
        picKinmu.tag = 1
        mainStation = userDefaults.string(forKey: "mainStation") //保存した値を呼び出し
        mainStationRow = userDefaults.integer(forKey: "mainStationRow") //保存した値を呼び出し
        picKinmu.selectRow(mainStationRow!, inComponent:0, animated:false) //呼び出したrow値でピッカー初期化
        self.view.addSubview(picKinmu)
        //大津波・津波警報時参集指定署ラベル
        lblTsunami.text = "■大津波・津波警報時参集指定署"
        lblTsunami.adjustsFontSizeToFitWidth = true
        lblTsunami.textAlignment = NSTextAlignment.left
        lblTsunami.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblTsunami)
        //大津波・津波警報時参集指定署PickerView
        picTsunami.delegate = self
        picTsunami.dataSource = self
        picTsunami.translatesAutoresizingMaskIntoConstraints = false
        picTsunami.tag = 2
        tsunamiStation = userDefaults.string(forKey: "tsunamiStation")
        tsunamiStationRow = userDefaults.integer(forKey: "tsunamiStationRow")
        picTsunami.selectRow(tsunamiStationRow!, inComponent:0, animated:false)
        self.view.addSubview(picTsunami)
        //非常招集区分ラベル
        lblKubun.text = "■非常招集区分"
        lblKubun.adjustsFontSizeToFitWidth = true
        lblKubun.textAlignment = NSTextAlignment.left
        lblKubun.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKubun)
        //非常招集区分PickerView
        picKubun.delegate = self
        picKubun.dataSource = self
        picKubun.translatesAutoresizingMaskIntoConstraints = false
        picKubun.tag = 3
        kubun = userDefaults.string(forKey: "kubun")
        kubunRow = userDefaults.integer(forKey: "kubunRow")
        picKubun.selectRow(kubunRow!, inComponent:0, animated:false)
        self.view.addSubview(picKubun)
        //データ登録ボタン
        btnSave.backgroundColor = UIColor.red
        btnSave.layer.masksToBounds = true
        btnSave.setTitle("登録", for: UIControlState())
        btnSave.setTitleColor(UIColor.white, for: UIControlState())
        btnSave.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        btnSave.layer.cornerRadius = 8.0
        btnSave.tag = 5
        btnSave.addTarget(self, action: #selector(self.onClickbtnSave(_:)), for: .touchUpInside)
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
        btnContact.backgroundColor = UIColor.blue
        btnContact.layer.masksToBounds = true
        btnContact.setTitle("連絡網データ操作", for: UIControlState())
        btnContact.setTitleColor(UIColor.white, for: UIControlState())
        btnContact.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        btnContact.layer.cornerRadius = 8.0
        btnContact.tag = 6
        btnContact.addTarget(self, action: #selector(self.onClickbtnContact(_:)), for: .touchUpInside)
        btnContact.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnContact)
        
        //ボタン押したら表示するDialog生成
        mInfoDialog = InfoDialog(parentView: self) //このViewControllerを渡してあげる
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
            //アプリ説明書ボタン
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
            Constraint(padY1, .height, to:self.view, .height, constant:0, multiplier:0.01)
            ])
        self.view.addConstraints([
            //あなたのデータを入力してくださいラベル
            Constraint(lblData, .top, to:padY1, .bottom, constant:8),
            Constraint(lblData, .centerX, to:self.view, .centerX, constant:8),
            Constraint(lblData, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //勤務消防署ラベル
            Constraint(lblKinmu, .top, to:lblData, .bottom, constant:8),
            Constraint(lblKinmu, .leading, to:self.view, .leading, constant:16),
            Constraint(lblKinmu, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //勤務消防署PickerView
            Constraint(picKinmu, .top, to:lblKinmu, .top, constant:0),
            Constraint(picKinmu, .centerX, to:self.view, .centerX, constant:0),
            Constraint(picKinmu, .height, to:self.view, .height, constant:0, multiplier:0.2)
            ])
        self.view.addConstraints([
            //大津波・津波警報時参集指定署ラベル
            Constraint(lblTsunami, .top, to:picKinmu, .bottom, constant:0),
            Constraint(lblTsunami, .leading, to:self.view, .leading, constant:16),
            Constraint(lblTsunami, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //大津波・津波警報時参集指定署PickerView
            Constraint(picTsunami, .top, to:lblTsunami, .top, constant:0),
            Constraint(picTsunami, .centerX, to:self.view, .centerX, constant:0),
            Constraint(picTsunami, .height, to:self.view, .height, constant:0, multiplier:0.2)
            ])
        self.view.addConstraints([
            //非常招集区分ラベル
            Constraint(lblKubun, .top, to:picTsunami, .bottom, constant:0),
            Constraint(lblKubun, .leading, to:self.view, .leading, constant:16),
            Constraint(lblKubun, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //非常招集区分PickerView
            Constraint(picKubun, .top, to:lblKubun, .top, constant:0),
            Constraint(picKubun, .centerX, to:self.view, .centerX, constant:0),
            Constraint(picKubun, .height, to:self.view, .height, constant:0, multiplier:0.2)
            ])
        self.view.addConstraints([
            //登録ボタン
            Constraint(btnSave, .bottom, to:btnContact, .top, constant:-10),
            Constraint(btnSave, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnSave, .width, to:self.view, .width, constant:8, multiplier:0.5)
            ])
        self.view.addConstraints([
            //アプリ説明書ボタン
            Constraint(btnContact, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(btnContact, .leading, to:self.view, .leading, constant:8),
            Constraint(btnContact, .trailing, to:self.view, .trailingMargin, constant:8)
            ])
    }
    
    //表示例数
    func numberOfComponents(in pickerView: UIPickerView)-> Int{
        return 1
    }
    
    //表示行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int{
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
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row:Int, inComponent component:Int) {
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
    func onClickbtnSave(_ sender : UIButton){
        userDefaults.set(mainStation, forKey:"mainStation")
        userDefaults.set(mainStationRow!, forKey:"mainStationRow")
        userDefaults.set(tsunamiStation, forKey:"tsunamiStation")
        userDefaults.set(tsunamiStationRow!, forKey:"tsunamiStationRow")
        userDefaults.set(kubun, forKey:"kubun")
        userDefaults.set(kubunRow!, forKey:"kubunRow")
        
        //アラート表示
        let alert = UIAlertController(title:"", message: "登録しました", preferredStyle: UIAlertControllerStyle.alert)
        let alertCancel = UIAlertAction(title:"閉じる", style: UIAlertActionStyle.cancel, handler:nil)
        alert.addAction(alertCancel)
        self.present(alert, animated:true, completion: nil)
    }
    
    //震災画面遷移
    func onClickbtnEarthquake(_ sender : UIButton){
        let data:ViewController = ViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.present(nav, animated: true, completion: nil)
    }
    
    //風水害画面遷移
    func onClickbtnTyphoon(_ sender : UIButton){
        let data:TyphoonViewController = TyphoonViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.present(nav, animated: true, completion: nil)
    }
    
    //国民保護画面遷移
    func onClickbtnKokuminhogo(_ sender : UIButton){
        let data:KokuminhogoViewController = KokuminhogoViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.present(nav, animated: true, completion: nil)
    }
    
    //緊援隊画面遷移
    func onClickbtnKinentai(_ sender : UIButton){
        let data:KinentaiViewController = KinentaiViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.present(nav, animated: true, completion: nil)
    }
    
    //連絡網データ操作遷移
    func onClickbtnContact(_ sender : UIButton){
        let data:ContactViewController = ContactViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.present(nav, animated: true, completion: nil)
    }
    
    //アプリ説明書
    func onClickbtnGuide(_ sender : UIButton){
        let data:GuideViewController = GuideViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false)
        self.present(nav, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
