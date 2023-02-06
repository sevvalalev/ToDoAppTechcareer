//
//  Color+Ext.swift
//  ToDoApp
//
//  Created by Sevval Alev on 2.02.2023.
//

import UIKit

extension UIColor {
    
   static func random() -> UIColor {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 0.6)
        return randomColor
    }
}
