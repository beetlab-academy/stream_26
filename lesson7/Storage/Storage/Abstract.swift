//
//  Abstract.swift
//  Storage
//
//  Created by Andrei Konoplev on 17.10.2020.
//

import Foundation

//MARK: - extension служит для расширения функционала класса или структуры. В Swift мы можем писать только методы в extension. В Objc - еще и свойства.

protocol WokersProtocol {
    func goToWork()
    func doingWork()
    func goFromWork()
}

extension WokersProtocol {
    func goToWork() {
        print("Иду на работу")
    }

    func goFromWork() {
        print("Иду c работы")
    }
}


struct Programmer: WokersProtocol {
    var name: String
    
    func doingWork() {
        typingCode()
        print("\(name) typing code....")
    }
}


struct Whore: WokersProtocol {
    func doingWork() {
       print("sucks")
    }
}

struct Taxist: WokersProtocol {
    func doingWork() {
        let a = "Вожу машину"
        print("Я \(a)")
    }
    
    func goToWork() {
        print("Еду на работу")
    }
    
    func goFromWork() {
         print("С работы еду")
    }
}



extension Int {
    static func getInt() {
        print("sdfsdfsdfsdf")
    }
}

extension Programmer {

    func typingCode() {
        print("Typing......")
    }
}
