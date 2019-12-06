import Quick
import Nimble
import Nimble_Snapshots
import Schematic

class TableOfContentsSpec: QuickSpec {

    private func subviewFactory() -> UIView {
        let subview = UIView(frame: .zero)
        subview.backgroundColor = .yellow
        return subview
    }

    override func spec() {
        let snapshotMode = false
        // Uncomment below to record new snapshots or update existing ones
        // let snapshotMode = true

        describe("Basic tests for Schematic") {
            let baseView: UIView = {
                let v = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0))
                v.backgroundColor = .white
                return v
            }()

            beforeEach {
                XCTAssertTrue(UIScreen.main.scale == 2.0, "Please run snapshot tests under iPhone 6/7/8 for now which has 2x screen, this is because snapshots are all recorded under 2x for now")
            }

            it("center a subview inside on both X and Y") {
                let subview = self.subviewFactory()
                baseView.addSubview(subview)
                subview.applyLayout([
                    .center(in: baseView),
                    .makeSize(equalTo: CGSize(width: 100.0, height: 100.0))
                    ])
                baseView.setNeedsLayout()
                // Verification:
                self.verify(snapshotMode, baseView)
            }

            it("center a subview inside on X axis and align top") {
                let subview = self.subviewFactory()
                baseView.addSubview(subview)
                subview.applyLayout([
                    .centerX(in: baseView),
                    .matchTopTo(baseView),
                    .makeSize(equalTo: CGSize(width: 100.0, height: 100.0))
                    ])
                baseView.setNeedsLayout()
                // Verification:
                self.verify(snapshotMode, baseView)
            }

            it("center a subview inside on Y axis and align left") {
                let subview = self.subviewFactory()
                baseView.addSubview(subview)
                subview.applyLayout([
                    .centerY(in: baseView),
                    .matchLeftTo(baseView),
                    .makeSize(equalTo: CGSize(width: 100.0, height: 100.0))
                    ])
                baseView.setNeedsLayout()
                // Verification:
                self.verify(snapshotMode, baseView)
            }

            afterEach {
                for subview in baseView.subviews {
                    subview.removeFromSuperview()
                }
            }
        }
    }
}

/// MARK: Convenience
/// Include in every test file, FBSnapshot uses the file name to determine reference folder for screenshots
/// so need to include in every file
private extension QuickSpec {
    func verify(_ mode: Bool, _ snapshot: Snapshotable) {
        // Either:
        // Use 📷 to first create what the view should look like, then comment it out
        if mode {
            📷(snapshot)
            return
        }
        // OR:
        // Use expect(<#view#>).to( haveValidSnapshot() ) to test
        // whether your change caused unexpcted behaviour for this view
        expect(snapshot).to( haveValidSnapshot() )
    }
}
