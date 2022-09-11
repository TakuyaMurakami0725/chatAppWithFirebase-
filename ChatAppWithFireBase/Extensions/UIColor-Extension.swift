//
//  UIColor-Extension.swift
//  ChatAppWithFireBase
//
//  Created by 村上拓也 on 2022/08/27.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat ) -> UIColor {
        return self.init(red: red / 255, green: green / 255 , blue: blue / 255, alpha: 1)
    }
}
