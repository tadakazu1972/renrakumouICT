//
//  DataViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/09/11.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Button生成
        let btnEarthquake = UIButton()
        btnEarthquake.frame = CGRectMake(0,0,100,40)
        btnEarthquake.backgroundColor = UIColor.lightGrayColor()
        btnEarthquake.layer.masksToBounds = true
        btnEarthquake.setTitle("震災", forState: UIControlState.Normal)
        btnEarthquake.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnEarthquake.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnEarthquake.layer.cornerRadius = 8.0
        btnEarthquake.layer.position = CGPoint(x:100, y:self.view.frame.height-40)
        btnEarthquake.tag = 1
        //btnEarthquake.addTarget(self, action:#selector(DataViewController.onClickbtnEarthquake(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnEarthquake)
    }
    
    //震災
    func onClickbtnEarthquake(sender:UIButton){
        //Viewを閉じる
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
