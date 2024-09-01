//
//  MVCViewController.swift
//  Interview
//
//  Created by Otis on 2024/9/2.
//

import Foundation
import UIKit

class MVCViewController: UITableViewController {
    var todoItems: [TodoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return todoItems.count
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
           let item = todoItems[indexPath.row]
           cell.textLabel?.text = item.title
           cell.accessoryType = item.isCompleted ? .checkmark : .none
           return cell
       }
       
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           todoItems[indexPath.row].isCompleted.toggle()
           tableView.reloadRows(at: [indexPath], with: .automatic)
       }
       
       func addTodoItem(_ title: String) {
           let newItem = TodoItem(id: UUID(), title: title, isCompleted: false)
           todoItems.append(newItem)
           tableView.reloadData()
       }
}
