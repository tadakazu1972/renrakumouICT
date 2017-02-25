//
//  ContactCellCheckbox.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/02/25.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class ContactCellCheckbox: UITableViewCell {
    var checkbox: UIButton?
    var name : UILabel?
    var tel  : UILabel?
    var mail : UILabel?
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
        
        tel = UILabel(frame: CGRectMake(141, 0, 160, 24))
        tel?.text = "nil"
        tel?.font = UIFont.systemFontOfSize(18)
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
        
        mail = UILabel(frame: CGRectMake(28, 48, 300, 18))
        mail?.text = "nil"
        mail?.font = UIFont.systemFontOfSize(16)
        self.contentView.addSubview(mail!)
    }
    
}
