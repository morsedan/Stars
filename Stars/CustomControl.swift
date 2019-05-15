//
//  CustomControl.swift
//  Stars
//
//  Created by morse on 5/14/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        var labelArray: [UILabel] = []
        var padding: CGFloat = 8.0
        var distance = componentDimension + padding
        
        for i in self.value...self.componentCount {
            let frame = CGRect(x: padding, y: 0, width: componentDimension, height: componentDimension)
            let label = UILabel(frame: frame)
            addSubview(<#T##view: UIView##UIView#>)
            //create 5 labels
            //add as a subview
            //store into an array
            //add a tag
            //set size
            // basically 3-8 under Build the control view.
        }
    }
    
    //MARK: - Touch Tracking
    
    func updateValue(at touch: UITouch) {
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
//        if bounds.contains(touchPoint) {
//            color = self.color(for: touchPoint)
//            sendActions(for: [.touchDown, .valueChanged])
//        } else {
//            sendActions(for: [.touchDragOutside])
//        }
        updateValue(at: touchPoint)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            color = self.color(for: touchPoint)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
}
