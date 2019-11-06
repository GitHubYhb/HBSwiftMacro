//
//  HBExtensions.swift
//  HBSwiftMacro
//
//  Created by 尤鸿斌 on 2019/11/6.
//

import Foundation

public extension UIColor {
    
    var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
    
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
}


public extension String {
    
    /**
     Get the height with font.
     
     - parameter font:       The font.
     - parameter fixedWidth: The fixed width.
     
     - returns: The height.
     */
    func heightWithFont(font : UIFont = UIFont.systemFont(ofSize: 18), fixedWidth : CGFloat) -> CGFloat {
        
        guard self.count > 0 && fixedWidth > 0 else {
            
            return 0
        }
        
        let size = CGSize(width:fixedWidth, height:CGFloat.greatestFiniteMagnitude)
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context:nil)
        
        return rect.size.height
    }
    
    
    /**
     Get the width with the string.
     
     - parameter font: The font.
     
     - returns: The string's width.
     */
    func widthWithFont(font : UIFont = UIFont.systemFont(ofSize: 18)) -> CGFloat {
        
        guard self.count > 0 else {
            
            return 0
        }
        
        let size = CGSize(width:CGFloat.greatestFiniteMagnitude, height:0)
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context:nil)
        
        return rect.size.width
    }
}

public extension UIView {
    var width:CGFloat {
        get {
            return self.frame.size.width
        }
    }
    var height:CGFloat {
        get {
            return self.frame.size.height
        }
    }
    
    var x:CGFloat {
        get {
            return self.frame.origin.x
        }
    }
    
    var y:CGFloat {
        get {
            return self.frame.origin.y
        }
    }
    
    var minY:CGFloat {
        get {
            return self.frame.minY
        }
    }
    var midY:CGFloat {
        get {
            return self.frame.midY
        }
    }
    var maxY:CGFloat {
        get {
            return self.frame.maxY
        }
    }
    
    var minX:CGFloat {
        get {
            return self.frame.minX
        }
    }
    var midX:CGFloat {
        get {
            return self.frame.midX
        }
    }
    var maxX:CGFloat {
        get {
            return self.frame.maxX
        }
    }
}
