//
//  ContactCellCheckbox.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/02/25.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class ContactCellCheckbox: UITableViewCell, UITextViewDelegate {
    var checkbox: UIButton?
    var name : UILabel?
    var tel  : UITextView?
    var mail : UITextView?
    var kubun: UILabel?
    var syozoku0: UILabel?
    var syozoku : UILabel?
    var kinmu : UILabel?
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        checkbox = UIButton(frame: CGRectMake(0, 14, 28, 28))
        checkbox?.tintColor = UIColor.redColor()
        checkbox?.setImage(UIImage(named: "ic_check_box.png"), forState: UIControlState.Selected)
        checkbox?.setImage(UIImage(named: "ic_check_box_outline_blank.png"), forState: UIControlState.Normal)
        self.contentView.addSubview(checkbox!)
        
        name = UILabel(frame: CGRectMake(28, 0, 140, 24))
        name?.text = "nil"
        name?.font = UIFont.systemFontOfSize(20)
        self.addSubview(name!)
        
        tel = UITextView(frame: CGRectMake(141, -8, 160, 30))
        tel?.text = "nil"
        tel?.font = UIFont.systemFontOfSize(18)
        tel?.userInteractionEnabled = true
        tel?.dataDetectorTypes = .PhoneNumber
        tel?.scrollEnabled = false
        tel?.editable = false
        tel?.selectable = true
        tel?.delegate = self
        self.contentView.addSubview(tel!)
        
        kubun = UILabel(frame: CGRectMake(28, 28, 60, 16))
        kubun?.text = "nil"
        kubun?.font = UIFont.systemFontOfSize(12)
        self.contentView.addSubview(kubun!)
        
        syozoku0 = UILabel(frame: CGRectMake(88, 28, 100, 16))
        syozoku0?.text = "nil"
        syozoku0?.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(syozoku0!)
        
        syozoku = UILabel(frame: CGRectMake(148, 28, 60, 16))
        syozoku?.text = "nil"
        syozoku?.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(syozoku!)
        
        kinmu = UILabel(frame: CGRectMake(220, 28, 40, 16))
        kinmu?.text = "nil"
        kinmu?.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(kinmu!)
        
        mail = UITextView(frame: CGRectMake(28, 44, 300, 24))
        mail?.text = "nil"
        mail?.font = UIFont.systemFontOfSize(14)
        mail?.userInteractionEnabled = true
        mail?.dataDetectorTypes = .Link
        mail?.scrollEnabled = false
        mail?.editable = false
        mail?.selectable = true
        mail?.delegate = self
        self.contentView.addSubview(mail!)
    }
}
