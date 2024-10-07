//
//  ViewController.swift
//  MyUIKit
//
//  Created by Ben on 10/6/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        // Do any additional setup after loading the view.
    }
    @IBAction func didMyButtonTapped(_ sender: Any) {
        myLabel.text = "Hello UIKit"
    }
    

}

