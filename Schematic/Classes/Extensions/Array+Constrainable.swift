//
//  Array+Constrainable.swift
//  Pods
//
//  Created by Alex Figueroa on 2017-09-14.
//
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

