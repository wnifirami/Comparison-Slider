import SwiftUI

struct ConfigurationSheet: View {
    @Binding var activePreset: ConfigurationPreset
    @Binding var showsHandle: Bool
    @Binding var showsTrack: Bool
    @Binding var showsLeftLabel: Bool
    @Binding var showsRightLabel: Bool

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {
                Section("Preset") {
                    ForEach(ConfigurationPreset.allCases, id: \.self) { preset in
                        presetRow(preset: preset)
                    }
                }

                Section("Visibility") {
                    Toggle("Handle", isOn: $showsHandle)
                    Toggle("Track", isOn: $showsTrack)
                    Toggle("Left Label", isOn: $showsLeftLabel)
                    Toggle("Right Label", isOn: $showsRightLabel)
                }
            }
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }

    @ViewBuilder
    private func presetRow(preset: ConfigurationPreset) -> some View {
        let configuration = preset.configuration
        Button {
            activePreset = preset
        } label: {
            HStack {
                Circle()
                    .fill(configuration.colors.handleIconColor)
                    .frame(width: 20, height: 20)
                Text(preset.rawValue)
                    .foregroundStyle(.primary)
                Spacer()
                if activePreset == preset {
                    Image(systemName: "checkmark")
                        .foregroundStyle(.tint)
                }
            }
        }
    }
}
