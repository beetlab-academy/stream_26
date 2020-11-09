//
//  StartButton.swift
//  DrinkUp
//
//  Created by Andrei Konoplev on 07.11.2020.
//

import UIKit

class StartButton: UIButton {
    
    //method вызовется когда перед тем как кнопка класса StartButton будет добавлена на superview
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        clipsToBounds = true
        layer.cornerRadius = 12
        setBackgroundColor(color: UIColor.systemPink, forState: .normal)
        setBackgroundColor(color: UIColor.systemPink.withAlphaComponent(0.4), forState: .disabled)
        setTitleColor(UIColor.white, for: .normal)
    }
}

extension StartButton {

    func setBackgroundColor(color: UIColor, forState: UIControl.State) {

       UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
       UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
       UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
       let colorImage = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()


       self.setBackgroundImage(colorImage, for: forState)
   }
}

////Example
//
//class A {
//    func viewWillAppear(animated: Bool) {
//        print("fuck \(animated)")
//    }
//}
//
//class B: A {
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated: animated)
//        print("fuck from B")
//    }
//}

