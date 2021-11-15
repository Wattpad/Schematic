//
//  Constraint+Builders.swift
//  Pods
//
//  Created by Alex Figueroa on 2017-10-06.
//
//

import Foundation

// To simplify how we unify View and LayoutGuide, they're just now Anchor
public typealias Anchor = Anchorable

// MARK: Centering
public extension Constraint {
    /// Centers horizontally in other with optional offset
    static func centerX(in other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            return anchor.centerXAnchor.constraint(equalTo: other.centerXAnchor, constant: offset)
        })
    }

    /// Centers vertically in other with optional offset
    static func centerY(in other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            return anchor.centerYAnchor.constraint(equalTo: other.centerYAnchor, constant: offset)
        })
    }

    /// Centers in other with optional offset
    static func center(in other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        let centerXConstraint = centerX(in: other, withOffset: offset)
        let centerYConstraint = centerY(in: other, withOffset: offset)
        centerXConstraint.next = centerYConstraint
        return centerXConstraint
    }
}

// MARK: Sizing
public extension Constraint {
    /// Makes the width equal to the provided width constant
    static func makeWidth(equalTo width: CGFloat) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            return anchor.widthAnchor.constraint(equalToConstant: width)
        })
    }

    /// Makes the height equal to the provided height constant
    static func makeHeight(equalTo height: CGFloat) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            return anchor.heightAnchor.constraint(equalToConstant: height)
        })
    }

    /// Makes the size equal to the provided size constant
    static func makeSize(equalTo size: CGFloat) -> Constraint {
        return makeSize(equalTo: CGSize(width: size, height: size))
    }

    /// Makes the size equal to the provided size
    static func makeSize(equalTo size: CGSize) -> Constraint {
        let width = makeWidth(equalTo: size.width)
        let height = makeHeight(equalTo: size.height)
        width.next = height
        return width
    }

    /// Matches the width to other with optional multiplier and offset
    static func matchWidth(to other: Anchor, multipledBy multiplier: CGFloat = 1.0, withOffset offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            return anchor.widthAnchor.constraint(equalTo: other.widthAnchor,
                                                 multiplier: multiplier,
                                                 constant: offset)
        })
    }

    /// Matches the height to other with optional multiplier and offset
    static func matchHeight(to other: Anchor, multipledBy multiplier: CGFloat = 1.0, withOffset offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            return anchor.heightAnchor.constraint(equalTo: other.heightAnchor,
                                                  multiplier: multiplier,
                                                  constant: offset)
        })
    }

    /// Matches the size to other with optional multiplier and offset
    static func matchSize(to other: Anchor, multipledBy multiplier: CGFloat = 1.0, withOffset offset: CGFloat = 0.0) -> Constraint {
        let width = matchWidth(to: other, multipledBy: multiplier, withOffset: offset)
        let height = matchHeight(to: other, multipledBy: multiplier, withOffset: offset)
        width.next = height
        return width
    }

    /// Matches width to height of other with optional multiplier and offset
    /// Note: If other is nil, then this can match to its own height
    static func matchWidthToHeight(ofView other: Anchor? = nil, multipledBy multiplier: CGFloat = 1.0, withOffset offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            return anchor.widthAnchor.constraint(equalTo: (other ?? anchor).heightAnchor,
                                                 multiplier: multiplier,
                                                 constant: offset)
        })
    }

    /// Matches height to width of other with optional multiplier and offset
    /// Note: If other is nil, then this can match to its own width
    static func matchHeightToWidth(ofView other: Anchor? = nil, multipledBy multiplier: CGFloat = 1.0, withOffset offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            return anchor.heightAnchor.constraint(equalTo: (other ?? anchor).widthAnchor,
                                                  multiplier: multiplier,
                                                  constant: offset)
        })
    }
}

// MARK: Vertical Alignment to Views
public extension Constraint {
    /// Matches the top to other with optional offset
    static func matchTopTo(_ other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return alignTop(to: .top, of: other, withOffset: offset)
    }

