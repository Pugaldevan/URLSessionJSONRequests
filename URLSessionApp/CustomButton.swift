//
//  CustomButton.swift
//  URLSessionApp
//
//  Created by PugalMuni on 24/03/19.
//  Copyright © 2019 PugalMuni R. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class CustomButton: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
}
