//
//  HomeViewController.swift
//  MyUIKit
//
//  Created by 김예지 on 3/6/24.
//

import UIKit

struct People {
    let name: String
    let age : String
}

class HomeViewController: UIViewController {

    @IBOutlet weak var insertNameTextFiled: UITextField!
    var friendsH: [People] = [
    People(name: "예지", age: "25")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // prepare 함수는 segue가 이동하기 직전에 불림. 제일 먼저 로드된다 생각하면 될 듯. View가 그려지기 전에 호출됨
        if segue.identifier == "goNext" {
            let viewController = segue.destination as! BlueViewController // Segue의 목적지 타겟 설정
            viewController.inputName = insertNameTextFiled.text!
            /*
             MyUIKit/HomeViewController.swift:23: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
             :View가 그려지기 전에 접근을 하면 앱이 터짐. 그렇기 때문에 데이터를 받아줄 변수를 하나 지정해주어서 따로 데이터 값을 저장 해줘야 함.
             */
            viewController.friendsB = friendsH
        }
    }
}
