//
//  MainMenuVC.swift
//  Pomodori
//
//  Created by Thomas Nilsson on 04/01/2018.
//  Copyright © 2018 Thomas Nilsson. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {

    @IBOutlet weak var pomodoroButton: UIButton!
    @IBOutlet weak var overviewButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetter().roundButtonCorners(buttons: [pomodoroButton, overviewButton, settingsButton])
    }

}
