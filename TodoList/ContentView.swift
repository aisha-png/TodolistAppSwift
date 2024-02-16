//
//  ContentView.swift
//  TodoList
//
//  Created by Aisha Mohamed on 14/02/2024.
//

import SwiftUI
struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct ContentView: View {
    @State var timesBeingTapped = 0
    @State private var petName = ""
    @State private var todos: [TodoItem] = [
        TodoItem(title: "Todo 1"),
        TodoItem(title: "Todo 2"),
        TodoItem(title: "Todo 3"),
        TodoItem(title: "Todo 4"),
        TodoItem(title: "Todo 5")
        ]
    @State private var newTodoTitle = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("todoImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200)
                    .foregroundColor(.accentColor)
                    .padding()

                
                Form {
                    Section(header: Text("Todos!")) {
                        ForEach(todos.indices, id: \.self) { index in
                            HStack {
                                TextField("Enter todo \(index + 1)", text: self.$todos[index].title)
                                Spacer()
                                Toggle("", isOn: self.$todos[index].isCompleted)
                                    .labelsHidden()
                                
                            }
                        }
                        
                        
                        HStack {
                            TextField("New todo", text: $newTodoTitle)
                            Button("Submit") {
                                if !newTodoTitle.isEmpty {
                                    todos.append(TodoItem(title: newTodoTitle))
                                    newTodoTitle = ""
                                }
                            }
                        }
                    }
                }
                
                
            }
            .padding()
            .background(Color.gray)
            .navigationBarTitle("Todos")

        }
    }
    
    
    private func index(for todo: TodoItem) -> Int {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            return index
        }
        return 0
    }
}

#Preview {
    ContentView()
}
