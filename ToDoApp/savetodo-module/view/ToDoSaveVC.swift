//
//  ToDoSaveVC.swift
//  ToDoApp
//
//  Created by Sevval Alev on 3.02.2023.
//

import UIKit

class ToDoSaveVC: UIViewController {

    @IBOutlet private var todoTitle: UITextField!
    @IBOutlet private var todoDetail: UITextView!
    @IBOutlet private var todoButton: UIButton!
    
    var saveToDoPresenter:ViewToPresenterSaveToDoProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SaveToDoRouter.createModule(ref: self)
        configureUITextView()
    }
    
    private func configureUITextView() {
        todoDetail.layer.cornerRadius = 5
        todoDetail.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        todoDetail.layer.borderWidth = 0.5
        todoDetail.clipsToBounds = true
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if let todoTitle = todoTitle.text , let todoDetail = todoDetail.text {
            saveToDoPresenter?.save(todo_title: todoTitle, todo_content: todoDetail)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
