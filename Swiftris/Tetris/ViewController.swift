

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        let swiftrisViewController = SwiftrisViewController()
        self.present(swiftrisViewController, animated: true, completion: nil)
    }
}

