//
//  Helpers+Extensions.swift
//  pokemonMix
//
//  Created by Orhun Akmil on 22.03.2024.
//

import Foundation
import UIKit


extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}


extension UIView {
    
    class func fromNib<T: UIView>() -> T {
#if SWIFT_PACKAGE
        let bundle = Bundle.module
#else
        let bundle = Bundle(for: PokemonViewController.self)
#endif
        return bundle.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
