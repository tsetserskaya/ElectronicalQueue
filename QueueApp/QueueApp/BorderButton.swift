//
//  BorderButton.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 16/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.borderWidth = 1
    }
}
