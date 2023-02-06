//
//  ViewController.swift
//  ToDoApp
//
//  Created by Sevval Alev on 1.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private var collectionView: UICollectionView!
    var colors: [UIColor] = []
    var todoList = [ToDo]()
    var homepagePresenter:ViewToPresenterHomepageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addRandomColors()
        configureCollectionView()
        customNib()
        copyDatabase()
        HomepageRouter.createModule(ref: self)
    }
    //MARK: - UIConfiguration
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 16)/2
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.collectionViewLayout = layout
    }
    
    private func customNib() {
        let customCellNib: UINib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(customCellNib, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    private func addRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    
    private func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let placeToCopy = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: placeToCopy.path) {
            print("Already exist")
        }else{
            do{
                try fm.copyItem(atPath: bundlePath!, toPath: placeToCopy.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homepagePresenter?.loadToDo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let todo = sender as? ToDo {
                let destinationVC = segue.destination as! ToDoDetailVC
                destinationVC.todo = todo
            }
        }
    }
    
    //MARK: - Delete Action
    func configureContextMenu(index: Int) -> UIContextMenuConfiguration{
            let context = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (action) -> UIMenu? in
                let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash"), identifier: nil, discoverabilityTitle: nil, attributes: .destructive, state: .off) { (_) in
                    let todo = self.todoList[index]
                    self.homepagePresenter?.delete(todo_id: todo.todo_id!)
                }
                
                return UIMenu(title: "Options", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [delete])
            }
            return context
        }
}

extension ViewController : PresenterToViewHomepageProtocol {
    func sendDataToView(todoList: [ToDo]) {
        self.todoList = todoList
        self.collectionView.reloadData()
    }
}
//MARK: - SearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homepagePresenter?.search(searchedWord: searchText)
    }
}
//MARK: - Delegate,DataSourcec
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell {
            cell.todoView.backgroundColor = colors[indexPath.row]
            let todo = todoList[indexPath.row]
            cell.todoTitle.text = todo.todo_title
            cell.todoContent.text = todo.todo_content
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let todo = todoList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: todo)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
  
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
            configureContextMenu(index: indexPath.row)
        }
 }

