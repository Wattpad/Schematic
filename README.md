# Schematic

[![CI Status](http://img.shields.io/travis/alexjfigueroa@gmail.com/Schematic.svg?style=flat)](https://travis-ci.org/alexjfigueroa@gmail.com/Schematic)
[![Version](https://img.shields.io/cocoapods/v/Schematic.svg?style=flat)](http://cocoapods.org/pods/Schematic)
[![License](https://img.shields.io/cocoapods/l/Schematic.svg?style=flat)](http://cocoapods.org/pods/Schematic)
[![Platform](https://img.shields.io/cocoapods/p/Schematic.svg?style=flat)](http://cocoapods.org/pods/Schematic)

**A lightweight micro-framework to lay out views declaratively.**

The name was chosen because an electrical schematic shows the connections of a circuit. Since we're named after an electrical unit of power it only seemed fitting we tried to fit that theme.

## Rationale

Take a look at this write up for an explanation of how this framework came to be:
- [Building a Micro-Framework for Constraints](https://github.com/Wattpad/ios/wiki/%5BRetro%5D-Breakdown:-Building-a-Micro-Framework-for-Constraints)

In summary, I wanted to go from this:
```swift
NSLayoutConstraint.activate([
    a.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 10.0),
    a.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -10.0),
    a.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 10.0),
    a.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -10.0)
])
```

and go to something like this:
```swift
a.applyLayout([
    .alignToEdges(of: parentView)
])
```

The original PR can be found here as well: https://github.com/Wattpad/ios/pull/9896.
The major change is that now instead of using the Composite pattern and having to build so many arrays, we just have one simple class that acts as a Linked List node to avoid array creation overhead. This makes for a simpler application of constraints.

## Vision

The next steps to help evolve this framework are to acheive the following goals:
1. Approval from other iOS engineers on the technical design of this framework
2. Implementation into the production app
3. Assessment of readability and performance
4. Open source if deemed worthy!

## Usage

Using Schematic is quite simple and the best part is that `translatesAutoResizingMaskIntoConstraints` gets set to `false` for you automatically.

The class `Constraint` has a bunch of useful extensions which you can use to declare your layout.
For example, if we wanted to center a view `view` in a parent view `parentView` with a fixed size:

```swift
viewA.applyLayout([
    .center(in: parentView),
    .makeSize(equalTo: 20.0) // Infers that you want a 20x20 size
])
```

Another example, could be aligning a profile photo `profileImageView` to the right of a label `usernameLabel` while also centering both vertically in a parent view `parentView`

```swift
// Support laying out multiple views at once
[profileImageView, usernameLabel].applyLayout([
    .centerY(in: parentView)
])

profileImageView.applyLayout([
    .matchLeadingTo(parentView),
    .alignTrailing(to: .leading, of: usernameLabel, withOffset: -10.0)
])

usernameLabel.applyLayout([
    .matchTrailingTo(parentView)
])
```

To grab a reference to a constraint (`NSLayoutConstraint`), you'll need to call only a single layout:
```swift
// Returns the first constraint that was used to create this layout
let constraint = usernameLabel.applyLayout(
    .matchTrailingTo(parentView)
)

// The first constraint rule is done because for multiple constraints, it would be troublesome to return all of them.
// Here, the constraint could be centerX or centerY so this is best used for single constraints.
let constraint = usernameLabel.applyLayout(
    .center(in: parentView)
)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Schematic is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Schematic'
```

## Author

Alexander Figueroa, alexjfigueroa@gmail.com

## License

Schematic is available under the MIT license. See the LICENSE file for more info.
