//
//  TodoViewController.swift
//  MyUIKit
//
//  Created by 김예지 on 3/4/24.
//

import UIKit

struct TodoItem {
    let title: String
    var isCompleted : Bool
}

class TodoViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    var data : [TodoItem] = [
        TodoItem(title: "Github Commit", isCompleted: true),
        TodoItem(title: "Exercise", isCompleted: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        todoTableView.backgroundColor = UIColor(red: 0, green: 100/255, blue: 0, alpha: 1)
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
}

extension TodoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection scetion: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        if self.data[indexPath.row].isCompleted {
            cell.textLabel?.textColor = .gray
            cell.imageView?.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            cell.textLabel?.textColor = .black
            cell.imageView?.image = UIImage(systemName: "circle")
            /* 사담.
             Wow... Todo 만드는 김에 완료 값에 따른 이미지 변경도 해봤는데
             cell.imageView?.image = UIImage(named: "checkmark.circle.fill")
             위에 코드가 계속 안돼서 도통 뭐가 문제인지를 모르겠어서 고민하고 구글링해봤는데
             알고보니 named: 가 아니라 systemName으로 지정해줘야해서 일어난 문제였다.
             UIImage(systemName: "circle")
             자동완성을 너무 믿으면 안되겠다...
             */
        }
        return cell
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let myAction = UIContextualAction(style: .normal, title: "완료") { action, view, completionHandler in
            self.data[indexPath.row].isCompleted.toggle()
            self.todoTableView.reloadData()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [myAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoTableView.deselectRow(at: indexPath, animated: true)
    }
}
