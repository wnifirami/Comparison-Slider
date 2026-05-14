//
//  ContentView.swift
//  Comparison Slider
//
//  Created by Rami Ounifi on 14.05.26.
//

import SwiftUI

struct ContentView: View {
    @State private var splitFraction: CGFloat = 0.5
    @State private var showsConfigurationSheet: Bool = false
    @State private var activePreset: ConfigurationPreset = .default
    @State private var showsHandle: Bool = true
    @State private var showsTrack: Bool = true
    @State private var showsLeftLabel: Bool = true
    @State private var showsRightLabel: Bool = true

    private var configuration: ComparisonSliderConfiguration {
        var config = activePreset.configuration
        config.appearance.showsHandle = showsHandle
        config.appearance.showsTrack = showsTrack
        config.appearance.showsLeftLabel = showsLeftLabel
        config.appearance.showsRightLabel = showsRightLabel
        return config
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    ComparisonSliderView(
                        splitFraction: $splitFraction,
                        configuration: configuration
                    ) {
                        LinearGradient(
                            colors: [Color(red: 0.12, green: 0.18, blue: 0.35), Color(red: 0.20, green: 0.40, blue: 0.60)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    } rightView: {
                        LinearGradient(
                            colors: [Color(red: 0.55, green: 0.20, blue: 0.10), Color(red: 0.90, green: 0.50, blue: 0.15)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("Comparison Slider")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Theme") {
                        showsConfigurationSheet = true
                    }
                }
            }
            .sheet(isPresented: $showsConfigurationSheet) {
                ConfigurationSheet(
                    activePreset: $activePreset,
                    showsHandle: $showsHandle,
                    showsTrack: $showsTrack,
                    showsLeftLabel: $showsLeftLabel,
                    showsRightLabel: $showsRightLabel
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
