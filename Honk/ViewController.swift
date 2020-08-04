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
    
    @IBOutlet weak var honkOutside: UIImageView!
    @IBOutlet weak var honkEcho: UIImageView!
    @IBOutlet weak var honkBottle: UIImageView!
    @IBOutlet weak var honkMuffled: UIImageView!
    
    var player: AVAudioPlayer!
    var honkIndex = 0
    var soundName:String? = nil
    var image:UIImageView? = nil
    
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
        
        // Map the button names to the UIImageView of the corresponding image.
        switch buttonPressed {
        case "Honk":
            image = honkOutside
        case "Honk-lid":
            image = honkEcho
        case "Honk-glass":
            image = honkBottle
        case "Honk-muffled":
            image = honkMuffled
        default:
            print("We should never get here.")
        }
        // Then, let's dim the image for a beat to show what's been done.
        image!.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        //Bring's sender's opacity back up to fully opaque.
            self.image!.alpha = 1.0
        print("End")
        }
        
        
        
//        let soundName: String = buttonPressed + String(honkIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func playSound(soundName: String) {
//        print("playSound got \(soundName)")
    let url = Bundle.main.url(forResource: soundName,  withExtension: "wav")
//        print("playSound url = \(String(describing: url))")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
    }

}

