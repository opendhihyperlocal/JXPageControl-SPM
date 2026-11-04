# JXPageControl-SPM

[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/badge/platform-iOS%2013%2B-blue.svg?style=flat)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.5%2B-orange.svg?style=flat)](https://swift.org)
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](LICENSE)

A customizable replacement for `UIPageControl`, packaged for **Swift Package Manager**.
It comes with several animated indicator styles, flexible content alignment, and full Interface Builder support (`@IBDesignable` / `@IBInspectable`).

## What's different in this package

- Installable with Swift Package Manager (`Package.swift`)
- Library source moved to `Sources/JXPageControl`
- Minimum iOS raised to 13 and Swift tools 5.5
- `diameter` and `borderWidth` on `JXPageControlFill` are now `public`, so they can be set from code

## Indicator styles

| Group | Class | Effect |
|---|---|---|
| Jump | `JXPageControlJump` | Active dot jumps between positions |
| Jump | `JXPageControlLine` | Line-shaped indicators |
| Jump | `JXPageControlBoldLine` | Thick line indicators |
| Jump | `JXPageControlEllipse` | Elliptical active indicator |
| Transform | `JXPageControlChameleon` | Active color blends into the next dot |
| Transform | `JXPageControlExchange` | Active dot swaps places with the next one |
| Transform | `JXPageControlFill` | Ring indicators that fill as you scroll |
| Transform | `JXPageControlScale` | Active dot scales up |

All styles inherit from `JXPageControlBase` and conform to `JXPageControlType`.

## Requirements

- iOS 13.0+
- Swift 5.5+
- Xcode 13.0+

## Installation

### Swift Package Manager (recommended)

**Xcode:** File → Add Package Dependencies… and enter:

```
https://github.com/opendhihyperlocal/JXPageControl-SPM.git
```

Choose version `1.0.0` or later, then add the **JXPageControl** library to your app target.

**Package.swift:**

```swift
dependencies: [
    .package(url: "https://github.com/opendhihyperlocal/JXPageControl-SPM.git", from: "1.0.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "JXPageControl", package: "JXPageControl-SPM")
        ]
    )
]
```

### CocoaPods

```ruby
pod 'JXPageControl', :git => 'https://github.com/opendhihyperlocal/JXPageControl-SPM.git', :tag => '1.0.0'
```

## Usage

```swift
import JXPageControl
```

### In code

```swift
class OnboardingViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!

    lazy var pageControl: JXPageControlJump = {
        let pageControl = JXPageControlJump(frame: CGRect(x: 0, y: 0,
                                                          width: UIScreen.main.bounds.width,
                                                          height: 30))
        pageControl.numberOfPages = 4
        pageControl.activeColor = .white
        pageControl.inactiveColor = UIColor.white.withAlphaComponent(0.5)
        pageControl.isAnimation = true
        return pageControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pageControl)
        scrollView.delegate = self
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let progress = scrollView.contentOffset.x / scrollView.bounds.width

        // Option 1: animate smoothly with the scroll position
        pageControl.progress = progress

        // Option 2: jump to the nearest page
        // pageControl.currentPage = Int(round(progress))
    }
}
```

### In a storyboard or XIB

Add a `UIView`, set its class to any style above (for example `JXPageControlChameleon`) and set **Module** to `JXPageControl`. If the module is not set, the control will not render.
The properties below appear in the Attributes inspector, and `contentMode` on the view controls where the dots sit.

## Common properties (`JXPageControlType`)

| Property | Description |
|---|---|
| `numberOfPages` | Number of indicators |
| `currentPage` | Current page index |
| `progress` | Scroll progress, from `0` to `numberOfPages - 1` |
| `hidesForSinglePage` | Hide the control when there is only one page |
| `activeColor` / `inactiveColor` | Colors of the active and inactive indicators |
| `activeSize` / `inactiveSize` | Sizes of the active and inactive indicators |
| `indicatorSize` | Sets the size of all indicators at once |
| `columnSpacing` | Horizontal spacing between indicators |
| `contentAlignment` | Content position, e.g. `JXPageControlAlignment(.center, .center)` |
| `isActiveHollow` / `isInactiveHollow` | Draw indicators as rings instead of filled dots |
| `reload()` | Redraw the control |

Some styles add their own properties, such as `isAnimation` on `JXPageControlJump`, `JXPageControlChameleon` and `JXPageControlScale`.

## Maintainer

[opendhihyperlocal](https://github.com/opendhihyperlocal)

## License

Available under the MIT license. See [LICENSE](LICENSE) for details.

## Credits

This package is based on [JXPageControl](https://github.com/Code-TanJX/JXPageControl) by Code-TanJX (MIT license). The original copyright notice is kept in [LICENSE](LICENSE).
