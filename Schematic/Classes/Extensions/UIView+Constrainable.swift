//
//  UIView+Constrainable.swift
//  Pods
//
//  Created by Alex Figueroa on 2017-09-14.
//
//

import Foundation

public extension Anchorable {
    /// Applies constraints to the given Anchorable.
    /// Note: This will disable translatesAutoresizingMaskIntoConstraints for views.
    func applyLayout(_ constraints: [Constraint]) {
        guard !constraints.isEmpty else {
            return
        }

        if let view = self as? UIView, view.translatesAutoresizingMaskIntoConstraints {
            view.translatesAutoresizingMaskIntoConstraints = false
        }

        for constraint in constraints {
            // Iterate through any next nodes
            var currentConstraint: Constraint? = constraint
            while currentConstraint != nil {
                currentConstraint?.maker(self).isActive = true
                currentConstraint = currentConstraint?.next
            }
        }
    }

    /// Applies a single Constraint to the given Anchorable and returns the constraints it makes.
    /// Note: This will disable translatesAutoresizingMaskIntoConstraints for views.
    func applyLayout(_ constraint: Constraint) -> NSLayoutConstraint {
        if let view = self as? UIView, view.translatesAutoresizingMaskIntoConstraints {
            view.translatesAutoresizingMaskIntoConstraints = false
        }

        var firstNSConstraint: NSLayoutConstraint?
        // Iterate through any next nodes
        var currentConstraint: Constraint? = constraint
        while currentConstraint != nil {
            let nsConstraint = currentConstraint?.maker(self)
            nsConstraint?.isActive = true

            if firstNSConstraint == nil {
                firstNSConstraint = nsConstraint
            }

            currentConstraint = currentConstraint?.next
        }

        guard let constraint = firstNSConstraint else {
            fatalError("Failed to extract a single constraint")
        }

        return constraint
    }
}
