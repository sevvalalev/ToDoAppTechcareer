//
//  CollectionViewCell.swift
//  ToDoApp
//
//  Created by Sevval Alev on 1.02.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var todoTitle: UILabel!
    @IBOutlet var todoContent: UILabel!
    @IBOutlet var todoView: UIView!
    
    static let identifier = "collectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
        configureUI()
    }
    
    func configureUI() {
        todoView.layer.cornerRadius = 10
    }
    
}
