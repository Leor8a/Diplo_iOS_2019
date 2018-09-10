//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Luis Ernesto Ochoa Rios on 9/9/18.
//  Copyright © 2018 Luis Ernesto Ochoa Ríos. All rights reserved.
//

import UIKit





class ToDoCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
    var delegate: ToDoCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}


@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
}
