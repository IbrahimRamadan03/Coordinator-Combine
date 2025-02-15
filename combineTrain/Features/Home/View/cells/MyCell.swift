//
//  MyCell.swift
//  combineTrain
//
//  Created by Apple on 13/02/2025.
//

import Foundation


import UIKit

class MyCell: UICollectionViewCell {
    
    override var isSelected: Bool {
         didSet {
             if isSelected {
                 self.mainView.backgroundColor = UIColor.init(hex:"29D697")
             } else {
                 // Reset background color when deselected
                 self.mainView.backgroundColor = UIColor.init(hex:"F5F5F5")
             }
         }
     }
    
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func configure(with text: String) {
       // titleLabel.text = text
    }
}
