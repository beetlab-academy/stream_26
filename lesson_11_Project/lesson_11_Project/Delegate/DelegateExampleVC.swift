//
//  DelegateExampleVC.swift
//  Lesson_11_Project
//
//  Created by Andrei Konoplev on 18.11.2020.
//

import UIKit

class DelegateExampleVC: UIViewController {
    
    @IBOutlet weak var frameLabel: UILabel!
    @IBOutlet weak var boundsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomView()
    }
    
    fileprivate func setupCustomView() {
        let customView = CustomView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        customView.delegate = self
        view.addSubview(customView)
        
        //У вью есть 2 свойства frame и bounds. тип этого свойства CGRect(координата по x, координата по  y, ширина,  высота)
        //frame - это расположение вью относительно superview. view - это супервью. customView - subview.
        //bounds - это относительно самой себя. x и y всегда равны 0.
        
        //Получаем ширину конкретного девайся
        let deviceScreenWidth = UIScreen.main.bounds.width
        let offset = 20
        customView.frame = CGRect(x: offset, y: 100, width: Int(deviceScreenWidth) - (2 * offset) , height: 100)
        
        //addBlueSubview(to: customView)
        
        view.bringSubviewToFront(customView) // переносит subview к самому верху экрана.
        
        //Как получить доступ к супервью
        customView.backgroundColor = UIColor.systemPink
        
        print(view.subviews.count)
        
    }
    
    func addBlueSubview(to superview: UIView) {
        let view = UIView()
        view.backgroundColor = .blue
        superview.addSubview(view)
        
        let deviceScreenWidth = superview.frame.width
        let height =  superview.frame.height
        let offset = 10
        view.frame = CGRect(x: offset,
                            y: offset,
                            width: Int(deviceScreenWidth) - (2 * offset),
                            height: Int(height) - (offset * 2))
    }
}

extension DelegateExampleVC: CustomViewDelegate {
    func didTouchView(with frame: CGRect) {
        frameLabel.text = "x: \(frame.origin.x), y: \(frame.origin.y), width: \(frame.width), height: \(frame.height)"
    }
    
    func didTouchViewForBounds(with bounds: CGRect) {
        boundsLabel.text = "x: \(bounds.origin.x), y: \(bounds.origin.y), width: \(bounds.width), height: \(bounds.height)"
    }
}

