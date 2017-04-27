//
//  DraggableImageView.swift
//  TinderClone
//
//  Created by Brandon Aubrey on 4/26/17.
//  Copyright © 2017 Brandon Aubrey. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var contentView: UIView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    
    func initSubviews() {
        
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    var image: UIImage? {
        get { return imageView.image }
        
        set {
            self.imageView.image = newValue
        }
    }
}
