//
//  Device.swift
//  LargeContentDemo
//
//  Created by Алексей Берёзка on 07/08/2019.
//  Copyright © 2019 Алексей Берёзка. All rights reserved.
//

import UIKit

extension UIDevice {
    public static var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
}


@available(iOS 13.0, *)
public protocol UILargeContentViewerItem : NSObjectProtocol {
    
    var showsLargeContentViewer: Bool { get }
    
    var largeContentTitle: String? { get }
    
    var largeContentImage: UIImage? { get }
    
    var scalesLargeContentImage: Bool { get }
    
    var largeContentImageInsets: UIEdgeInsets { get }
}
