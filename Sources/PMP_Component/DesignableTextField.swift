
import Foundation
import UIKit

protocol DesignableTextFieldDelegate: UITextFieldDelegate {
    func textFieldTrailingIconClicked(btn:UIButton)
    func textFieldLeadingIconClicked(btn:UIButton)

}

@IBDesignable
open class DesignableTextField: UITextField {

    //Delegate when image/icon is tapped.
    private var myDelegate: DesignableTextFieldDelegate? {
        get { return delegate as? DesignableTextFieldDelegate }
    }

    @objc func leadingButtonClicked(btn: UIButton){
        self.myDelegate?.textFieldLeadingIconClicked(btn: btn)
    }
    
    @objc func trailingButtonClicked(btn: UIButton){
        self.myDelegate?.textFieldTrailingIconClicked(btn: btn)
    }

    //Padding images on left
    open override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += padding
        return textRect
    }

    //Padding images on Right
    open override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= padding
        return textRect
    }
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.textRect(forBounds: bounds)
        textRect.origin.x += textPadding
        return textRect
    }
    
    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.placeholderRect(forBounds: bounds)
        textRect.origin.x += textPadding
        return textRect
    }

    @IBInspectable public var padding: CGFloat = 0
    @IBInspectable public var textPadding: CGFloat = 0

    @IBInspectable public var leadingImage: UIImage? { didSet { updateView() }}
    @IBInspectable public var trailingImage: UIImage? { didSet { updateView() }}
    @IBInspectable public var color: UIColor = .lightGray { didSet { updateView() }}
    @IBInspectable public var imageColor: UIColor = .black { didSet { updateView() }}
    
    let buttonRect = CGRect(x: 0, y: 0, width: 20, height: 20)

    func updateView() {
        rightViewMode = UITextField.ViewMode.never
        rightView = nil
        leftViewMode = UITextField.ViewMode.never
        leftView = nil

        if let image = leadingImage {
            let button = UIButton(type: .custom)
            button.frame = buttonRect

            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
            button.tintColor = imageColor

            button.setTitleColor(UIColor.clear, for: .normal)
            button.addTarget(self, action: #selector(leadingButtonClicked(btn:)), for: UIControl.Event.touchDown)
            button.isUserInteractionEnabled = true

            leftViewMode = UITextField.ViewMode.always
            leftView = button
        
        }
        
        if let image = trailingImage {
            let button = UIButton(type: .custom)
            button.frame = buttonRect

            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
            button.tintColor = imageColor

            button.setTitleColor(UIColor.clear, for: .normal)
            button.addTarget(self, action: #selector(trailingButtonClicked(btn:)), for: UIControl.Event.touchDown)
            button.isUserInteractionEnabled = true

            rightViewMode = UITextField.ViewMode.always
            rightView = button
            
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}
