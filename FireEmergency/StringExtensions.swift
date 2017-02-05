//
//  StringExtensions.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/02/05.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import Foundation

extension String {
    
    /// String -> NSString に変換する
    func to_ns() -> NSString {
        return (self as NSString)
    }
    
    func substringFromIndex(index: Int) -> String {
        return to_ns().substringFromIndex(index)
    }
    
    func substringToIndex(index: Int) -> String {
        return to_ns().substringToIndex(index)
    }
    
    func substringWithRange(range: NSRange) -> String {
        return to_ns().substringWithRange(range)
    }
    
    var lastPathComponent: String {
        return to_ns().lastPathComponent
    }
    
    var pathExtension: String {
        return to_ns().pathExtension
    }
    
    var stringByDeletingLastPathComponent: String {
        return to_ns().stringByDeletingLastPathComponent
    }
    
    var stringByDeletingPathExtension: String {
        return to_ns().stringByDeletingPathExtension
    }
    
    var pathComponents: [String] {
        return to_ns().pathComponents
    }
    
    var length: Int {
        return self.characters.count
    }
    
    func stringByAppendingPathComponent(path: String) -> String {
        return to_ns().stringByAppendingPathComponent(path)
    }
    
    func stringByAppendingPathExtension(ext: String) -> String? {
        return to_ns().stringByAppendingPathExtension(ext)
    }
    
}
