//
//  MVVMViewController.swift
//  Interview
//
//  Created by Otis on 2024/9/2.
//

import Foundation
import UIKit
import Combine

class TodoListViewController: UITableViewController {
    private var viewModel = TodoListViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoCell")
        
        viewModel.$todoItems
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        let item = viewModel.todoItems[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.isCompleted ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.todoItems[indexPath.row]
        viewModel.toggleCompletion(for: item.id)
    }
    
    func addTodoItem(_ title: String) {
        viewModel.addTodoItem(title)
    }
}
