//
//  MyTodoViewController.swift
//  MyUIKit
//
//  Created by 김예지 on 3/6/24.
//

import UIKit

struct myTodoList {
    let todo : String
    var isCompleted : Bool
}

class MyTodoViewController: UIViewController {
    
    var todoData : [myTodoList] = [
    myTodoList(todo: "Swift 문법 공부", isCompleted: true),
    myTodoList(todo: "SwiftUI 실습", isCompleted: true),
    myTodoList(todo: "UIKit 실습", isCompleted: false)
    ]
    
    @IBOutlet weak var myTodoTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
           myTodoTable.delegate = self
          myTodoTable.dataSource = self
    }
    
}

extension MyTodoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTodoTable.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
          cell.textLabel?.text = todoData[indexPath.row].todo
          if self.todoData[indexPath.row].isCompleted {
              cell.textLabel?.textColor = .gray
              cell.imageView?.image = UIImage(systemName: "checkmark.circle.fill")
          } else {
              cell.textLabel?.textColor = .black
              cell.imageView?.image = UIImage(systemName: "circle")
          }
          return cell
      }
      func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
          let myAction = UIContextualAction(style: .normal, title: "완료") { action, view, completionHandler in
              self.todoData[indexPath.row].isCompleted.toggle()
              self.myTodoTable.reloadData()
              completionHandler(true)
          }
          return UISwipeActionsConfiguration(actions: [myAction])
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          myTodoTable.deselectRow(at: indexPath, animated: true)
      }
  }
