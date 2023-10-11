//
//  IORadioButton.swift
//  ConstraintSample
//
//  Created by Anand  on 09/01/23.
//

import UIKit

@IBDesignable
open class IORadioButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
   
    */
    @IBInspectable
    var size: CGSize = CGSize(width: 25, height: 25) {
        didSet {
            if size.width > size.height {
                size.height = size.width
            }else{
                 size.width = size.height
            }
            self.frame.size = size
            self.setNeedsLayout()
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var gap:CGFloat = 8 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var btnColor: UIColor = UIColor.green{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var isOn: Bool = true{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    open override func draw(_ rect: CGRect) {
        self.contentMode = .scaleAspectFill
        drawCircles(rect: rect)
    }
    
    
    //MARK:- Draw inner and outer circles
    func drawCircles(rect: CGRect){
        var path = UIBezierPath()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        circleLayer.lineWidth = 1
        circleLayer.strokeColor = btnColor.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(circleLayer)
        
        if isOn {
            let innerCircleLayer = CAShapeLayer()
            let rectForInnerCircle = CGRect(x: gap, y: gap, width: rect.width - 2 * gap, height: rect.height - 2 * gap)
            innerCircleLayer.path = UIBezierPath(ovalIn: rectForInnerCircle).cgPath
            innerCircleLayer.fillColor = btnColor.cgColor
            layer.addSublayer(innerCircleLayer)
        }
        self.layer.shouldRasterize =  true
        self.layer.rasterizationScale = UIScreen.main.nativeScale
    }

    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isOn = !isOn
        self.setNeedsDisplay()
    }
}
