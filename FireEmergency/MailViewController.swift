//
//  MailViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/29.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import Foundation
import MessageUI

class MailViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var mAddressArray: [String] = []
    
    init(addressArray: [String]) {
        super.init(nibName: nil, bundle: nil)
        mAddressArray = addressArray
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendMail()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func sendMail(){
        if MFMailComposeViewController.canSendMail()==false {
            print("Email Send Failed")
            return
        }
        
        let mailViewController = MFMailComposeViewController()
        //let recipients = ["tadakazu1972@gmail.com"]
        let toRecipients = ["ba0034@city.osaka.lg.jp"]
        let recipients = mAddressArray
        
        mailViewController.mailComposeDelegate = self
        mailViewController.setSubject("緊急連絡")
        mailViewController.setToRecipients(toRecipients)
        mailViewController.setBccRecipients(recipients)
        mailViewController.setMessageBody("メール本文", isHTML: false)
        
        self.present(mailViewController, animated:true, completion:nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result  {
        case .cancelled:
            break
        case .saved:
            break
        case .sent:
            break
        case .failed:
            break
        }
        
        self.dismiss(animated: true, completion: nil)
        
        //dataViewControllerのインスタンス生成
        let data:ViewController = ViewController()
        
        //navigationControllerのrootViewControllerにKokuminhogoViewControllerをセット
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        
        //画面遷移
        self.present(nav, animated: true, completion: nil)
    }
}
