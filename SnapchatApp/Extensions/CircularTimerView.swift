//
//  CircularTimerView.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 10/04/25.
//
import UIKit

class CircularTimerView: UIView {

    private let shapeLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    private var duration: TimeInterval = 10

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCircle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCircle() {
        let centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - 10
        let circularPath = UIBezierPath(arcCenter: centerPoint,
                                        radius: radius,
                                        startAngle: -CGFloat.pi / 2,
                                        endAngle: 3 * CGFloat.pi / 2,
                                        clockwise: true)

        // Fundo (cinza claro)
        backgroundLayer.path = circularPath.cgPath
        backgroundLayer.strokeColor = UIColor.lightGray.cgColor
        backgroundLayer.lineWidth = 10
        backgroundLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(backgroundLayer)

        // Camada do progresso (colorida)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.systemPurple.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 1
        layer.addSublayer(shapeLayer)
    }

    func startCountdown(duration: TimeInterval) {
        self.duration = duration
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 0
        animation.duration = duration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: "countdown")
    }
}

