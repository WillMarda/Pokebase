//
//  ImButton.swift
//  PokeDB
//
//  Created by Willem Marda on 7/3/20.
//  Copyright © 2020 WillMarda. All rights reserved.
//

import Foundation
import UIKit

class ImButton: UIButton{
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if imageView != nil {
            
            imageEdgeInsets = UIEdgeInsets(top: 1, left: 8, bottom: 1, right: (bounds.width - 48) )
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
            layer.cornerRadius = 20.0;

        }
    }
    
    
    deinit {
        print("Button has been deallocated")
    }
    
    
    
}
