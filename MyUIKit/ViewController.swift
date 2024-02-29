//
//  ViewController.swift
//  MyUIKit
//
//  Created by 김예지 on 3/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLable: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad() // 스토리보드의 있는 요소들을 다 그렸다는 호출 함수
        view.backgroundColor = .blue //SwiftUI의 Color와는 타입이 다름 "UIColor"임
    }

    @IBAction func touchMyButton(_ sender: Any) {
        myLable.text = "I Love You <3"
    }
    
}

