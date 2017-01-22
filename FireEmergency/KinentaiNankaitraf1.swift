//
//  KinentaiNankaitraf1.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/18.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class KinentaiNankaitraf1 : UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    //ボタン押したら出るUIWindow
    private var parent: KinentaiViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var textField1: UITextField!
    private var pic1: UIPickerView!
    let pic1Array: NSArray = ["山梨県中・西部","長野県南部","静岡県東部","静岡県中部","静岡県西部","駿河湾","駿河湾南方沖","新島・神津島近海","愛知県東部","愛知県西部","遠州灘","三河湾","岐阜県美濃東部","三重県北部","三重県中部","三重県南部","伊勢湾","三重県南東沖","和歌山県北部","和歌山県南部","和歌山県南方沖","紀伊水道","奈良県","淡路島付近","播磨灘","徳島県北部","徳島県南部","香川県東部","香川県西部","瀬戸内海中部","愛媛県東予","愛媛県中予","愛媛県南予","伊予灘豊後水道","高知県東部","高知県中部","高知県西部","土佐湾","四国沖","大分県南部","宮崎県北部平野部","日向灘","九州地方南東沖","その他"]
    private var label2: UILabel!
    private var text2: UITextView!
    private var textField2: UITextField!
    private var pic2: UIPickerView!
    let pic2Array: NSArray = ["山梨県","長野県","岐阜県","静岡県","愛知県","三重県","その他"]
    private var text3: UITextView!
    private var textField3: UITextField!
    private var pic3: UIPickerView!
    let pic3Array: NSArray = ["兵庫県","奈良県","和歌山県","その他"]
    private var text4: UITextView!
    private var textField4: UITextField!
    private var pic4: UIPickerView!
    let pic4Array: NSArray = ["徳島県","香川県","愛媛県","高知県","大分県","宮崎県","その他"]
    private var btnClose: UIButton!
    private var btnAction: UIButton!
    private var mKinentaiResultDialog: KinentaiResultDialog!
    
    //UITextFieldを便宜的に親として継承しているため。UIViewControllerを継承したくないための策。
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //コンストラクタ
    init(parentView: KinentaiViewController){
        super.init(frame: CGRectZero)

        parent      = parentView
        win1        = UIWindow()
        text1       = UITextView()
        textField1  = UITextField()
        pic1        = UIPickerView()
        label2      = UILabel()
        text2       = UITextView()
        textField2  = UITextField()
        pic2        = UIPickerView()
        text3       = UITextView()
        textField3  = UITextField()
        pic3        = UIPickerView()
        text4       = UITextView()
        textField4  = UITextField()
        pic4        = UIPickerView()
        btnClose    = UIButton()
        btnAction   = UIButton()
    }
    
    //デコンストラクタ
    deinit{
        parent      = nil
        win1        = nil
        
        text1       = nil
        textField1  = nil
        pic1        = nil
        
        label2      = nil
        
        text2       = nil
        textField2  = nil
        pic2        = nil
        
        text3       = nil
        textField3  = nil
        pic3        = nil
        
        text4       = nil
        textField4  = nil
        pic4        = nil
        
        btnClose    = nil
        btnAction   = nil
    }
    
    //表示
    func showResult(){
        //元の画面を暗く
        parent.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.whiteColor()
        win1.frame = CGRectMake(80,10,parent.view.frame.width-40,parent.view.frame.height/2+130)
        win1.layer.position = CGPointMake(parent.view.frame.width/2, parent.view.frame.height/2)
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKeyWindow()
        //表示
        self.win1.makeKeyAndVisible()
        
        //１セット目
        //text1生成
        text1.frame = CGRectMake(10,10, self.win1.frame.width - 20, self.win1.frame.height-60)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(14))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        text1.scrollEnabled = true
        text1.dataDetectorTypes = .Link
        text1.text = "南海トラフ　次の①②が合致した場合にアクションプランを適用する\n\n①想定震源断層域と重なる震央地名"
        self.win1.addSubview(text1)
        //textField1
        textField1.frame = CGRectMake(10,80, self.win1.frame.width - 20, 60)
        textField1.backgroundColor = UIColor.clearColor()
        textField1.font = UIFont.systemFontOfSize((CGFloat(14)))
        textField1.textAlignment = NSTextAlignment.Center
        textField1.text = "タップしてください"
        textField1.inputView = pic1 //ここでpickerView1と紐付け
        //pickerViewとともにポップアップするツールバーとボタンの設定
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(title:"選択", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(KinentaiNankaitraf1.done))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil) //小ワザ。上の選択ボタンを右寄せにするためのダミースペース
        toolbar.setItems([flexibleSpace, doneItem], animated: true)
        textField1.inputAccessoryView = toolbar
        self.win1.addSubview(textField1)
        //pic1
        pic1.delegate = self
        pic1.dataSource = self
        pic1.translatesAutoresizingMaskIntoConstraints = false
        pic1.tag = 1
        pic1.selectRow(0, inComponent:0, animated:false) //呼び出したrow値でピッカー初期化
        
        //label2生成
        label2.text = "②震度６強以上が観測又は大津波警報が発令"
        label2.frame = CGRectMake(10,140, self.win1.frame.width - 20, 60)
        label2.backgroundColor = UIColor.clearColor()
        label2.font = UIFont.systemFontOfSize((CGFloat(14)))
        label2.textColor = UIColor.blackColor()
        label2.textAlignment = NSTextAlignment.Left
        label2.numberOfLines = 2
        self.win1.addSubview(label2)
        
        //２セット目
        //text2生成
        text2.frame = CGRectMake(10,200, 100, 60)
        text2.backgroundColor = UIColor.clearColor()
        text2.font = UIFont.systemFontOfSize(CGFloat(14))
        text2.textColor = UIColor.blackColor()
        text2.textAlignment = NSTextAlignment.Left
        text2.editable = false
        text2.scrollEnabled = true
        text2.text = "■中部地方"
        self.win1.addSubview(text2)
        //textField2
        textField2.frame = CGRectMake(60,187, self.win1.frame.width - 20, 60)
        textField2.backgroundColor = UIColor.clearColor()
        textField2.font = UIFont.systemFontOfSize((CGFloat(14)))
        textField2.textAlignment = NSTextAlignment.Center
        textField2.text = "タップしてください"
        textField2.inputView = pic2 //ここでpic21と紐付け
        //pickerViewとともにポップアップするツールバーとボタンの設定
        textField2.inputAccessoryView = toolbar
        self.win1.addSubview(textField2)
        //pic2
        pic2.delegate = self
        pic2.dataSource = self
        pic2.translatesAutoresizingMaskIntoConstraints = false
        pic2.tag = 2
        pic2.selectRow(0, inComponent:0, animated:false) //呼び出したrow値でピッカー初期化
        
        //３セット目
        //text3生成
        text3.frame = CGRectMake(10,240, 100, 60)
        text3.backgroundColor = UIColor.clearColor()
        text3.font = UIFont.systemFontOfSize(CGFloat(14))
        text3.textColor = UIColor.blackColor()
        text3.textAlignment = NSTextAlignment.Left
        text3.editable = false
        text3.scrollEnabled = true
        text3.text = "■近畿地方"
        self.win1.addSubview(text3)
        //textField3
        textField3.frame = CGRectMake(60,227, self.win1.frame.width - 20, 60)
        textField3.backgroundColor = UIColor.clearColor()
        textField3.font = UIFont.systemFontOfSize((CGFloat(14)))
        textField3.textAlignment = NSTextAlignment.Center
        textField3.text = "タップしてください"
        textField3.inputView = pic3 //ここでpic21と紐付け
        //pickerViewとともにポップアップするツールバーとボタンの設定
        textField3.inputAccessoryView = toolbar
        self.win1.addSubview(textField3)
        //pic3
        pic3.delegate = self
        pic3.dataSource = self
        pic3.translatesAutoresizingMaskIntoConstraints = false
        pic3.tag = 3
        pic3.selectRow(0, inComponent:0, animated:false) //呼び出したrow値でピッカー初期化
        
        //４セット目
        //text4生成
        text4.frame = CGRectMake(10,280, 110, 60)
        text4.backgroundColor = UIColor.clearColor()
        text4.font = UIFont.systemFontOfSize(CGFloat(12))
        text4.textColor = UIColor.blackColor()
        text4.textAlignment = NSTextAlignment.Left
        text4.editable = false
        text4.scrollEnabled = true
        text4.text = "■四国・九州地方"
        self.win1.addSubview(text4)
        //textField4
        textField4.frame = CGRectMake(60,267, self.win1.frame.width - 20, 60)
        textField4.backgroundColor = UIColor.clearColor()
        textField4.font = UIFont.systemFontOfSize((CGFloat(14)))
        textField4.textAlignment = NSTextAlignment.Center
        textField4.text = "タップしてください"
        textField4.inputView = pic4 //ここでpic21と紐付け
        //pickerViewとともにポップアップするツールバーとボタンの設定
        textField4.inputAccessoryView = toolbar
        self.win1.addSubview(textField4)
        //pic4
        pic4.delegate = self
        pic4.dataSource = self
        pic4.translatesAutoresizingMaskIntoConstraints = false
        pic4.tag = 4
        pic4.selectRow(0, inComponent:0, animated:false) //呼び出したrow値でピッカー初期化
        
        //閉じるボタン生成
        btnClose.frame = CGRectMake(0,0,100,30)
        btnClose.backgroundColor = UIColor.orangeColor()
        btnClose.setTitle("閉じる", forState: .Normal)
        btnClose.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnClose.layer.masksToBounds = true
        btnClose.layer.cornerRadius = 10.0
        btnClose.layer.position = CGPointMake(self.win1.frame.width/2-60, self.win1.frame.height-20)
        btnClose.addTarget(self, action: #selector(self.onClickClose(_:)), forControlEvents: .TouchUpInside)
        self.win1.addSubview(btnClose)
        
        //判定ボタン生成
        btnAction.frame = CGRectMake(0,0,100,30)
        btnAction.backgroundColor = UIColor.redColor()
        btnAction.setTitle("判定", forState: .Normal)
        btnAction.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnAction.layer.masksToBounds = true
        btnAction.layer.cornerRadius = 10.0
        btnAction.layer.position = CGPointMake(self.win1.frame.width/2+60, self.win1.frame.height-20)
        btnAction.addTarget(self, action: #selector(self.onClickAction(_:)), forControlEvents: .TouchUpInside)
        self.win1.addSubview(btnAction)
    }
    
    //表示例数
    func numberOfComponentsInPickerView(pickerView: UIPickerView)-> Int{
        return 1
    }
    
    //表示行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int{
        //返す行数
        var rowNum: Int = 0
        switch pickerView.tag {
        case 1:
            rowNum = pic1Array.count
            break
        case 2:
            rowNum = pic2Array.count
            break
        case 3:
            rowNum = pic3Array.count
            break
        case 4:
            rowNum = pic4Array.count
            break
        default:
            rowNum = pic1Array.count
            break
        }

        return rowNum
    }
    
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String? {
        //返す列
        var picComponent: String?
        switch pickerView.tag {
        case 1:
            picComponent = pic1Array[row] as? String
            break
        case 2:
            picComponent = pic2Array[row] as? String
            break
        case 3:
            picComponent = pic3Array[row] as? String
            break
        case 4:
            picComponent = pic4Array[row] as? String
            break
        default:
            picComponent = pic1Array[row] as? String
            break
        }

        return picComponent
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row:Int, inComponent component:Int) {
        print("列:\(row)")
        switch pickerView.tag {
        case 1:
            textField1.text = pic1Array[row] as? String
            break
        case 2:
            textField2.text = pic2Array[row] as? String
            break
        case 3:
            textField3.text = pic3Array[row] as? String
            break
        case 4:
            textField4.text = pic4Array[row] as? String
            break
        default:
            break
        }
    }
    
    //ツールバーの選択ボタンを押した時
    func done() {
        textField1.endEditing(true) //これで閉じる
        textField2.endEditing(true)
        textField3.endEditing(true)
        textField4.endEditing(true)
    }
    
    //閉じる
    @objc func onClickClose(sender: UIButton){
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
    }
    
    //対応
    @objc func onClickAction(sender: UIButton){
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
        //対応の結果であるアクションプランを表示
        mKinentaiResultDialog = KinentaiResultDialog(parentView: parent)
        mKinentaiResultDialog.showResult(34, item: 0)
    }
}