    /// Aligns the top to the axis of other with optional offset
    static func alignTop(to axis: AxisY, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.top, to: axis, ofView: other, offset: offset)
    }
    
    /// Aligns the top less than or equal to the axis of other with optional offset
    static func alignTop(lessThanOrEqualTo axis: AxisY, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.top, lessThanOrEqualTo: axis, ofView: other, offset: offset)
    }
    
    /// Aligns the top greater than or equal to the axis of other with optional offset
    static func alignTop(greaterThanOrEqualTo axis: AxisY, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.top, greaterThanOrEqualTo: axis, ofView: other, offset: offset)
    }

    /// Matches the bottom to other with optional offset
    static func matchBottomTo(_ other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return alignBottom(to: .bottom, of: other, withOffset: offset)
    }

    /// Aligns the bottom to the axis of other with optional offset
    static func alignBottom(to axis: AxisY, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.bottom, to: axis, ofView: other, offset: offset)
    }
    
    /// Aligns the bottom less than or equal to the axis of other with optional offset
    static func alignBottom(lessThanOrEqualTo axis: AxisY, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.bottom, lessThanOrEqualTo: axis, ofView: other, offset: offset)
    }
    
    /// Aligns the bottom greater than or equal to the axis of other with optional offset
    static func alignBottom(greaterThanOrEqualTo axis: AxisY, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.bottom, greaterThanOrEqualTo: axis, ofView: other, offset: offset)
    }

    /// Matches the centerY to other with optional offset
    static func matchCenterYTo(_ other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return alignCenterY(to: .centerY, of: other, withOffset: offset)
    }

    /// Aligns the centerY to the axis of other with optional offset
    static func alignCenterY(to axis: AxisY, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.centerY, to: axis, ofView: other, offset: offset)
    }
}

// MARK: Horizontal Alignment to Views
public extension Constraint {
    /// Matches the left to other with optional offset
    static func matchLeftTo(_ other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return alignLeft(to: .left, of: other, withOffset: offset)
    }

    /// Aligns the left to the axis of other with optional offset
    static func alignLeft(to axis: AxisX, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.left, to: axis, ofView: other, offset: offset)
    }

    /// Matches the right to other with optional offset
    static func matchRightTo(_ other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return alignRight(to: .right, of: other, withOffset: offset)
    }

    /// Aligns the right to the axis of other with optional offset
    static func alignRight(to axis: AxisX, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.right, to: axis, ofView: other, offset: offset)
    }

    /// Matches the leading to other with optional offset
    static func matchLeadingTo(_ other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return alignLeading(to: .leading, of: other, withOffset: offset)
    }

    /// Aligns the leading to the axis of other with optional offset
    static func alignLeading(to axis: AxisX, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.leading, to: axis, ofView: other, offset: offset)
    }
    
    /// Aligns the leading less than or equal to the axis of other with optional offset
    static func alignLeading(lessThanOrEqualTo axis: AxisX, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.leading, lessThanOrEqualTo: axis, ofView: other, offset: offset)
    }
    
    /// Aligns the leading greater than or equal to the axis of other with optional offset
    static func alignLeading(greaterThanOrEqualTo axis: AxisX, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.leading, greaterThanOrEqualTo: axis, ofView: other, offset: offset)
    }

    /// Matches the trailing to other with optional offset
    static func matchTrailingTo(_ other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return alignTrailing(to: .trailing, of: other, withOffset: offset)
    }

    /// Aligns the trailing to the axis of other with optional offset
    static func alignTrailing(to axis: AxisX, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.trailing, to: axis, ofView: other, offset: offset)
    }
    
    /// Aligns the trailing less than or equal to the axis of other with optional offset
    static func alignTrailing(lessThanOrEqualTo axis: AxisX, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.trailing, lessThanOrEqualTo: axis, ofView: other, offset: offset)
    }
    
    /// Aligns the greater less than or equal to the axis of other with optional offset
    static func alignTrailing(greaterThanOrEqualTo axis: AxisX, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.trailing, greaterThanOrEqualTo: axis, ofView: other, offset: offset)
    }

    /// Matches the centerX to other with optional offset
    static func matchCenterXTo(_ other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return alignCenterX(to: .centerX, of: other, withOffset: offset)
    }

    /// Aligns the centerX to the axis of other with optional offset
    static func alignCenterX(to axis: AxisX, of other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        return align(.centerX, to: axis, ofView: other, offset: offset)
    }
}

// MARK: Alignment to Views (Multi-Axis)
public extension Constraint {
    /// Aligns all edges to other with optional offset.
    /// Note: The offset takes into account the direction.
    /// That is, it is positive for leading and trailing, negative for top and bottom
    static func alignEdges(to other: Anchor, withOffset offset: CGFloat = 0.0) -> Constraint {
        let leading = matchLeadingTo(other, withOffset: offset)
        let trailing = matchTrailingTo(other, withOffset: -offset)
        let top = matchTopTo(other, withOffset: offset)
        let bottom = matchBottomTo(other, withOffset: -offset)
        leading.next = trailing
        trailing.next = top
        top.next = bottom
        return leading
    }
}

