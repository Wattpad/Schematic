//
//  Constraint.swift
//  Schematic
//
//  Copyright © 2019 WP Technology Inc. All rights reserved.
//

import Foundation

public class Constraint {
    /// A maker takes an Anchorable and builds its appropriate constriant
    typealias Maker = (Anchorable) -> NSLayoutConstraint

    /// The closure that'll be called when we want to create the constraint
    let maker: Maker
    var next: Constraint?

    init(maker: @escaping Maker, next: Constraint? = nil) {
        self.maker = maker
        self.next = next
    }
}
