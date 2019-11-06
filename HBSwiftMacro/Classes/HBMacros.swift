//
//  HBMacros.swift
//  HBSwiftMacro
//
//  Created by 尤鸿斌 on 2019/11/6.
//

import Foundation
import UIKit

/* -------------- UI -------------- */
public let kScreenWidth = UIScreen.main.bounds.size.width

public let kScreenHeight = UIScreen.main.bounds.size.height

public func iPhoneX() -> Bool {
    guard #available(iOS 11.0, *) else {
        return false
    }    
    return UIApplication.shared.windows[0].safeAreaInsets != UIEdgeInsets.zero
}

public let NAV_HEIGHT = iPhoneX() ? 88 : 64

public let STATUS_BAR_HEIGHT = iPhoneX() ? 44 : 20

public let TABBAR_BAR_HEIGHT = iPhoneX() ? 83 : 49

public let HOME_INDICATOR_HEIGHT = iPhoneX() ? 34 : 0


/* -------------- Color -------------- */

// rgb颜色转换（16进制->10进制）
func kRGBAColor(R:CGFloat,G:CGFloat,B:CGFloat,A:CGFloat) ->UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
}

func kRGBColor(R:CGFloat,G:CGFloat,B:CGFloat) ->UIColor {
    return kRGBAColor(R: R, G: G, B: B, A: 1.0)
}
//主色调
let kMainColor = kRGBColor(R: 142, G: 190, B: 84)
//背景色
let kBackgroundColor = kRGBColor(R: 246, G: 246, B: 246)
//字体颜色
let kTextColor = kRGBColor(R: 102, G: 102, B: 102)
//灰色字体颜色
let kTextGrayColor = kRGBColor(R: 153, G: 153, B: 153)
//灰色线条
let kLineGrayColor = kRGBColor(R: 221, G: 221, B: 221)


/* -------------- UserDefaults -------------- */
public let kUserDefaults: UserDefaults = UserDefaults.standard


/* -------------- App Info -------------- */
let infoDictionary            = Bundle.main.infoDictionary
public let kAppName: String?         = infoDictionary!["CFBundleDisplayName"] as? String
public let kAppVersion: String?      = infoDictionary!["CFBundleShortVersionString"] as? String
public let kAppBuildVersion: String? = infoDictionary!["CFBundleVersion"] as? String
public let kBundleID: String?     = infoDictionary!["CFBundleIdentifier"] as? String



/* -------------- SandBox -------------- */

// Cache缓存文件夹
public let kCacheDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last

// Documents文件夹
public let kDocumentsDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first

