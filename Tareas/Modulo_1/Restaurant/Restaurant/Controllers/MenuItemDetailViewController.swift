//
//  MenuItemViewController.swift
//  Restaurant
//
//  Created by Luis Ernesto Ochoa Rios on 9/9/18.
//  Copyright © 2018 Luis Ernesto Ochoa Rios. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {

    var menuItem: MenuItem!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        descriptionLabel.text = menuItem.description
        //addToOrderButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
