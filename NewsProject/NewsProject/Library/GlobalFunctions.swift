//
//  GlobalFunctions.swift
//  NewsProject
//
//  Created by Yurii Sushko on 19.01.2018.
//  Copyright © 2018 Yurii Sushko. All rights reserved.
//

import Foundation

func synchronized<T>(_ object: AnyObject, block: () -> (T) ) -> T {
    objc_sync_enter(object)
    defer { objc_sync_exit(object) }
    
    return block()
}

func toString<T>(type: T.Type) -> String {
    return String(describing: type)
}
