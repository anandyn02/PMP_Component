
import UIKit

open class IOComponent {
    
   open class func createLabel(text: String, font: UIFont, color: UIColor) -> UILabel {
        let lbl = UILabel()
        lbl.font = font
        lbl.textColor = color
        lbl.text = text
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    open class func createImageView(radius: CGFloat, bgColor: UIColor) -> UIImageView {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = radius
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = bgColor
        
        return imgView
    }
    
    open class func createView(radius: CGFloat = 0, bgColor: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = bgColor
        view.layer.cornerRadius = radius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    open class func createButton(text: String, radius: CGFloat = 0, titleColor: UIColor, bgColor: UIColor) -> UIButton {
        let btn = UIButton()
        btn.setTitle(text, for: .normal)
        btn.setTitleColor( titleColor, for: .normal)
        btn.backgroundColor = bgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = radius
        return btn
    }
    
    open class func createButtonWith(imageName: String = "", text: String = "",titleColor: UIColor = .clear, radius: CGFloat = 0, bgColor: UIColor) -> UIButton {
        let btn = UIButton()
        if(!imageName.isEmpty) {
            btn.setImage(UIImage(named: imageName), for: .normal)
        }
        else if(!text.isEmpty) {
            btn.setTitle(text, for: .normal)
            btn.setTitleColor( titleColor, for: .normal)
        }
        
        btn.backgroundColor = bgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = radius
        return btn
    }
    
    open class func createStackView(axisType: NSLayoutConstraint.Axis, list: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: list)
        stackView.axis = axisType
        stackView.distribution = .equalSpacing
        stackView.spacing = 1
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    open class func createTableView(bgColor: UIColor, style: UITableView.Style = .plain) -> UITableView {
        let tableView = UITableView(frame: .zero, style: style)
        tableView.backgroundColor = bgColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
    
    open class func createTextField(text: String, textColor: UIColor, font: UIFont) -> DesignableTextField {
        let textField = DesignableTextField()
        textField.placeholder = text
        textField.textColor = textColor
        textField.font = font
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    open class func createTextView(text: String, textColor: UIColor, font: UIFont) -> UITextView {
        let textView = UITextView()
        textView.text = text
        textView.textColor = textColor
        textView.font = font
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }
    
    open class func createSwitch(tintColor: UIColor, thumbColor: UIColor) -> UISwitch {
        let uiSwitch = UISwitch()
        uiSwitch.tintColor = tintColor
        uiSwitch.thumbTintColor = thumbColor
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        return uiSwitch
    }
    
    open class func createSlider(minColor: UIColor, maxColor: UIColor, thumbColor: UIColor) -> UISlider {
        let slider = UISlider()
        slider.minimumTrackTintColor = minColor
        slider.maximumTrackTintColor = maxColor
        slider.thumbTintColor = thumbColor
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }
    
    open class func createScrollview(bgColor: UIColor) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = bgColor
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }
    
    open class func createProgressBar(trackColor: UIColor, progressColor: UIColor) -> UIProgressView {
        let progress = UIProgressView()
        progress.trackTintColor = trackColor
        progress.progressTintColor = progressColor
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }
    
    open class func createSegmentControl(items: [String], font: UIFont, textColor: UIColor) -> UISegmentedControl {
        let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 0
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font: font]
        segment.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segment.setTitleTextAttributes(titleTextAttributes, for: .selected)
        return segment
    }
    
    open class func createCollectionView() -> UICollectionView {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        return collection
    }

    open class func createRadioButton(size: CGFloat = 30, color: UIColor = .black) -> IORadioButton {
        let raidoButton = IORadioButton()
        raidoButton.size = CGSize(width: size, height: size)
        raidoButton.btnColor = color
        raidoButton.translatesAutoresizingMaskIntoConstraints = false
        return raidoButton
    }
}  
