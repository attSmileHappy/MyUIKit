//
//  MyViewController.swift
//  MyUIKit
//
//  Created by 김예지 on 3/2/24.
//

import UIKit

protocol AdminDelegate {
    func doTask()
}

class MyViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    var admin: Admin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        admin = Admin(delegate: self)
    }
    
    @IBAction func didTabButton(_ sender: Any) {
        if let name = nameTextField.text {
            helloLabel.text = "Hello, \(name)!"
        }
        admin?.delegate.doTask()
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
