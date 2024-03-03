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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexpath: IndexPath) -> CGFloat {
        if indexpath.row == 0 {
            return 40
        } else {
            return 20
        }
    }
    /*
     01. UITableViewDataSource : 어떤 데이터로 어떻게 그려질 것인지와 관련된 매소드들이 많음.
     - func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     상위 두개의 펑션은 필수로 구현해줘야 함. 한 섹션에 몇개로 그릴 것인지 어떤 셀로 그릴 것인지 지정해줘여함.
     만약 두개의 펑션에 대한 구현이 없을 시 기본 값으로 1이 들어감. 즉, 위아래 모두 섹션 없이 한개로 나옴
     - DataSource 쪽은 테이블뷰를 그리는 것에 관심이 더 많음.
     함수 이름은 같지만 파라미터가 다른데, 해당 파라미터를 통해 구현 가능.
     - 나중에 정의된 함수들을 시간내서 한번 쭉 보는게 좋을 것 같음.
     
     02. UITableViewDelegate : dataSource 쪽보다는 Action과 관련된게 더 많음
     - Ex.     optional func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
     : 셀이 보여지기 바로 직전에 다운로드 받아서 표시해야하는 이미지에 대한 액션
     
     03. Tip
     - 함수의 파라미터 이름을 지을 때 애플 스타일로 지으면 협업이 편리해짐.
     */
}
