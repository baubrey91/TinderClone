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
    //var transform: CGAffineTransform?
    
    @IBOutlet weak var imageView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        center = imageView.center
        //transform = imageView.transform

        imageView.image = UIImage(named: "ryan")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPanGesture(_ panGestureRecognizer: UIPanGestureRecognizer) {
        
        
        let translation = panGestureRecognizer.translation(in: view)
        let velocity = panGestureRecognizer.velocity(in: view)

        if panGestureRecognizer.state == .changed {
            
            if translation.x > 100 {
                
                UIView.animate(withDuration: 2, delay: 0,
                               options: [], animations: {
                    self.imageView.center.x = -500
                }, completion: nil)
                return
            }
            
            if translation.x < -100 {
                
                UIView.animate(withDuration: 2, delay: 0,
                               options: [], animations: {
                                self.imageView.center.x = 500
                }, completion: nil)
                return
            }
            
            let rotation = translation.x.degreesToRadians/10
            
            if panGestureRecognizer.location(in: imageView).y < (imageView.frame.maxY/2) {
                imageView.transform = CGAffineTransform(rotationAngle: rotation)
            } else {
                imageView.transform = CGAffineTransform(rotationAngle: -rotation)
            }

            imageView.center = CGPoint(x: imageView.center.x + (translation.x/100), y: center!.y)

        }
        
        if panGestureRecognizer.state == .ended {

            imageView.transform = .identity

            imageView.center = center!
        }
    }
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

