# ComparisonSlider

A generic SwiftUI before/after comparison slider that accepts any two views and exposes a fully configurable appearance system.

---

## Preview

<p align="center">
  <img src="Screenshots/main.png" width="30%" alt="Main view" />
  &nbsp;&nbsp;
  <img src="Screenshots/themes.png" width="30%" alt="Theme presets" />
  &nbsp;&nbsp;
  <img src="Screenshots/settings.png" width="30%" alt="Configuration sheet" />
</p>

---

## Features

- **Generic views** — drop in any SwiftUI view as the left or right side
- **Drag handle** — scales on press with spring animation; fully hideable
- **Watermark labels** — fade in/out near the edges; text, font, and colors configurable
- **Preset system** — ship built-in presets or define your own with a one-liner extension
- **Zero dependencies** — pure SwiftUI, no third-party packages

---

## Requirements

| | Minimum |
|---|---|
| iOS | 17.0 |
| macOS | 14.0 |
| Swift | 5.9 |
| Xcode | 15.0 |

---

## Installation

### Swift Package Manager

**Xcode:** File → Add Package Dependencies, paste the URL below, select *Up to Next Major Version* from `1.0.0`.

```
https://github.com/wnifirami/Comparison-Slider.git
```

**Package.swift:**

```swift
dependencies: [
    .package(url: "https://github.com/wnifirami/Comparison-Slider.git", from: "1.0.0")
],
targets: [
    .target(name: "YourApp", dependencies: ["ComparisonSlider"])
]
```

---

## Quick start

```swift
import SwiftUI

struct ContentView: View {
    @State private var splitFraction: CGFloat = 0.5

    var body: some View {
        ComparisonSliderView(splitFraction: $splitFraction) {
            Image("before").resizable().scaledToFill()
        } rightView: {
            Image("after").resizable().scaledToFill()
        }
        .aspectRatio(1, contentMode: .fit)
    }
}
```

---

## Configuration

Every visual property comes from `ComparisonSliderConfiguration`. Start from `.default` and mutate only what you need.

```swift
var config = ComparisonSliderConfiguration.default
config.colors.trackColor = .white
config.typography.leftLabelText = "Original"
config.typography.rightLabelText = "Generated"
config.appearance.showsHandle = true

ComparisonSliderView(splitFraction: $split, configuration: config) { ... } rightView: { ... }
```

Configuration is a value type — assigning a new value updates the component live.

### Built-in presets

```swift
ComparisonSliderView(splitFraction: $split, configuration: .ocean) { ... } rightView: { ... }
ComparisonSliderView(splitFraction: $split, configuration: .sunset) { ... } rightView: { ... }
ComparisonSliderView(splitFraction: $split, configuration: .minimal) { ... } rightView: { ... }
```

### Define your own preset

```swift
extension ComparisonSliderConfiguration {
    static var brand: ComparisonSliderConfiguration {
        var config = ComparisonSliderConfiguration.default
        config.colors.trackColor = Color(red: 0.42, green: 0.13, blue: 0.63)
        config.colors.handleIconColor = Color(red: 0.42, green: 0.13, blue: 0.63)
        return config
    }
}
```

---

## ComparisonSliderConfiguration reference

### Colors — `config.colors`

| Property | Default | Description |
|---|---|---|
| `trackColor` | `.white.opacity(0.9)` | Vertical divider line color |
| `handleIconColor` | `.white` | Chevron icon color |
| `handleBackgroundColor` | `.white.opacity(0.25)` | Handle capsule fill |
| `leftLabelTextColor` | `.white` | Left watermark text color |
| `rightLabelTextColor` | `.white` | Right watermark text color |
| `leftLabelBackgroundColor` | `.black.opacity(0.30)` | Left watermark capsule fill |
| `rightLabelBackgroundColor` | `.black.opacity(0.30)` | Right watermark capsule fill |
| `leftLabelShadowColor` | `.black.opacity(0.55)` | Left watermark drop shadow |
| `rightLabelShadowColor` | `.black.opacity(0.55)` | Right watermark drop shadow |

### Typography — `config.typography`

| Property | Default | Description |
|---|---|---|
| `leftLabelText` | `"Before"` | Left watermark string |
| `rightLabelText` | `"After"` | Right watermark string |
| `leftLabelFont` | `.caption.bold()` | Left watermark font |
| `rightLabelFont` | `.caption.bold()` | Right watermark font |

### Spacing — `config.spacing`

| Property | Default | Description |
|---|---|---|
| `trackWidth` | `2` | Divider line thickness in points |
| `handleIconSize` | `22` | Chevron icon width/height |
| `handleIconSpacing` | `4` | Gap between the two chevrons |
| `handleShadowRadius` | `6` | Handle shadow blur radius |
| `labelOuterPadding` | `8` | Distance from watermark to image edge |
| `labelInnerPaddingHorizontal` | `10` | Watermark horizontal inner padding |
| `labelInnerPaddingVertical` | `5` | Watermark vertical inner padding |
| `labelEdgeFadeThreshold` | `0.02` | Fraction at which labels stay fully visible |

### Appearance — `config.appearance`

| Property | Default | Description |
|---|---|---|
| `showsTrack` | `true` | Show the vertical divider line |
| `showsHandle` | `true` | Show the drag handle |
| `showsLeftLabel` | `true` | Show the left watermark label |
| `showsRightLabel` | `true` | Show the right watermark label |

---

## ComparisonSliderView parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `splitFraction` | `Binding<CGFloat>` | — | Current split position 0…1 (required) |
| `configuration` | `ComparisonSliderConfiguration` | `.default` | Visual and behavioural configuration |
| `leftView` | `() -> LeftView` | — | View shown on the left (required) |
| `rightView` | `() -> RightView` | — | View shown on the right (required) |

---

## Project structure

```
Comparison-Slider/
├── Comparison Slider.xcodeproj
├── Sources/ComparisonSlider/
│   ├── ComparisonSliderView.swift
│   ├── ComparisonSliderViewModel.swift
│   ├── Configuration/
│   │   ├── ComparisonSliderConfiguration.swift
│   │   ├── ComparisonSliderColors.swift
│   │   ├── ComparisonSliderTypography.swift
│   │   ├── ComparisonSliderSpacing.swift
│   │   └── ComparisonSliderAppearance.swift
│   ├── Views/
│   │   ├── ComparisonHandleView.swift
│   │   └── ComparisonWatermarkLabel.swift
│   └── Helpers/
│       └── ComparisonSliderMath.swift
├── Example/
│   ├── ExampleApp.swift
│   ├── ContentView.swift
│   ├── ConfigurationSheet.swift
│   ├── ConfigurationPreset.swift
│   └── ComparisonSliderConfiguration+Presets.swift
├── Comparison SliderTests/
└── Comparison SliderUITests/
```

---

## Running the example

Open `Comparison Slider.xcodeproj` in Xcode 15+, select the **Comparison Slider** scheme, and run on an iOS 17+ simulator.

---

## License

MIT — see [LICENSE](LICENSE).

© 2026 Rami Ounifi
