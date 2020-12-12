//
//  ManagementStyleCell.swift
//  HW2.8-pael
//
//  Created by Сергей on 05.12.2020.
//

import UIKit

class ManagementStyleCell: UICollectionViewCell {
    
    @IBOutlet var styleImageView: UIImageView!

    func configure(indexPath: IndexPath) {
        styleImageView.layer.cornerRadius = 10
       
        styleImageView.image = UIImage(named: "\(indexPath.row)")
//        styleImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        styleImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        styleImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        styleImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
