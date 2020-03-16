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
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.x += 1
            self.updateTimeRecLabel()
        }
    }

    @IBAction func pauseButtonDidClick(_ sender: Any) {
        timer?.invalidate()
        timer = nil
    }

    @IBAction func restartButtonDidClick(_ sender: Any) {
        timer?.invalidate()
        timer = nil
        x = 0
        updateTimeRecLabel()
    }

    func updateTimeRecLabel() {
        timeRecLabel.text = String(x)
    }
}


