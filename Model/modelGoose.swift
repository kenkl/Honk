
import Foundation
import AVFoundation

struct Goose {
    
    var player: AVAudioPlayer!
    var honkIndex = 0
    var soundName:String? = nil
    
    
    mutating func honk(button: String) {
        
        let buttonPressed = button
        
        if buttonPressed == "Honk" || buttonPressed == "Honk-glass" {
            honkIndex = Int.random(in: 1...4)
        } else {
            honkIndex = Int.random(in: 1...3)
        }
        soundName = buttonPressed + String(honkIndex)
        playSound(soundName: soundName!)
        
    }
    
    mutating func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName,  withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