// MARK: Private Helpers
private extension Constraint {
    /// Helper to simplify vertical alignment constraints
    /// - Parameters:
    ///   - from The Y axis of the constraint we're modifying
    ///   - to The Y axis to apply the constraint to
    ///   - other: The Anchor we're applying these constraints relative to
    ///   - offset: The optional offset to use for the constraint
    static func align(_ from: AxisY, to: AxisY, ofView other: Anchor, offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            let fromAnchor = from.layoutAnchor(forAnchorable: anchor)
            let toAnchor = to.layoutAnchor(forAnchorable: other)
            return fromAnchor.constraint(equalTo: toAnchor, constant: offset)
        })
    }

    /// Helper to simplify horizontal alignment constraints
    /// - Parameters:
    ///   - from The X axis of the constraint we're modifying
    ///   - to The X axis to apply the constraint to
    ///   - other: The Anchor we're applying these constraints relative to
    ///   - offset: The optional offset to use for the constraint
    static func align(_ from: AxisX, to: AxisX, ofView other: Anchor, offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            let fromAnchor = from.layoutAnchor(forAnchorable: anchor)
            let toAnchor = to.layoutAnchor(forAnchorable: other)
            return fromAnchor.constraint(equalTo: toAnchor, constant: offset)
        })
    }
    
    /// Helper to simplify horizontal alignment constraints
    /// - Parameters:
    ///   - from The X axis of the constraint we're modifying
    ///   - lessThanOrEqualTo The X axis to apply the constraint less than or equal to
    ///   - other: The Anchor we're applying these constraints relative to
    ///   - offset: The optional offset to use for the constraint
    static func align(_ from: AxisX, lessThanOrEqualTo: AxisX, ofView other: Anchor, offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            let fromAnchor = from.layoutAnchor(forAnchorable: anchor)
            let lessThanOrEqualToAnchor = lessThanOrEqualTo.layoutAnchor(forAnchorable: other)
            return fromAnchor.constraint(lessThanOrEqualTo: lessThanOrEqualToAnchor, constant: offset)
        })
    }
    
    /// Helper to simplify horizontal alignment constraints
    /// - Parameters:
    ///   - from The X axis of the constraint we're modifying
    ///   - greaterThanOrEqualTo The X axis to apply the constraint greater than or equal to
    ///   - other: The Anchor we're applying these constraints relative to
    ///   - offset: The optional offset to use for the constraint
    static func align(_ from: AxisX, greaterThanOrEqualTo: AxisX, ofView other: Anchor, offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            let fromAnchor = from.layoutAnchor(forAnchorable: anchor)
            let greaterThanOrEqualToAnchor = greaterThanOrEqualTo.layoutAnchor(forAnchorable: other)
            return fromAnchor.constraint(greaterThanOrEqualTo: greaterThanOrEqualToAnchor, constant: offset)
        })
    }
    
    /// Helper to simplify vertical alignment constraints
    /// - Parameters:
    ///   - from The Y axis of the constraint we're modifying
    ///   - lessThanOrEqualTo The Y axis to apply the constraint less than or equal to
    ///   - other: The Anchor we're applying these constraints relative to
    ///   - offset: The optional offset to use for the constraint
    static func align(_ from: AxisY, lessThanOrEqualTo: AxisY, ofView other: Anchor, offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            let fromAnchor = from.layoutAnchor(forAnchorable: anchor)
            let lessThanOrEqualToAnchor = lessThanOrEqualTo.layoutAnchor(forAnchorable: other)
            return fromAnchor.constraint(lessThanOrEqualTo: lessThanOrEqualToAnchor, constant: offset)
        })
    }
    
    /// Helper to simplify vertical alignment constraints
    /// - Parameters:
    ///   - from The Y axis of the constraint we're modifying
    ///   - greaterThanOrEqualTo The Y axis to apply the constraint greater than or equal to
    ///   - other: The Anchor we're applying these constraints relative to
    ///   - offset: The optional offset to use for the constraint
    static func align(_ from: AxisY, greaterThanOrEqualTo: AxisY, ofView other: Anchor, offset: CGFloat = 0.0) -> Constraint {
        return Constraint(maker: { (anchor) -> NSLayoutConstraint in
            let fromAnchor = from.layoutAnchor(forAnchorable: anchor)
            let greaterThanOrEqualToAnchor = greaterThanOrEqualTo.layoutAnchor(forAnchorable: other)
            return fromAnchor.constraint(greaterThanOrEqualTo: greaterThanOrEqualToAnchor, constant: offset)
        })
    }
}
