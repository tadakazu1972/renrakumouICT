//
//  ContactUpdateSelectDialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/02/19.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class ContactUpdateSelectDialog: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    //ボタン押したら出るUIWindow
    private var parent: UIViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var table: UITableView!
    var result: [[String]] = []
    private var btnClose: UIButton!
    //データ保存用
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var mainStation: String!
    var tsunamiStation: String!
    var kubun: String!
    
    //コンストラクタ
    init(parentView: UIViewController, resultFrom: [[String]]){
        super.init()
        parent = parentView
        win1 = UIWindow()
        text1 = UITextView()
        table = UITableView()
        btnClose = UIButton()
        result = resultFrom
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        text1 = nil
        table = nil
        btnClose = nil
    }
    
    //表示
    func showResult(){
        //元の画面を暗く
        parent.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.whiteColor()
        win1.frame = CGRectMake(80,180,parent.view.frame.width-20,parent.view.frame.height-100)
        win1.layer.position = CGPointMake(parent.view.frame.width/2, parent.view.frame.height/2)
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKeyWindow()
        //表示
        self.win1.makeKeyAndVisible()
        
        //TextView生成
        text1.frame = CGRectMake(10,0, self.win1.frame.width-20, 40)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(18))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        text1.text="修正するデータを選択"
        self.win1.addSubview(text1)
        
        //TableView生成
        table.frame = CGRectMake(10, 41, self.win1.frame.width-20, self.win1.frame.height-60)
        table.delegate = self
        table.dataSource = self
        table.estimatedRowHeight = 60 //下とあわせこの２行で複数表示されるときの間がひらくように
        table.rowHeight = UITableViewAutomaticDimension
        table.registerClass(ContactCell1.self, forCellReuseIdentifier:"contactCell1")
        table.separatorColor = UIColor.clearColor()
        table.allowsMultipleSelection = true
        self.win1.addSubview(table)
        
        func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat { return UITableViewAutomaticDimension }
        
        
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection sction:Int)-> Int {
        return self.result.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80 // セルの高さ
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCell {
        let cell:ContactCell1 = table.dequeueReusableCellWithIdentifier("contactCell1")! as! ContactCell1
        cell.textLabel?.numberOfLines = 0 //これをしないと複数表示されない
        cell.name!.text = self.result[indexPath.row][0]
        cell.tel!.text  = self.result[indexPath.row][1]
        cell.kubun!.text = self.result[indexPath.row][3]
        cell.syozoku0!.text = self.result[indexPath.row][4]
        cell.syozoku!.text = self.result[indexPath.row][5]
        cell.kinmu!.text = self.result[indexPath.row][6]
        cell.mail!.text = self.result[indexPath.row][2]
        return cell
    }
    
    //セルを選択
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("セルを選択 #\(indexPath.row)")
        
        //選択されたセルの各データを渡し用に文字配列に放り込む
        var _selected : [String] = []
        _selected.append(self.result[indexPath.row][0])
        _selected.append(self.result[indexPath.row][1])
        _selected.append(self.result[indexPath.row][2])
        _selected.append(self.result[indexPath.row][3])
        _selected.append(self.result[indexPath.row][4])
        _selected.append(self.result[indexPath.row][5])
        _selected.append(self.result[indexPath.row][6])
        _selected.append(self.result[indexPath.row][7])
        
        //選択したレコードのデータを引数にしながら、ContactUpdateViewControllerを立ち上げ
        let data:ContactUpdateViewController = ContactUpdateViewController(selected: _selected)
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        parent.presentViewController(nav, animated: true, completion: nil)
        
        //消去
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
    }
    
}
