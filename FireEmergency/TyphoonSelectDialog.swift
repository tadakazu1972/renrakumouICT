//
//  TyphoonSelectDialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/12/01.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class TyphoonSelectDialog: NSObject, UITableViewDelegate, UITableViewDataSource {
    //ボタン押したら出るUIWindow
    private var parent: TyphoonViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var table: UITableView!
    private var items:[String] = ["","","",""]
    private var btnClose: UIButton!
    private var mTyphoonSelectDialog2: TyphoonSelectDialog2!
    private var mTyphoonResultDialog2: TyphoonResultDialog2!
    //自分が何番目のダイアログが保存用
    private var mIndex: Int!
    
    //コンストラクタ
    init(index: Int, parentView: TyphoonViewController){
        parent = parentView
        win1 = UIWindow()
        text1 = UITextView()
        table = UITableView()
        btnClose = UIButton()
        mIndex = index
        //itemsの内容を場合分け
        switch index {
        case 2:
            items = ["■特別警報", "■暴風（雪）警報", "■大雨警報", "■大雪警報", "■洪水警報", "■波浪警報", "■高潮警報", "■高潮注意報"]
            break
        case 3:
            items = ["■淀川（枚方）", "■大和川（柏原）", "■神崎川（三国）", "■安威川（千歳橋）", "■寝屋川（京橋）", "■第二寝屋川（昭明橋）", "■平野川（剣橋）", "■平野川分水路（今里大橋）", "■古川（桑才）", "■東除川（大堀上小橋）","■高潮区域"]
            break
        default:
            items = ["■特別警報", "■暴風（雪）警報", "■大雨警報", "■大雪警報", "■洪水警報", "■波浪警報", "■高潮警報", "■高潮注意報"]
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
        win1.frame = CGRectMake(80,200,parent.view.frame.width-40,parent.view.frame.height-150)
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
        if (mIndex==3){
            text1.text="河川を選択してください"
        } else {
            text1.text="発令されている警報は？"
        }
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
        case 1:
            switch indexPath.row {
            case 0:
                parent.mTyphoonResultDialog.showResult(11)
                break
            default:
                break
            }
            break
        case 2:
            switch indexPath.row {
            case 0:
                parent.mTyphoonResultDialog.showResult(21)
                break
            case 1:
                parent.mTyphoonResultDialog.showResult(22)
                break
            case 2:
                parent.mTyphoonResultDialog.showResult(23)
                break
            case 3:
                parent.mTyphoonResultDialog.showResult(24)
                break
            case 4:
                parent.mTyphoonResultDialog.showResult(25)
                break
            case 5:
                parent.mTyphoonResultDialog.showResult(26)
                break
            case 6:
                parent.mTyphoonResultDialog.showResult(27)
                break
            case 7:
                parent.mTyphoonResultDialog.showResult(28)
                break
            default:
                break
            }
            break
        case 3:
            switch indexPath.row {
            case 0:
                mTyphoonSelectDialog2 = TyphoonSelectDialog2(index: 1, parentView: parent)
                mTyphoonSelectDialog2.showInfo()
                break
            case 1:
                mTyphoonSelectDialog2 = TyphoonSelectDialog2(index: 2, parentView: parent)
                mTyphoonSelectDialog2.showInfo()
                break
            case 2:
                mTyphoonSelectDialog2 = TyphoonSelectDialog2(index: 3, parentView: parent)
                mTyphoonSelectDialog2.showInfo()
                break
            case 3:
                mTyphoonSelectDialog2 = TyphoonSelectDialog2(index: 4, parentView: parent)
                mTyphoonSelectDialog2.showInfo()
                break
            case 4:
                mTyphoonSelectDialog2 = TyphoonSelectDialog2(index: 5, parentView: parent)
                mTyphoonSelectDialog2.showInfo()
                break
            case 5:
                mTyphoonSelectDialog2 = TyphoonSelectDialog2(index: 6, parentView: parent)
                mTyphoonSelectDialog2.showInfo()
                break
            case 6:
                mTyphoonSelectDialog2 = TyphoonSelectDialog2(index: 7, parentView: parent)
                mTyphoonSelectDialog2.showInfo()
                break
            case 7:
                mTyphoonSelectDialog2 = TyphoonSelectDialog2(index: 8, parentView: parent)
                mTyphoonSelectDialog2.showInfo()
                break
            case 8:
                mTyphoonSelectDialog2 = TyphoonSelectDialog2(index: 9, parentView: parent)
                mTyphoonSelectDialog2.showInfo()
                break
            case 9:
                mTyphoonSelectDialog2 = TyphoonSelectDialog2(index: 10, parentView: parent)
                mTyphoonSelectDialog2.showInfo()
                break
            case 10:
                mTyphoonSelectDialog2 = TyphoonSelectDialog2(index: 11, parentView: parent)
                mTyphoonSelectDialog2.showInfo()
                break
            default:
                break
            }
            break
        default:
            break
        }
        //自らのダイアログを消去しておく
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        items = ["","","",""]
    }
}
