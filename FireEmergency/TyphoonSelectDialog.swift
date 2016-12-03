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
        case 1:
            items = ["■大津波警報","■津波警報","■警報なし"]
            break
        case 2:
            items = ["■大津波警報","■津波警報","■警報なし"]
            break
        case 3:
            items = ["■大津波警報","■津波警報","■警報なし"]
            break
        case 4:
            items = ["■大津波警報","■津波警報","■津波注意報","■警報なし"]
            break
        case 5:
            items = ["■警戒宣言が発令されたとき（東海地震予知情報）","■東海地震注意報が発表されたとき","■東海地震に関連する調査情報（臨時）が発表されたとき"]
            break
        default:
            items = ["■大津波警報","■津波警報","■警報なし"]
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
        win1.frame = CGRectMake(80,200,parent.view.frame.width-40,parent.view.frame.height-300)
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
        text1.text="発令されている警報は？"
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
            case 1:
                parent.mTyphoonResultDialog.showResult(12)
                break
            case 2:
                parent.mTyphoonResultDialog.showResult(13)
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
            default:
                break
            }
            break
        case 3:
            switch indexPath.row {
            case 0:
                parent.mTyphoonResultDialog.showResult(31)
                break
            case 1:
                parent.mTyphoonResultDialog.showResult(32)
                break
            case 2:
                parent.mTyphoonResultDialog.showResult(33)
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
