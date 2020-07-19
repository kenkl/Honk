//
//  ViewController.swift
//  Honk
//
//  Created by kenkl on 2020-07-14.
//  Copyright © 2020 kenkl. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var honkIndex = 0
    var soundName:String? = nil
    
    @IBAction func honkButton(_ sender: UIButton) {
        let buttonPressed = sender.currentTitle!
//        print(buttonPressed)
        
        if buttonPressed == "Honk" || buttonPressed == "Honk-glass" {
            honkIndex = Int.random(in: 1...4)
        } else {
            honkIndex = Int.random(in: 1...3)
        }
        soundName = buttonPressed + String(honkIndex)
        
//        print(soundName!)
        
        playSound(soundName: soundName!)
        
        
        
//        let soundName: String = buttonPressed + String(honkIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func playSound(soundName: String) {
        print("playSound got \(soundName)")
    let url = Bundle.main.url(forResource: soundName,  withExtension: "wav")
//        print("playSound url = \(String(describing: url))")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
    }

}

