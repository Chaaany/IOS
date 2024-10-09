//
//  MyViewController.swift
//  MyUIKit
//
//  Created by Ben on 10/7/24.
//

import UIKit

protocol AdminDelegate {
    func doTask()
}

class MyViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var helloLabel: UILabel!
    var admin: Admin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        admin = Admin(delegate: self)
    }
    @IBAction func didTapButton(_ sender: Any) {
        if let name = nameTextField.text {
            helloLabel.text = "Hello \(name)!"
        }
        admin?.delegate.doTask()
        
        print("Hello Ben!")
    }
}

extension MyViewController: AdminDelegate {
    func doTask() {
        print("저 지금 일 잘하고 있습니다!")
    }
}

struct Admin {
    var delegate: AdminDelegate
}

