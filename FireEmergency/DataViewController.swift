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
    let pad1            = UIView(frame: CGRectZero) //ボタンの間にはさむ見えないpaddingがわり
    let pad2            = UIView(frame: CGRectZero)
    let pad3            = UIView(frame: CGRectZero)
    let pad4            = UIView(frame: CGRectZero)
    let lblData         = UILabel(frame: CGRectZero)
    let lblKinmu        = UILabel(frame: CGRectZero)
    let picKinmu        = UIPickerView(frame: CGRectZero)
    let kinmuArray: NSArray = ["消防局","北","都島","福島","此花","中央","西","港","大正","天王寺","浪速","西淀川","淀川","東淀川","東成","生野","旭","城東","鶴見","住之江","阿倍野","住吉","東住吉","平野","西成","水上","教育訓練センター"]
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
    //結果表示用クラス保持用
    
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
        //あなたのデータを入力してください
        lblData.text = "あなたのデータを入力してください"
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
        picKinmu.frame = CGRectMake(0,140,self.view.bounds.width, 100.0)
        picKinmu.delegate = self
        picKinmu.dataSource = self
        self.view.addSubview(picKinmu)
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
        /*self.view.addConstraints([
            //勤務消防署PickerView
            Constraint(picKinmu, .Top, to:self.view, .Top, constant:20)
            ])*/
    }
    
    //表示例数
    func numberOfComponentsInPickerView(pickerView: UIPickerView)-> Int{
        return 1
    }
    
    //表示行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int{
        return kinmuArray.count
    }
    
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
        return kinmuArray[row] as? String
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row:Int, inComponent component:Int) {
        print("列:\(row)")
        print("値:\(kinmuArray[row])")
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
