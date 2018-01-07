//  Author: Thomas Nilsson
//  Technical University of Denmark
//  Copyright © 2017 Thomas Nilsson. All rights reserved.

import Foundation
import UIKit

class UISetter {
    
    func setUI(vc: UIViewController, buttons: [UIButton]) {
        roundButtonCorners(buttons: buttons)
        setBackground(vc: vc)
    }
    
    // Rounds the corners of buttons within the given array of UIButtons.
    func roundButtonCorners(buttons: [UIButton]) {
        for button in buttons {
            let desiredRadius = button.frame.height / 2
            button.layer.cornerRadius = desiredRadius
        }
    }
    
    // Makes background gradient
    func setBackground(vc: UIViewController) {
        let background = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        vc.view.backgroundColor = background
    }
}
