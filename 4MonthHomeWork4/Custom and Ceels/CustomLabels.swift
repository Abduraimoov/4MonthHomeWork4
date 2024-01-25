//
//  CustomLabels.swift
//  4MonthHomeWork4
//
//  Created by Nurtilek on 1/26/24.
//

import UIKit

class CustomLabels: UILabel {

    init(text: String, textColor: UIColor, font: UIFont) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.font = font
        self.textColor = textColor
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

