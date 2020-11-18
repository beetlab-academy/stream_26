//
//  CustomView.swift
//  Lesson_11_Project
//
//  Created by Andrei Konoplev on 18.11.2020.
//

import UIKit

//1. как добавлять сабвью
//2. Систему координат в iOS
//3.Делегирование

protocol CustomViewDelegate: class {
    func didTouchView(with frame: CGRect) -> Void
    func didTouchViewForBounds(with bounds: CGRect) -> Void
}

class CustomView: UIView {
    
    weak var delegate: CustomViewDelegate? //Вот наш делегат
    
    override init(frame: CGRect) { //вызывается если вызываем инит из кода созданием обьекта
        super.init(frame: frame)
        setupLayot()
    }
    
    required init?(coder: NSCoder) { //Инит вызывается если создавать вью через сториборд
        super.init(coder: coder)
        setupLayot()
        //fatalError("init(coder:) has not been implemented") //Если вы попробуете достать этот класс из сториборды то все крашнется
    }
    
    fileprivate func setupLayot() {
        backgroundColor = UIColor.red
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        delegate?.didTouchView(with: self.frame)
        delegate?.didTouchViewForBounds(with: self.bounds)
    }
    
}

//1. Создаю протокол по которому будет осуществлятся делегирование
//2. Создаем свойсво делегаты у вью которая будет делигировать что то делегату.
//3. вызываем метод протокола у делегата и передаем туда какие то данные если это необходимо
