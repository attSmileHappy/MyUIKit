//
//  BlueViewController.swift
//  MyUIKit
//
//  Created by 김예지 on 3/6/24.
//

import UIKit

class BlueViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var friend: UILabel!
    
    var inputName : String = ""
    var friendsB : [People] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let friendsNames = friendsB.map{$0.name}
        let friendList = friendsNames.joined(separator: "\n")
        name.text = inputName
        friend.text = friendList
    }
}
