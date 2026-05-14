import Foundation

public struct ComparisonSliderAppearance: Equatable {
    public var showsTrack: Bool
    public var showsHandle: Bool
    public var showsLeftLabel: Bool
    public var showsRightLabel: Bool

    public init(
        showsTrack: Bool = true,
        showsHandle: Bool = true,
        showsLeftLabel: Bool = true,
        showsRightLabel: Bool = true
    ) {
        self.showsTrack = showsTrack
        self.showsHandle = showsHandle
        self.showsLeftLabel = showsLeftLabel
        self.showsRightLabel = showsRightLabel
    }
}
