//
//  UIView.swift
//  StellaTest
//
//  Created by Eduardo Martinez on 16/05/21.
//

import UIKit

extension UIView{
    func cornerRadius(_ radius: CGFloat){
        clipsToBounds = true
        layer.cornerRadius = radius
    }
}
