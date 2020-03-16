//
//  ViewMultiplierViewController.swift
//  homework_17
//
//  Created by Александра Лесничая on 3/11/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class ViewMultiplierViewController: UIViewController {
    let colours: [UIColor] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
    var views: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var randomColor: UIColor {
        get {
            let index = Int.random(in: 0..<colours.count)
            return colours[index]
        }
    }

    var viewWithRandomColor: UIView {
        get {
            let view = UIView()
            view.backgroundColor = randomColor
            return view
        }
    }

    @IBAction func addViewButtonDidClick(_ sender: Any) {
        let prevView = views.last
        if let prevViewMaxY = prevView?.frame.maxY, prevViewMaxY > self.view.frame.size.height - 100 {
            return
        }

        let view = viewWithRandomColor
        self.view.addSubview(view)
        setupConstraints(forView: view)

        views.append(view)
    }

    private func setupConstraints(forView view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false

        if views.isEmpty {
            view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        } else {
            if let prevView = views.last {
                view.topAnchor.constraint(equalTo: prevView.bottomAnchor, constant: 20).isActive = true
            }
        }
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
}

       
        
        
       
       
      
           


