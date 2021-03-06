//
//  UIWindowsExtension.swift
//  YSSwiftStudy
//
//  Created by Yurii Sushko on 25.10.17.
//  Copyright © 2017 Yurii Sushko. All rights reserved.
//

import UIKit

extension UIWindow {
    
    static func window(_ block: ((UIWindow) -> ())? = nil) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        block?(window)
        
        return window
    }
}
