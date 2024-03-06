//
//  myProfileViewController.swift
//  MyUIKit
//
//  Created by 김예지 on 3/6/24.
//

import UIKit

class myProfileViewController: UIViewController {

    var profileInfo : [String] = ["ID","Email","Phone Number"]
    
    @IBOutlet weak var myProfileTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myProfileTable.delegate = self
        myProfileTable.dataSource = self
    }
}

extension myProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myProfileTable.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        cell.textLabel?.text = profileInfo[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let selectedItem = profileInfo[indexPath.row]
            var segueIdentifier = ""
            
            // 선택된 셀에 따라 Segue Identifier 설정
            switch selectedItem {
            case "ID":
                segueIdentifier = "idSegue"
            case "Email":
                segueIdentifier = "emailSegue"
            case "Phone Number":
                segueIdentifier = "defaultSegue"
            default:
                break
            }
            performSegue(withIdentifier: segueIdentifier, sender: self)
        }
}
