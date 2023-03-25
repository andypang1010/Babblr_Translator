//
//  HistoryTableViewCell.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/11/11.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
    }
    
    func configure() {
        
    }
}

