//
//  ExampleView.swift
//  Schematic_Example
//
//  Created by Alex Figueroa on 2018-03-08.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Schematic

final class ExampleView: UIView {
    let redView: UIView = ExampleView.buildView(withColor: .red)
    let greenView: UIView = ExampleView.buildView(withColor: .green)
    let blueView: UIView = ExampleView.buildView(withColor: .blue)
    let leadingGuide: UILayoutGuide = UILayoutGuide()
    let trailingGuide: UILayoutGuide = UILayoutGuide()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
        applyConstraints()
    }

    // MARK: View Setup
    private func buildView() {
        backgroundColor = .white
        addSubview(greenView)
        addSubview(blueView)
        addSubview(redView)
        addLayoutGuide(leadingGuide)
        addLayoutGuide(trailingGuide)
    }

    private func applyConstraints() {
        let topAnchor: Anchorable
        if #available(iOS 11.0, *) {
            topAnchor = safeAreaLayoutGuide
        } else {
            topAnchor = self
        }

        redView.applyLayout([
            .matchTopTo(topAnchor, withOffset: 70),
            .centerX(in: self),
            .makeSize(equalTo: 40.0)
        ])

        [leadingGuide, trailingGuide, greenView].applyLayout([
            .centerY(in: self)
        ])

        greenView.applyLayout([
            .makeHeight(equalTo: 300)
        ])

        leadingGuide.applyLayout([
            .matchLeadingTo(self),
            .alignTrailing(to: .leading, of: greenView),
            .makeWidth(equalTo: 100)
        ])

        trailingGuide.applyLayout([
            .alignLeading(to: .trailing, of: greenView),
            .matchTrailingTo(self),
            .matchWidth(to: leadingGuide),
        ])

        blueView.applyLayout([
            .alignEdges(to: greenView, withOffset: 40)
        ])
    }

    // MARK: Builder
    static func buildView(withColor color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
}
