//MARK: Основы ООП

//Mark: - Статические свойства и методы
// Статические свойства или методы это методы и свойства которые принадлежат не обьекту класса, а самому классу
// Статические переменные обьявляются с помощью ключевого слова static, а методы с помощью static или class
//class func можно переопределить,  static переопределить нельзя

class Russian {
    var name: String
    var age: Int
    
    static let nation: String = "Русский"
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func setAge(age: Int) {
        self.age = age
    }
    
    class func doSomething() {
        print("Делаем что то с помощью статического метода")
    }
    
    static func doSomethingYet() {
        print("Делаем что то с помощью еще одного статического метода")
    }
}
//
let russianObj = Russian(name: "Андрей", age: 29)
//russianObj.name = "Денис"
//russianObj.setAge(age: 89)
//print(russianObj.name)
//print(russianObj.age)

print(Russian.nation)
Russian.doSomething()
Russian.doSomethingYet()

//MARK: - Протоколы. Протоколы описывают интерфейс, но реализация этого интерфейса ложиться на класс или структуру которая реализует этот протоколу
protocol Driver {
    var driverLessonsNumber: Int? { get set } // просто set нельзя, только get - можно только поулчить, но нельзя изменить из вне класса, get set можно и поулчить и изменить извне
    func driveCar() -> Void
}

var drivers: [Driver]  = []

struct Human: Driver {
    let name: String
    let age: Int
    var driverLessonsNumber: Int?
    
    func driveCar() {
        print("Поехали")
    }
}

let hum: Human = Human(name: "Влад", age: 25, driverLessonsNumber: 139992234)
drivers.append(hum)

struct Autopilote: Driver {
    let intel: String
    
    var driverLessonsNumber: Int?
    
    func driveCar() {
        print("Автопилот поехал")
    }
}

let autopilot = Autopilote(intel: "core i7", driverLessonsNumber: nil)
drivers.append(autopilot)

//print(drivers) // [Driver]

for driver in drivers {
    driver.driveCar()
}



//Создадим протокол доктор с методом лечить. Создать два класса или структуры Терапевт и Хирург, которые должны реализовать протокол доктор. Протокол доктор содержит функцию лечить.




//Основные принципы ООП:
//1. Наследование
//Говорит о том что мы можем относледоваться от какого нибудь класса, и получить все методы и свойства родительского класса.
//struct наследовать нельзя!
// В iOS запрещено множественное наследование

class TypicalHuman { //Родительский класс
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func getNameWithAge() -> String {
        return "\(name) с возрастом \(age)"
    }
}

class Taxist: TypicalHuman { //Дочерний класс
    func getName() -> String {
        return self.name // self.name взялось из родительского класса
    }
    
    override func getNameWithAge() -> String {
        let parentString = super.getNameWithAge() // вызываем метод родительского класса через super.
        return parentString + " который мы переопределили"
    }
}

let taxis = Taxist(name: "Андрей", age: 26)
print("================================")
print(taxis.getName())
print(taxis.getNameWithAge())



//2. Полиморфизм
//Полиморфизм - Это способность класса соответствовать и реализовывать разным протоколам(Интерфейсам) одновременно.

protocol iOSDeveloper {
    func makeApplicationOnSwift() -> Void
}

class Programmer: TypicalHuman, Driver, iOSDeveloper {
    var driverLessonsNumber: Int?
    
    func driveCar() {
        if driverLessonsNumber != nil {
            print("Поехали красотка кататься")
        } else {
            print("пешочком к пг го")
        }
    }
    
    func makeApplicationOnSwift() {
        print("Да да умеем могем")
    }
}

let andrei = Programmer(name: "Андрей", age: 26)
let denis = Programmer(name: "Денис", age: 25)


print("==========================")
andrei.driveCar()
andrei.makeApplicationOnSwift()
print(andrei.getNameWithAge())


let xArray: [Any] = [123, "324", andrei]

for element in xArray {
//    if element as? String{ // если элемент строка то вызывается первый блок кода, если не строка то второй блок кода  != nil
//        print(element)
//    } else {
//        print("не строка")
//    }
    
//    if let num = element as? Int {
//        print("Это число \(num)")
//    } else {
//        print("Это не число")
//    }
    
    
    if let iOSDev = element as? iOSDeveloper { //элемент соответствует протоколу iOSDeveloper? если да то мы получаем iOSDev: iOSDeveloper, если нет то вызывается else
        iOSDev.makeApplicationOnSwift()
    } else {
        print("Протокол не реализован")
    }
    
    if let driver = element as? Driver { // елемент соответствует протоколу Driver? если да то мы получаем driver: Driver
        driver.driveCar()
    } else {
        print("Не водитель")
    }
    
    if let programmer = element as? Programmer {
        programmer.getNameWithAge()
    } else {
        print("Не программер")
    }
}



//ДЗ:
// - повторить статические методы и свойства и как они используются
// - Выучить Наследование и Полиморфизм
//

//3. Инкапсуляция
