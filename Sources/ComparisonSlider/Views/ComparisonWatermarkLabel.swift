import SwiftUI

struct ComparisonWatermarkLabel: View, Equatable {
    let text: String
    let alignment: Alignment
    let opacity: CGFloat
    let font: Font
    let textColor: Color
    let backgroundColor: Color
    let shadowColor: Color
    let outerPadding: CGFloat
    let innerPaddingHorizontal: CGFloat
    let innerPaddingVertical: CGFloat

    var body: some View {
        Text(text)
            .font(font)
            .foregroundColor(textColor)
            .padding(.horizontal, innerPaddingHorizontal)
            .padding(.vertical, innerPaddingVertical)
            .background(backgroundColor, in: Capsule())
            .shadow(color: shadowColor, radius: 2, x: 1, y: 1)
            .opacity(opacity)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .padding(outerPadding)
            .animation(.easeOut(duration: 0.15), value: opacity)
            .allowsHitTesting(false)
    }
}
