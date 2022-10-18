//
//  Button+Extension.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 18.10.2022.
//

import Foundation
import UIKit

extension UIButton {
    
    func setCornerRadius(with radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
