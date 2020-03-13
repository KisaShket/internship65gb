//
//  CustomCell.swift
//  internship65gb
//
//  Created by Miska  on 26.02.2020.
//  Copyright © 2020 Miska . All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var bodyView: UIView!
    
    
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactEmail: UILabel!
    @IBOutlet weak var contactPhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBodyView()
        setupShadowView()
    }
    
    private func setupShadowView() {
        shadowView.backgroundColor = UIColor.clear
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 2.6
        shadowView.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    private func setupBodyView() {
        bodyView.layer.cornerRadius = 14.0
        bodyView.clipsToBounds = true
    }
}
