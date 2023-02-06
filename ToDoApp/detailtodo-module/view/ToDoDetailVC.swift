//
//  ToDoDetailVC.swift
//  ToDoApp
//
//  Created by Sevval Alev on 3.02.2023.
//

import UIKit

class ToDoDetailVC: UIViewController {

    @IBOutlet private var todoTitle: UITextField!
    @IBOutlet private var todoDetail: UITextView!
    @IBOutlet private var updateButton: UIButton!

    var todo:ToDo?
    var detailToDoPresenter:ViewToPresenterDetailToDoProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetailTodoRouter.createModule(ref: self)
        configureUITextView()
        
        if let todo = todo{
            todoTitle.text = todo.todo_title
            todoDetail.text = todo.todo_content
        }
    }
    
    private func configureUITextView() {
        todoDetail.layer.cornerRadius = 5
        todoDetail.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        todoDetail.layer.borderWidth = 0.5
        todoDetail.clipsToBounds = true
    }
    
    @IBAction func todoUpdateButtonTapped(_ sender: UIButton) {
        if let todoTitle = todoTitle.text, let todoDetail = todoDetail.text , let todo = todo {
            detailToDoPresenter?.update(todo_id: todo.todo_id!, todo_title: todoTitle, todo_content: todoDetail)
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
