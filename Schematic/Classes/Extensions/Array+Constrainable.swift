//
//  Array+Constrainable.swift
//  Schematic
//
//  Copyright © 2019 WP Technology Inc. All rights reserved.
//

import Foundation

extension Array where Element == Anchorable {
    /// Applies the Constraints to all the views within the array
    public func applyLayout(_ constraints: [Constraint]) {
        for anchorable in self {
            anchorable.applyLayout(constraints)
        }
    }
}

