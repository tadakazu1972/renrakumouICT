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
    private var parent: KinentaiViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var table: UITableView!
    private var items:[String] = ["","","",""]
    private var btnClose: UIButton!
    private var mKinentaiSelectDialog2: KinentaiSelectDialog2!
    //自分が何番目のダイアログが保存用
    private var mIndex: Int!
    
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
    func setIndex(index: Int){
        mIndex = index
    }
    
    //表示
    func showInfo (){
        //元の画面を暗く
        parent.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.whiteColor()
        win1.frame = CGRectMake(80,200,parent.view.frame.width-40,parent.view.frame.height-200)
        win1.layer.position = CGPointMake(parent.view.frame.width/2, parent.view.frame.height/2)
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKeyWindow()
        //表示
        self.win1.makeKeyAndVisible()
        
        //TextView生成
        text1.frame = CGRectMake(10, 0, self.win1.frame.width-20, 40)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(18))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        self.win1.addSubview(text1)
        
        //TableView生成
        table.frame = CGRectMake(10,41, self.win1.frame.width-20, self.win1.frame.height-60)
        table.delegate = self
        table.dataSource = self
        table.estimatedRowHeight = 10 //下とあわせこの２行で複数行表示されるときの間がひらくようになる
        table.rowHeight = UITableViewAutomaticDimension //同上
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier:"cell")
        table.separatorColor = UIColor.clearColor()
        self.win1.addSubview(table)
        
        //閉じるボタン生成
        btnClose.frame = CGRectMake(0,0,100,30)
        btnClose.backgroundColor = UIColor.orangeColor()
        btnClose.setTitle("閉じる", forState: .Normal)
        btnClose.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnClose.layer.masksToBounds = true
        btnClose.layer.cornerRadius = 10.0
        btnClose.layer.position = CGPointMake(self.win1.frame.width/2, self.win1.frame.height-20)
        btnClose.addTarget(self, action: #selector(self.onClickClose(_:)), forControlEvents: .TouchUpInside)
        self.win1.addSubview(btnClose)
    }
    
    //閉じる
    @objc func onClickClose(sender: UIButton){
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection sction: Int)-> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = table.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.numberOfLines = 0 //これをしないと複数行表示されない
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        items = ["","","",""]
    }
}