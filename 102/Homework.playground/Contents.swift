import UIKit
import PlaygroundSupport

let view = UIView()

view.backgroundColor = .white
view.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 300))

PlaygroundPage.current.liveView = view

let layer = view.layer

let circleLayer = CALayer()

circleLayer.backgroundColor = UIColor.gray.cgColor
circleLayer.frame = CGRect(
    origin: .zero, size: CGSize(width: 200, height: 200)
)
circleLayer.opacity = 0.5

circleLayer.cornerRadius = 50
layer.addSublayer(circleLayer)

circleLayer.frame.origin = CGPoint(
    x: view.center.x
        - circleLayer.frame.width * 0.5,
    y: view.center.y
        - circleLayer.frame.height * 0.5
)

let gradientLayer = CAGradientLayer()

gradientLayer.startPoint = .zero
gradientLayer.endPoint = CGPoint(x: 1, y: 1)
gradientLayer.colors = [
    UIColor.green.cgColor.copy(alpha: 0.5) as Any,
    UIColor.systemTeal.cgColor.copy(alpha: 0.5) as Any,
    UIColor.cyan.cgColor.copy(alpha: 0.5) as Any,
]

gradientLayer.frame = layer.bounds
layer.addSublayer(gradientLayer)

let textlayer = CATextLayer()

textlayer.frame = CGRect(origin: .zero,
                         size: CGSize(width: 180, height: 180))
textlayer.frame.origin = CGPoint(
    x: view.center.x
    - textlayer.frame.width * 0.5,
    y: view.center.y
    - circleLayer.frame.height * 0.25
)

textlayer.font = "AppleGothic" as CFTypeRef
textlayer.fontSize = 12
textlayer.string = """
С днем рождения!
Успеха, радости, везения, любви, желаний исполнения,
миллион ночей и дней; любви до головокружения, и чумового настроения, и самых преданных друзей!
"""
textlayer.isWrapped = true
textlayer.truncationMode = .end
textlayer.alignmentMode = .center
textlayer.foregroundColor = UIColor.white.cgColor

layer.addSublayer(textlayer)
