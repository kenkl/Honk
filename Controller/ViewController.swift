
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var honkOutside: UIImageView!
    @IBOutlet weak var honkEcho: UIImageView!
    @IBOutlet weak var honkBottle: UIImageView!
    @IBOutlet weak var honkMuffled: UIImageView!
    
    var image:UIImageView? = nil
    var goose = Goose()
    
    @IBAction func honkButton(_ sender: UIButton) {
        let buttonPressed = sender.currentTitle!
        
        goose.honk(button: buttonPressed)
        
        // Map the button name to the UIImageView of the corresponding image.
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
            break
        }
        // Then, let's dim the image for a beat to give some feedback.
        image!.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.image!.alpha = 1.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

