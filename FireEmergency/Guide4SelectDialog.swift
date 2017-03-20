//
//  Guide4SelectDialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/11.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide4SelectDialog: NSObject, UITableViewDelegate, UITableViewDataSource {
    //ボタン押したら出るUIWindow
    private var parent: GuideViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var table: UITableView!
    private var items:[String] = ["","","",""]
    private var btnClose: UIButton!
    //
    private var mGuide41Dialog: Guide41Dialog!
    private var mGuide42Dialog: Guide42Dialog!
    private var mGuide43Dialog: Guide43Dialog!
    private var mGuide44Dialog: Guide44Dialog!
    
    //コンストラクタ
    init(parentView: GuideViewController){
        parent = parentView
        win1 = UIWindow()
        text1 = UITextView()
        table = UITableView()
        btnClose = UIButton()
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        text1 = nil
        table = nil
        items = ["","","",""]
        btnClose = nil
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
        text1.text = ""
        items = ["■震災","■風水害","■国民保護","■緊援隊"]
        self.win1.addSubview(text1)
        
        //TableView生成
        table.frame = CGRectMake(10,10, self.win1.frame.width-20, self.win1.frame.height-60)
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
        switch indexPath.row {
        case 0:
            mGuide41Dialog = Guide41Dialog(parentView: parent)
            mGuide41Dialog.showInfo()
            break
        case 1:
            mGuide42Dialog = Guide42Dialog(parentView: parent)
            mGuide42Dialog.showInfo()
            break
        case 2:
            mGuide43Dialog = Guide43Dialog(parentView: parent)
            mGuide43Dialog.showInfo()
            break
        case 3:
            mGuide44Dialog = Guide44Dialog(parentView: parent)
            mGuide44Dialog.showInfo()
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
