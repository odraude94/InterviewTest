//
//  UIFont.swift
//  StellaTest
//
//  Created by Eduardo Martinez on 16/05/21.
//

import UIKit

enum DynamicType: String{
    case koHoRegular = "KoHo-Regular"
    case koHoBold = "KoHo-Bold"
}

extension UIFont{
    class func of(_ style: DynamicType,_ size: CGFloat) -> UIFont{
        return UIFont(name: style.rawValue, size: size)!
    }
}
