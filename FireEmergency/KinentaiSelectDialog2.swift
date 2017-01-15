//
//  KinentaiSelectDialog2.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/14.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class KinentaiSelectDialog2: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    //ボタン押したら出るUIWindow
    private var parent: KinentaiViewController!
    private var win1: UIWindow!
    private var text1: UITextView!
    private var collection: UICollectionView!
    private var items:[String] = ["","","",""]
    private var btnClose: UIButton!
    private var mKinentaiResultDialog: KinentaiResultDialog!
    //自分が何番目のダイアログか保存用
    private var mIndex: Int!
    
    //コンストラクタ
    init(index: Int, parentView: KinentaiViewController){
        parent = parentView
        win1 = UIWindow()
        text1 = UITextView()
        let layout = UICollectionViewFlowLayout() //これがないとエラーになる
        layout.itemSize = CGSizeMake(70,30) // Cellの大きさ
        layout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8) //Cellのマージン
        layout.headerReferenceSize = CGSizeMake(1,1) //セクション毎のヘッダーサイズ
        collection = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        btnClose = UIButton()
        mIndex = index
        
        //itemsに47都道府県を設定
        items = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"]

        //タイトルとなるtext1の内容を場合分け
        switch index {
        //地震(震央「陸」)
        case 11:
            text1.text = "■最大震度７(特別区６強)\n　震央管轄都道府県は？"
            break
        case 12:
            text1.text = "■最大震度６強(特別区６弱)\n　震央管轄都道府県は？"
            break
        case 13:
            text1.text = "■最大震度6弱(特別区5強,政令市5強) 震央管轄都道府県は？"
            break
        //地震(震央「海域」)
        case 21:
            text1.text = "■最大震度７(特別区６強)\n　最大震度都道府県は？"
            break
        case 22:
            text1.text = "■最大震度６強(特別区６弱)\n　最大震度都道府県は？"
            break
        case 23:
            text1.text = "■最大震度6弱(特別区5強,政令市5強) 最大震度都道府県は？"
            break
        //アクションプランはこのダイアログには無い。ただ、case番号31-33は欠番とする
        //大津波警報・噴火
        case 41:
            text1.text = "■大津波警報\n　都道府県は？"
            break
        case 42:
            text1.text = "■噴火\n　都道府県は？"
            break
        //特殊災害(NBC含む)
        case 51:
            text1.text = "■特殊災害(NBC含む)\n　都道府県は？"
            break
        default:
            break
        }
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        text1 = nil
        collection = nil
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
        win1.frame = CGRectMake(80,200,parent.view.frame.width-40,parent.view.frame.height-100)
        win1.layer.position = CGPointMake(parent.view.frame.width/2, parent.view.frame.height/2)
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKeyWindow()
        //表示
        self.win1.makeKeyAndVisible()
        
        //TextView生成
        text1.frame = CGRectMake(10, 0, self.win1.frame.width-20, 60)
        text1.backgroundColor = UIColor.clearColor()
        text1.font = UIFont.systemFontOfSize(CGFloat(18))
        text1.textColor = UIColor.blackColor()
        text1.textAlignment = NSTextAlignment.Left
        text1.editable = false
        self.win1.addSubview(text1)
        
        //UICollectionView生成
        collection.frame = CGRectMake(10,60, self.win1.frame.width-20, self.win1.frame.height-100)
        collection.backgroundColor = UIColor.whiteColor()
        collection.delegate = self
        collection.dataSource = self
        collection.registerClass(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        self.win1.addSubview(collection)
        
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
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int {
        return self.items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CustomUICollectionViewCell = collection.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! CustomUICollectionViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("セルを選択 #\(indexPath.row)!")
        //csvファイルの結果呼び出し
        let itemNo: Int = indexPath.row + 1 //csvファイルのヘッダの分+1するのを忘れないように
        mKinentaiResultDialog = KinentaiResultDialog(parentView: parent)
        mKinentaiResultDialog.showResult(11, item: itemNo)
        //自らのダイアログを消去しておく
        win1.hidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        items = ["","","",""]
    }
}
