//
//  TyphoonSelectDialog2.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/12/13.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class TyphoonSelectDialog2: NSObject, UITableViewDelegate, UITableViewDataSource {
    //ボタン押したら出るUIWindow
    fileprivate var parent: TyphoonViewController!
    fileprivate var win1: UIWindow!
    fileprivate var text1: UITextView!
    fileprivate var table: UITableView!
    fileprivate var items:[String] = ["","","",""]
    fileprivate var btnClose: UIButton!
    fileprivate var mTyphoonResultDialog2: TyphoonResultDialog2!
    //自分が何番目のダイアログが保存用
    fileprivate var mIndex: Int!
    
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
            items = ["■氾濫注意水位(水位4.5m)、水防警報(出動)", "■避難準備情報発令の見込み(1時間以内に水位5.4mに到達)", "■避難準備情報(水位5.4m)、避難勧告発令の見込み", "■避難勧告(水位5.5m)", "■避難指示(水位8.3m)"] //淀川（枚方）
            break
        case 2:
            items = ["■氾濫注意水位(水位3.2m)、水防警報(出動)", "■避難準備情報発令の見込み(1時間以内に水位4.7mに到達)", "■避難準備情報(水位4.7m)、避難勧告発令の見込み", "■避難勧告(水位5.3m)", "■避難指示(水位6.8m)"] //大和川（柏原）
            break
        case 3:
            items = ["■氾濫注意水位(水位3.8m)、水防警報(出動)", "■避難準備情報発令の見込み(1時間以内に水位4.8mに到達)", "■避難準備情報(水位4.8m)、避難勧告発令の見込み", "■避難勧告(水位5m)", "■避難指示(水位5.8m)"] //神崎川（三国）
            break
        case 4:
            items = ["■氾濫注意水位(水位3.25m)、水防警報(出動)", "■避難準備情報発令の見込み(1時間以内に水位3.5mに到達)", "■避難準備情報(水位3.5m)、避難勧告発令の見込み", "■避難勧告(水位4.25m)", "■避難指示(水位5.1m)"] //安威川（千歳橋）
            break
        case 5:
            items = ["■氾濫注意水位(水位3m)、水防警報(出動)", "■避難準備情報発令の見込み(1時間以内に水位3.1mに到達)", "■避難準備情報(水位3.1m)、避難勧告発令の見込み", "■避難勧告(水位3.3m)", "■避難指示(水位3.5m)"] //寝屋川（京橋）
            break
        case 6:
            items = ["■氾濫注意水位(水位3.4m)、水防警報(出動)", "■避難準備情報発令の見込み(1時間以内に水位4.25mに到達)", "■避難準備情報(水位4.25m)、避難勧告発令の見込み", "■避難勧告(水位4.55m)", "■避難指示(水位4.85m)"] //第二寝屋川（昭明橋）
            break
        case 7:
            items = ["■氾濫注意水位(水位3.3m)、水防警報(出動)", "■避難準備情報発令の見込み(1時間以内に水位3.9mに到達)", "■避難準備情報(水位3.9m)、避難勧告発令の見込み", "■避難勧告(水位4.15m)", "■避難指示(水位4.4m)"] //平野川（剣橋）
            break
        case 8:
            items = ["■氾濫注意水位(水位3.3m)、水防警報(出動)", "■避難準備情報発令の見込み(1時間以内に水位3.4mに到達)", "■避難準備情報(水位3.4m)、避難勧告発令の見込み", "■避難勧告(水位3.85m)", "■避難指示(水位4.63m)"] //平野川分水路（今里大橋）
            break
        case 9:
            items = ["■氾濫注意水位(水位3.2m)、水防警報(出動)"] //古川（桑才）
            break
        case 10:
            items = ["■氾濫注意水位(水位2.9m)、水防警報(出動)", "■避難準備情報発令の見込み(1時間以内に水位3.2mに到達)", "■避難準備情報(水位3.2m)、避難勧告発令の見込み", "■避難勧告(水位3.9m)", "■避難指示(水位5.3m)"] //東除川（大堀上小橋）
            break
        case 11:
            items = ["■高潮区域(水防警報(出動))"] //高潮区域
            break
        default:
            items = [""]
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
        win1.frame = CGRect(x: 80,y: 200,width: parent.view.frame.width-40,height: parent.view.frame.height-150)
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
        text1.text="水位の状況は？"
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
        //淀川
        case 1:
            switch indexPath.row {
            case 0:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(11)
                break
            case 1:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(12)
                break
            case 2:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(13)
                break
            case 3:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(14)
                break
            case 4:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(15)
                break
            default:
                break
            }
            break
        //大和川
        case 2:
            switch indexPath.row {
            case 0:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(21)
                break
            case 1:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(22)
                break
            case 2:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(23)
                break
            case 3:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(24)
                break
            case 4:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(25)
                break
            default:
                break
            }
            break
        //神崎川
        case 3:
            switch indexPath.row {
            case 0:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(31)
                break
            case 1:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(32)
                break
            case 2:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(33)
                break
            case 3:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(34)
                break
            case 4:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(35)
                break
            default:
                break
            }
            break
        //安威川
        case 4:
            switch indexPath.row {
            case 0:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(41)
                break
            case 1:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(42)
                break
            case 2:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(43)
                break
            case 3:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(44)
                break
            case 4:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(45)
                break
            default:
                break
            }
            break
        //寝屋川
        case 5:
            switch indexPath.row {
            case 0:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(51)
                break
            case 1:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(52)
                break
            case 2:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(53)
                break
            case 3:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(54)
                break
            case 4:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(55)
                break
            default:
                break
            }
            break
        //第二寝屋川
        case 6:
            switch indexPath.row {
            case 0:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(61)
                break
            case 1:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(62)
                break
            case 2:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(63)
                break
            case 3:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(64)
                break
            case 4:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(65)
                break
            default:
                break
            }
            break
        //平野川
        case 7:
            switch indexPath.row {
            case 0:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(71)
                break
            case 1:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(72)
                break
            case 2:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(73)
                break
            case 3:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(74)
                break
            case 4:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(75)
                break
            default:
                break
            }
            break
        //平野川分水路
        case 8:
            switch indexPath.row {
            case 0:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(81)
                break
            case 1:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(82)
                break
            case 2:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(83)
                break
            case 3:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(84)
                break
            case 4:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(85)
                break
            default:
                break
            }
            break
        //古川
        case 9:
            switch indexPath.row {
            case 0:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(91)
                break
            default:
                break
            }
            break
        //東除川分水路
        case 10:
            switch indexPath.row {
            case 0:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(101)
                break
            case 1:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(102)
                break
            case 2:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(103)
                break
            case 3:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(104)
                break
            case 4:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(105)
                break
            default:
                break
            }
            break
        //高潮区域
        case 11:
            switch indexPath.row {
            case 0:
                mTyphoonResultDialog2 = TyphoonResultDialog2(index:mIndex, parentView: parent)
                mTyphoonResultDialog2.showResult(111)
                break
            default:
                break
            }
            break

        default:
            break
        }
        //自らのダイアログを消去しておく
        win1.isHidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        items = ["","","",""]
    }
}
