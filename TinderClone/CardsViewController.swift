//
//  ViewController.swift
//  TinderClone
//
//  Created by Brandon Aubrey on 4/26/17.
//  Copyright © 2017 Brandon Aubrey. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var center: CGPoint?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPanGesture(_ panGestureRecognizer: UIPanGestureRecognizer) {
        
        center = imageView.center
        
        let translation = panGestureRecognizer.translation(in: view)
        let velocity = panGestureRecognizer.velocity(in: view)
        
        if panGestureRecognizer.state == .began {
            
        }
        
        if panGestureRecognizer.state == .changed {
            imageView.center = CGPoint(x: imageView.center.x + translation.x, y: center!.y)

        }
        
        if panGestureRecognizer.state == .ended {

            imageView.center = center!
        }
    }
}

