//
//  ViewController.swift
//  NEOHome
//
//  Created by Daniel Montano on 27.10.18.
//  Copyright © 2018 Daniel Montano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roof: UIImageView!
    @IBOutlet weak var wall: UIImageView!
    @IBOutlet weak var neo: UIImageView!
    @IBOutlet weak var window: UIImageView!
    
    @IBOutlet weak var neoHomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let originalTransform = roof.transform
        let outsideTransform = originalTransform.translatedBy(x: 0.0, y: -500.0)
        self.roof.transform = outsideTransform
        
        let windowOriginalTransform = window.transform
        let windowOutsideTransform = windowOriginalTransform.translatedBy(x: -500.0, y: 500.0)
        self.window.transform = windowOutsideTransform
        
        let wallOriginalTransform = wall.transform
        let wallOutsideTransform = wallOriginalTransform.translatedBy(x: 500.0, y: 500.0)
        self.wall.transform = wallOutsideTransform
        
        self.neoHomeLabel.alpha = 0.0
        let animationDuration = 1.0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { _ in
            
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: .transitionFlipFromTop, animations: {
                self.roof.transform = originalTransform
            }, completion: nil)
            
            
            
            UIView.animate(withDuration: 0.5, delay: 0.4, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: .transitionFlipFromTop, animations: {
                self.window.transform = windowOriginalTransform
            }, completion: nil)
            
            
            
            UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: .transitionFlipFromTop, animations: {
                self.wall.transform = wallOriginalTransform
                
            }, completion: { _ in
                
                // Fade in the view
                UIView.animate(withDuration: animationDuration, animations: { () -> Void in
                    self.neoHomeLabel.alpha = 1
                    
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { _ in
                        self.performSegue(withIdentifier: "DevicesListSegue", sender: nil)
                    })
                    
                })
                
            })
        })
        
    }
}

