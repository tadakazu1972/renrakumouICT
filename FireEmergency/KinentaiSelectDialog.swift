//
//  KinentaiSelectDialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/08.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class KinentaiSelectDialog: NSObject, UITableViewDelegate, UITableViewDataSource {
    //ボタン押したら出るUIWindow
    fileprivate var parent: KinentaiViewController!
    fileprivate var win1: UIWindow!
    fileprivate var text1: UITextView!
    fileprivate var table: UITableView!
    fileprivate var items:[String] = ["","","",""]
    fileprivate var btnClose: UIButton!
    fileprivate var mKinentaiSelectDialog: KinentaiSelectDialog!  //南海トラフの場合の自己呼び出し用
    fileprivate var mKinentaiSelectDialog2: KinentaiSelectDialog2!
    fileprivate var mKinentaiNankaitraf1: KinentaiNankaitraf1!
    fileprivate var mKinentaiNankaitraf2: KinentaiNankaitraf2!
    fileprivate var mKinentaiResultDialog: KinentaiResultDialog!
    //自分が何番目のダイアログが保存用
    fileprivate var mIndex: Int!
    
    //コンストラクタ
    init(index: Int, parentView: KinentaiViewController){
        parent = parentView
        win1 = UIWindow()
        text1 = UITextView()
        table = UITableView()
        btnClose = UIButton()
        mIndex = index
        //itemsの内容を場合分け
        switch index {
        case 1:
            text1.text = "最大震度は？"
            items = ["■震度７(特別区６強)","■震度６強(特別区６弱)","■震度６弱(特別区５強、政令市５強)"]
            break
        case 2:
            text1.text = "最大震度は？"
            items = ["■震度７(特別区６強)","■震度６強(特別区６弱)","■震度６弱(特別区５強、政令市５強)"]
            break
        case 3:
            text1.text = "アクションプラン"
            items = ["■東海地震","■首都直下地震","■東南海・南海地震","■南海トラフ"]
            break
        case 34:  //南海トラフの場合はもう一度自己呼び出し
            text1.text = "南海トラフ"
            items = ["ケース１(条件判定)","ケース２(同程度被害)"]
            break
        case 4:
            text1.text = "大津波警報・噴火"
            items = ["■大津波警報","■噴火"]
            break
        //特殊災害(NBC含む)はここでは存在しない。KinentaiViewController>KinentaiSelectDiaglog2へ直接飛んでいるので。
        default:
            items = ["■震度７(特別区６強)","■震度６強(特別区６弱)","■震度６弱(特別区５強、政令市５強)"]
            break
        }
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        text1 = nil
        table = nil
        items = ["","","",""]
        btnClose = nil
        mIndex = nil
    }
    
    //セットIndex
    func setIndex(_ index: Int){
        mIndex = index
    }
    
    //表示
    func showInfo (){
        //元の画面を暗く
        parent.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.white
        win1.frame = CGRect(x: 80,y: 200,width: parent.view.frame.width-40,height: parent.view.frame.height-200)
        win1.layer.position = CGPoint(x: parent.view.frame.width/2, y: parent.view.frame.height/2)
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKey()
        //表示
        self.win1.makeKeyAndVisible()
        
        //TextView生成
        text1.frame = CGRect(x: 10, y: 0, width: self.win1.frame.width-20, height: 40)
        text1.backgroundColor = UIColor.clear
        text1.font = UIFont.systemFont(ofSize: CGFloat(18))
        text1.textColor = UIColor.black
        text1.textAlignment = NSTextAlignment.left
        text1.isEditable = false
        self.win1.addSubview(text1)
        
        //TableView生成
        table.frame = CGRect(x: 10,y: 41, width: self.win1.frame.width-20, height: self.win1.frame.height-60)
        table.delegate = self
        table.dataSource = self
        table.estimatedRowHeight = 10 //下とあわせこの２行で複数行表示されるときの間がひらくようになる
        table.rowHeight = UITableViewAutomaticDimension //同上
        table.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
        table.separatorColor = UIColor.clear
        self.win1.addSubview(table)
        
        //閉じるボタン生成
        btnClose.frame = CGRect(x: 0,y: 0,width: 100,height: 30)
        btnClose.backgroundColor = UIColor.orange
        btnClose.setTitle("閉じる", for: UIControlState())
        btnClose.setTitleColor(UIColor.white, for: UIControlState())
        btnClose.layer.masksToBounds = true
        btnClose.layer.cornerRadius = 10.0
        btnClose.layer.position = CGPoint(x: self.win1.frame.width/2, y: self.win1.frame.height-20)
        btnClose.addTarget(self, action: #selector(self.onClickClose(_:)), for: .touchUpInside)
        self.win1.addSubview(btnClose)
    }
    
    //閉じる
    @objc func onClickClose(_ sender: UIButton){
        win1.isHidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection sction: Int)-> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = table.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.numberOfLines = 0 //これをしないと複数行表示されない
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セルを選択 #\(indexPath.row)!")
        switch mIndex{
        //地震(震央「陸」)
        case 1:
            switch indexPath.row {
            case 0:
                mKinentaiSelectDialog2 = KinentaiSelectDialog2(index: 11, parentView: parent)
                mKinentaiSelectDialog2.showInfo()
                break
            case 1:
                mKinentaiSelectDialog2 = KinentaiSelectDialog2(index: 12, parentView: parent)
                mKinentaiSelectDialog2.showInfo()
                break
            case 2:
                mKinentaiSelectDialog2 = KinentaiSelectDialog2(index: 13, parentView: parent)
                mKinentaiSelectDialog2.showInfo()
                break
            default:
                break
            }
            break
        //地震(震央「海域」)
        case 2:
            switch indexPath.row {
            case 0:
                mKinentaiSelectDialog2 = KinentaiSelectDialog2(index: 21, parentView: parent)
                mKinentaiSelectDialog2.showInfo()
                break
            case 1:
                mKinentaiSelectDialog2 = KinentaiSelectDialog2(index: 22, parentView: parent)
                mKinentaiSelectDialog2.showInfo()
                break
            case 2:
                mKinentaiSelectDialog2 = KinentaiSelectDialog2(index: 23, parentView: parent)
                mKinentaiSelectDialog2.showInfo()
                break
            default:
                break
            }
            break
        //アクションプラン
        case 3:
            switch indexPath.row {
            case 0:
                mKinentaiResultDialog = KinentaiResultDialog(parentView: parent)
                mKinentaiResultDialog.showResult(31, item: 0)
                break
            case 1:
                mKinentaiResultDialog = KinentaiResultDialog(parentView: parent)
                mKinentaiResultDialog.showResult(32, item: 0)
                break
            case 2:
                mKinentaiResultDialog = KinentaiResultDialog(parentView: parent)
                mKinentaiResultDialog.showResult(33, item: 0)
                break
            case 3:
                mKinentaiSelectDialog = KinentaiSelectDialog(index: 34, parentView: parent)
                mKinentaiSelectDialog.showInfo()
                break
            default:
                break
            }
            break
        //南海トラフのケース判定
        case 34:
            switch indexPath.row {
            case 0:
                mKinentaiNankaitraf1 = KinentaiNankaitraf1(parentView: parent)
                mKinentaiNankaitraf1.showResult()
                break
            case 1:
                mKinentaiNankaitraf2 = KinentaiNankaitraf2(parentView: parent)
                mKinentaiNankaitraf2.showResult()
                break
            default:
                break
            }
            break
        //大津波警報・噴火
        case 4:
            switch indexPath.row {
            case 0:
                mKinentaiSelectDialog2 = KinentaiSelectDialog2(index: 41, parentView: parent)
                mKinentaiSelectDialog2.showInfo()
                break
            case 1:
                mKinentaiSelectDialog2 = KinentaiSelectDialog2(index: 42, parentView: parent)
                mKinentaiSelectDialog2.showInfo()
                break
            default:
                break
            }
            break
        //特殊災害(NBC含む)はここでは存在しない。KinentaiViewController>KinentaiSelectDiaglog2へ直接飛んでいるので。
        default:
            break
        }
        //自らのダイアログを消去しておく
        win1.isHidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        items = ["","","",""]
    }
}
