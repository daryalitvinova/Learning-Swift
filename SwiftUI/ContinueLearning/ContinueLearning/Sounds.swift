//
//  Sounds.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 27.01.2026.
//

import SwiftUI
import AVKit
import Combine

class SoundManager: ObservableObject {
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    private init() {}
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    func playSound(name: SoundOption) {
        guard let url = Bundle.main.url(forResource: name.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Ошибка при воспроизведении звука: \(error.localizedDescription)")
        }
    }
}

struct Sounds: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                SoundManager.shared.playSound(name: .tada)
            }
            Button("Play sound 2") {
                SoundManager.shared.playSound(name: .badum)
            }
        }
    }
}

#Preview {
    Sounds()
}
