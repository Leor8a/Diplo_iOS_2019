//
//  ViewController.swift
//  MemeGen
//  Created by Luis Ernesto Ochoa Ríos on 11/08/18.
//  Copyright © 2018 Luis Ernesto Ochoa Ríos. All rights reserved.

// Meme Generator
// Be yourself, and code your everyday life.

/*
 clock ⌛️ :   Not sure if hungry...
 beer  🍺:   Not sure if alcoholic...
 liar  🤥:   Not sure if liar...
 
 picky 🧐 : Or I'm just being picky.
 tired 😩 : Or I'm just being tired.
 demon 😈 : Or I'm really being a demon.
 */



import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    
    var topChoices = [CaptionOption]()
    var bottomChoices = [CaptionOption]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let customFont = UIFont(name: "Impact", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "impact" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """)
        }
        topCaptionLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        bottomCaptionLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        
        
        let clockChoice  = CaptionOption(emoji: "🍕", caption: "Not sure if hungry...")
        let beerChoice = CaptionOption(emoji: "🍺", caption: "Not sure if alcoholic...")
        let liarChoice = CaptionOption(emoji: "🤥", caption: "Not sure if liar...")
        
        topChoices = [clockChoice, beerChoice, liarChoice]
        
        topCaptionSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        
        
        let pickyChoice  = CaptionOption(emoji: "🧐", caption: "Or I'm just being picky.")
        let tiredChoice = CaptionOption(emoji: "😩", caption: "Or I'm just being tired.")
        let demonChoice = CaptionOption(emoji: "😈", caption: "Or I'm really being a demon.")
        
        bottomChoices = [pickyChoice, tiredChoice, demonChoice]
        bottomCaptionSegmentedControl.removeAllSegments()
        for choice in bottomChoices{
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        updateLabels()
        
        
    }
    
    func updateLabels() {
        let topIndex = topCaptionSegmentedControl.selectedSegmentIndex
        let bottomIndex = bottomCaptionSegmentedControl.selectedSegmentIndex
        
        let topChoice = topChoices[topIndex]
        let bottomChoice = bottomChoices[bottomIndex]
        
        topCaptionLabel.text = topChoice.caption
        bottomCaptionLabel.text = bottomChoice.caption
    
    }
    
    @IBAction func segmentTriggered(_ sender: Any) {
        updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

