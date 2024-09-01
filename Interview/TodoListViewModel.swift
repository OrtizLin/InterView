//
//  TodoListViewModel.swift
//  Interview
//
//  Created by Otis on 2024/9/2.
//

import Foundation

class TodoListViewModel {
    @Published var todoItems: [TodoItem] = []
    
    func toggleCompletion(for id: UUID) {
        if let index = todoItems.firstIndex(where: { $0.id == id }) {
            todoItems[index].isCompleted.toggle()
        }
    }
    
    func addTodoItem(_ title: String) {
        let newItem = TodoItem(id: UUID(), title: title, isCompleted: false)
        todoItems.append(newItem)
    }
}
