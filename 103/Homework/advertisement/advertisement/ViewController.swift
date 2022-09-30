//
//  ViewController.swift
//  advertisement
//
//  Created by Рустам Шайхинуров on 30.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
            super.viewDidLoad()

            setup()
            NotificationCenter.default.addObserver(
                self, selector: #selector(reanimate),
                name: UIApplication.willEnterForegroundNotification,
                object: nil
            )
        }

        @objc func reanimate() {
            animate()
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

            animate()
        }

        private let animatingView: UIImageView = .init()
        private let label: UILabel = .init()
        private var layer: CALayer = .init()

        private func setup() {
            view.layer.addSublayer(layer)
            
            view.backgroundColor = .white
            animatingView.frame = CGRect(x: view.center.x / 2, y: view.center.y + 10, width: 200, height: 50)
            animatingView.image = UIImage(systemName: "dollarsign.circle")

            label.text = "Вы выиграли 1.000.00 ₽ !"
            label.font = .systemFont(ofSize: 20)
            label.sizeToFit()
            label.frame.origin = CGPoint(x: view.center.x / 2, y: view.center.y)
            label.backgroundColor = .black
            label.textColor = .white
            
            
            view.addSubview(label)
            view.addSubview(animatingView)
            
        }

        private func animate() {
            let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
            colorAnimation.fromValue = layer.backgroundColor
            colorAnimation.toValue = UIColor.red.cgColor
            colorAnimation.duration = 3
            colorAnimation.repeatCount = .infinity
            colorAnimation.autoreverses = true
            let colorKey = "background color animation"
            layer.add(colorAnimation, forKey: colorKey)
            layer.frame = CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: view.bounds.height))
            layer.backgroundColor = UIColor.green.cgColor

            
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                options: [ .repeat, .autoreverse ]
            ) { [self] in
                label.frame.origin.x = view.center.x / 1.25
            }

            UIView.animateKeyframes(
                withDuration: 5,
                delay: 0,
                options: [ .repeat, .autoreverse ]
            ) { [self] in
                UIView.addKeyframe(
                    withRelativeStartTime: 0, relativeDuration: 0.5
                ) { [self] in
                    animatingView.backgroundColor = .green
                }
                UIView.addKeyframe(
                    withRelativeStartTime: 0, relativeDuration: 0.01
                ) { [self] in
                    animatingView.frame.origin.y = view.center.y + 40
                }
                UIView.addKeyframe(
                    withRelativeStartTime: 0.25, relativeDuration: 0.1
                ) { [self] in
                    animatingView.frame.size = CGSize(width: 300, height: 100)
                }
            }
        }
}

