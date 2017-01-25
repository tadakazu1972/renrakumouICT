//
//  ContactCell1.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/25.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class ContactCell1: UITableViewCell {
    var name : UILabel?
    var tel  : UILabel?
    var mail : UILabel?
    var kubun: UILabel?
    var syozoku : UILabel?
    var kinmu : UILabel?
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        name = UILabel(frame: CGRectMake(0, 0, 140, 24))
        name?.text = "nil"
        name?.font = UIFont.systemFontOfSize(20)
        self.addSubview(name!)
        
        tel = UILabel(frame: CGRectMake(141, 0, 160, 24))
        tel?.text = "nil"
        tel?.font = UIFont.systemFontOfSize(18)
        self.contentView.addSubview(tel!)
        
        kubun = UILabel(frame: CGRectMake(0, 25, 50, 16))
        kubun?.text = "nil"
        kubun?.font = UIFont.systemFontOfSize(12)
        self.contentView.addSubview(kubun!)
        
        syozoku = UILabel(frame: CGRectMake(51, 25, 40, 16))
        syozoku?.text = "nil"
        syozoku?.font = UIFont.systemFontOfSize(12)
        self.contentView.addSubview(syozoku!)
        
        kinmu = UILabel(frame: CGRectMake(86, 25, 40, 16))
        kinmu?.text = "nil"
        kinmu?.font = UIFont.systemFontOfSize(12)
        self.contentView.addSubview(kinmu!)
        
        mail = UILabel(frame: CGRectMake(116, 25, 160, 16))
        mail?.text = "nil"
        mail?.font = UIFont.systemFontOfSize(12)
        self.contentView.addSubview(mail!)
    }
    
}
