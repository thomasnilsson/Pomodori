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
        let topColor = UIColor.black
        let bottomColor = UIColor.black

        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let locations: [NSNumber] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = locations
        gradientLayer.frame = vc.view.bounds
        vc.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
