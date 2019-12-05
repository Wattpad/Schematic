#
# Be sure to run `pod lib lint Schematic.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Schematic'
  s.version          = '1.0.0'
  s.summary          = 'A declarative Swift micro-framework for view layouts'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  In summary, we wanted to go from this:
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
                       DESC

  s.homepage         = 'https://github.com/Wattpad/Schematic'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alexjfigueroa@gmail.com' => 'alexjfigueroa@gmail.com' }
  s.source           = { :git => 'https://github.com/Wattpad/Schematic.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_versions = '4.0'

  s.source_files = 'Schematic/Classes/**/*'

end
