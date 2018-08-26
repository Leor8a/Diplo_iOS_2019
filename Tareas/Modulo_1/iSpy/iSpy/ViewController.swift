//
//  ViewController.swift
//  iSpy
//
//  Created by Luis Ernesto Ochoa Rios on 8/26/18.
//  Copyright © 2018 Luis Ernesto Ochoa Rios. All rights reserved.
//
//  I don't want to spend my life in this.
//  I rather search for other objectives, for now it's fine and pay the bills.
//  I rather become something else.
//  For now, I'll just leave Oingo Boingo take the lead, "Who do I want to be today?"
//  Another anarchist, another fool programming, another passionate man who loves techy things.
//
//
//  Little projects can make big stories.
//
//  Coded, Designed and Made at MXCity by Leor8a
//  Based on the book "App Development with Swift", made by Apple.
//
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.delegate = self
        updateZoomdfor(size: view.bounds.size)
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func updateZoomdfor(size : CGSize){
        // “Use the imageView and the size parameter to calculate the scale.”
        // “Then set the minimumZoomScale property of the scrollView to be that scale”
        
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let scale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = scale
        
    }

}

