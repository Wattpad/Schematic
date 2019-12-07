//
//  Axis.swift
//  Schematic
//
//  Copyright © 2019 WP Technology Inc. All rights reserved.
//

import Foundation

public enum AxisY {
    case top
    case bottom
    case centerY
    
    public func layoutAnchor(forAnchorable anchorable: Anchorable) -> NSLayoutYAxisAnchor {
        switch self {
        case .top:
            return anchorable.topAnchor
        case .bottom:
            return anchorable.bottomAnchor
        case .centerY:
            return anchorable.centerYAnchor
        }
    }
}

public enum AxisX {
    case leading
    case trailing
    case centerX
    case left
    case right
    
    public func layoutAnchor(forAnchorable anchorable: Anchorable) -> NSLayoutXAxisAnchor {
        switch self {
        case .leading:
            return anchorable.leadingAnchor
        case .trailing:
            return anchorable.trailingAnchor
        case .centerX:
            return anchorable.centerXAnchor
        case .left:
            return anchorable.leftAnchor
        case .right:
            return anchorable.rightAnchor
        }
    }
}
