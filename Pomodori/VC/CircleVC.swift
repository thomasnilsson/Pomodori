import UIKit

class CircleVC: UIViewController {
    
    @IBOutlet weak var roundView: MFRoundProgressView!
    
    var value = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        roundView.percent = CGFloat(0)
    }

    @IBAction func buttonTapped(_ sender: Any) {
        value += value < 100 ? 10 : 0
        roundView.percent = CGFloat(value)
    }
}
