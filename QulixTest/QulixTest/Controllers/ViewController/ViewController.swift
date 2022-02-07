//
//  ViewController.swift
//  QulixTest
//
//  Created by Женя  on 6.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Property
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var showListNews: UIButton!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationElement()
    }
    
    //MARK: - Logic
    
    @IBAction func showListNewsAction(_ sender: Any) {
        
        let listStoryboard = UIStoryboard(name: "ListViewController", bundle: nil)
        guard let SecondViewController = listStoryboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else { return }
        
        navigationController?.pushViewController(SecondViewController, animated: true)
    }
    
    func animationElement() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.1
        animation.toValue = 1
        animation.beginTime = CACurrentMediaTime() + 0.1
        animation.duration = 2
        animation.autoreverses = false
        animation.repeatCount = 1
        animation.fillMode = .both
        animation.timingFunction = CAMediaTimingFunction.linear
        helloLabel.layer.add(animation, forKey: animation.description)
        showListNews.layer.add(animation, forKey: animation.description)
    }
    
}

//MARK: - Extension for CoreAnimation

extension CAMediaTimingFunction { // Расширение для графика анимаций
    
    // default
    static let `default` = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
    static let linear = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    static let easeIn = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
    static let easeOut = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    static let easeInEaseOut = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    
    // custom
    static let easeInSine = CAMediaTimingFunction(controlPoints: 0.47, 0, 0.745, 0.715)
    static let easeOutSine = CAMediaTimingFunction(controlPoints: 0.39, 0.575, 0.565, 1)
    static let easeInOutSine = CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
    static let easeInQuad = CAMediaTimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
    static let easeOutQuad = CAMediaTimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
    static let easeInOutQuad = CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
    static let easeInCubic = CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
    static let easeOutCubic = CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
    static let easeInOutCubic = CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
    static let easeInQuart = CAMediaTimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
    static let easeOutQuart = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
    static let easeInOutQuart = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
    static let easeInQuint = CAMediaTimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
    static let easeOutQuint = CAMediaTimingFunction(controlPoints: 0.23, 1, 0.32, 1)
    static let easeInOutQuint = CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1)
    static let easeInExpo = CAMediaTimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
    static let easeOutExpo = CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
    static let easeInOutExpo = CAMediaTimingFunction(controlPoints: 1, 0, 0, 1)
    static let easeInCirc = CAMediaTimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
    static let easeOutCirc = CAMediaTimingFunction(controlPoints: 0.075, 0.82, 0.165, 1)
    static let easeInOutCirc = CAMediaTimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
    static let easeInBack = CAMediaTimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
    static let easeOutBack = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
    static let easeInOutBack = CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
}

