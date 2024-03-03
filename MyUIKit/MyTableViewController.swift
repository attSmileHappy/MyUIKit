//
//  MyTableViewController.swift
//  MyUIKit
//
//  Created by 김예지 on 3/3/24.
//

import UIKit

class MyTableViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    let cellData = ["Hello TableView!", "This is UIKit" , "Welcome!" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureTableView()
    }
    func configureTableView()  {
        myTableView.backgroundColor = .white
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

// extension 으로 빼는 이유는 tableView 관련 요소들을 바깥으로 빼기위해서, 만약 외부로 빼지않을 시 상위 클래스에 아래에 UITableViewDelegate, UITableViewDataSource 들을 선언해주면 됨.
// delegate 관련, 이미 정의된 함수들(ex.configureTableView, numberOfSections, tableView 등)을 사용하면 델리게이트 사용이 되는 것이라고 생각하면 될 듯.
extension MyTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count // data의 수와 리턴 값의 수가 일치하지 않을 시 크러쉬가 남.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) 
        cell.textLabel?.text = cellData[indexPath.row]
        return cell
    }
}
