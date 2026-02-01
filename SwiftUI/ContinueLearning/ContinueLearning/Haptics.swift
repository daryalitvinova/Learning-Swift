//
//  Haptics.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 28.01.2026.
//

import SwiftUI

class HapticsManager {
    static let shared = HapticsManager()
    
    private init() { }
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct Haptics: View {
    var body: some View {
        VStack(spacing: 30) {
            Button("success") { HapticsManager.shared.notification(type: .success)}
            Button("error") { HapticsManager.shared.notification(type: .error)}
            Button("warning") { HapticsManager.shared.notification(type: .warning)}
            Divider()
            Button("heavy") { HapticsManager.shared.impact(style: .heavy)}
            Button("light") { HapticsManager.shared.impact(style: .light)}
            Button("medium") { HapticsManager.shared.impact(style: .medium)}
            Button("rigid") { HapticsManager.shared.impact(style: .rigid)}
            Button("soft") { HapticsManager.shared.impact(style: .soft)}
        }
    }
}

#Preview {
    Haptics()
}
