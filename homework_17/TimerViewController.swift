//
//  ViewController.swift
//  homework_17
//
//  Created by Александра Лесничая on 3/9/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timeRecLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!

    var x: Int = 0

    var timer: Timer?
    
    override func viewDidLoad() {
        timeRecLabel.text = "0"
        super.viewDidLoad()
    }

    @IBAction func startButtonDidClick(_ sender: Any) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            UILabel.animate(withDuration: 1.0) {
                self.x += 1
                self.timeRecLabel.text = String(self.x)

                if self.startButton.isEnabled {
                    self.restartButton.isEnabled = false
                }
            }
        }
    }

    @IBAction func pauseButtonDidClick(_ sender: Any) {
        timer?.invalidate()

        if self.pauseButton.isEnabled {
            self.restartButton.isEnabled = true
        }
    }

    @IBAction func restartButtonDidClick(_ sender: Any) {
        x = 0
        timeRecLabel.text = "0"
    }



}


