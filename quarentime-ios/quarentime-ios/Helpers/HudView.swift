//
//  HudView.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 8/04/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

final class HudView: UIView {
    
    private let beginTime = 0.5
    private let strokeStartDuration = 1.2
    private let strokeEndDuration = 0.7
    
    private var spinnerSize: CGSize = .zero
    
    private var lineWidth: CGFloat?
    private var lineColor: UIColor?
    private var needColorAnimation: Bool?
    
    lazy var circleLayer: CAShapeLayer = {
        let layer = createCircleLayer()
        return layer
    }()
    
    class func defaultHudView() -> HudView {
        return HudView(with: 3, lineColor: nil, widthHeight: 30, needColorAnimation: true)
    }
    
    class func hudView(with lineColor: UIColor) -> HudView {
        return HudView(with: 2, lineColor: lineColor, widthHeight: 20, needColorAnimation: false)
    }
    
    private init(with lineWidth: CGFloat, lineColor: UIColor?, widthHeight: CGFloat, needColorAnimation: Bool) {
        super.init(frame: .zero)
        self.lineWidth = lineWidth
        self.lineColor = lineColor
        self.needColorAnimation = needColorAnimation
        spinnerSize = CGSize(width: widthHeight, height: widthHeight)
        setUpHudView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpHudView() {
        addAnimation()
        layer.addSublayer(circleLayer)
    }
    
    override var intrinsicContentSize: CGSize {
        return spinnerSize
    }
    
    private func createCircleLayer() -> CAShapeLayer {
        let layer: CAShapeLayer = CAShapeLayer()
        let path: UIBezierPath = UIBezierPath()
        let size = spinnerSize
        path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                    radius: size.width / 2,
                    startAngle: -(.pi / 2),
                    endAngle: .pi + .pi / 2,
                    clockwise: true)
        layer.strokeColor = lineColor?.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = lineWidth ?? 3
        layer.lineCap = .round
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        return layer
    }
    
    private func addAnimation() {
        circleLayer.add(groupAnimation(), forKey: "GroupANI")
        if let needColorAnimation = needColorAnimation, needColorAnimation {
            circleLayer.add(colorAnimation(), forKey: "ColorANI")
        }
    }
    
    private func colorAnimation() -> CAKeyframeAnimation {
        let colorAnimation = CAKeyframeAnimation(keyPath: "strokeColor")
        colorAnimation.duration = (strokeStartDuration + beginTime) * 4
        colorAnimation.values = [UIColor.systemIndigo.cgColor,
                                 UIColor.systemPink.cgColor,
                                 UIColor.systemPurple.cgColor,
                                 UIColor.systemPink.cgColor ]
        colorAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        colorAnimation.repeatCount = .infinity
        colorAnimation.isRemovedOnCompletion = false
        return colorAnimation
    }
    
    private func groupAnimation() -> CAAnimationGroup {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [rotationAnimation(), strokeEndAnimation(), strokeStartAnimation()]
        groupAnimation.duration = strokeStartDuration + beginTime
        groupAnimation.repeatCount = .infinity
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.fillMode = .forwards
        return groupAnimation
    }
    
    private func rotationAnimation() -> CABasicAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.byValue = Float.pi * 2
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        return rotationAnimation
    }
    
    private func strokeStartAnimation() -> CABasicAnimation {
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.duration = strokeStartDuration
        strokeStartAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0.0, 0.2, 1.0)
        strokeStartAnimation.fromValue = 0
        strokeStartAnimation.toValue = 1
        strokeStartAnimation.beginTime = beginTime
        return strokeStartAnimation
    }
    
    private func strokeEndAnimation() -> CABasicAnimation {
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.duration = strokeEndDuration
        strokeEndAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0.0, 0.2, 1.0)
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 1
        return strokeEndAnimation
    }
    
    func pauseAnimation() {
        circleLayer.speed = 0
        self.alpha = 0
    }
    
    func resumeAnimation() {
        circleLayer.speed = 1
        self.alpha = 1
    }
    
    func resetAnimation() {
        circleLayer.timeOffset = 0
    }
    
    func updateCircle(with progress: CFTimeInterval) {
        if circleLayer.speed > 0 {
            pauseAnimation()
        }
        circleLayer.strokeStart = 0
        let timeoffset = min(progress * 0.5, 0.5)
        circleLayer.timeOffset = timeoffset
        self.alpha = CGFloat(max(0, min(1, timeoffset * 2)))
    }
    
}

final class BlurHudView: UIVisualEffectView {
    
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect ?? UIBlurEffect(style: .systemUltraThinMaterialLight))
        configureHudView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return UIScreen.main.bounds.size //CGSize(width: 70, height: 70)
    }
    
    private func configureHudView() {
        let hudView = HudView.defaultHudView()
        contentView.addSubviewAndConstraintToCenter(hudView)
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
}

