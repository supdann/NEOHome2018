//
//  UIKitExtensions.swift
//  NEOHome
//
//  Created by Daniel Montano on 28.10.18.
//  Copyright © 2018 Daniel Montano. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    static var nib: UINib {
        
        return UINib(nibName: "\(self)", bundle: nil)
    }
}

extension UINib {
    
    func instantiate() -> Any? {
        
        return self.instantiate(withOwner: nil, options: nil).first
    }
}

extension UIView {
    
    static func instantiateFromNib() -> Self? {
        
        func instanceFromNib<T: UIView>() ->T? {
            
            return nib.instantiate() as? T
        }
        
        return instanceFromNib()
    }
}

// MARK: - Methods
public extension UITextField {
    
    /// SwifterSwift: Clear text.
    public func clear() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }
    
    /// SwifterSwift: Set placeholder text color.
    ///
    /// - Parameter color: placeholder text color.
    public func setPlaceHolderTextColor(_ color: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else { return }
        attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: color])
    }
    
    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameter padding: amount of padding to apply to the left of the textfield rect.
    public func addPaddingLeft(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameters:
    ///   - image: left image
    ///   - padding: amount of padding between icon and the left of textfield
    public func addPaddingLeftIcon(_ image: UIImage, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        leftView = imageView
        leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        leftViewMode = .always
    }
    
}
