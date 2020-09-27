//Основы ООП:

//MARK: - классы и структуры
//1. Переменные и константы внутри структуры или класса называются - СВОЙСТВА
//2. Функции внутри структур и классов называются МЕТОДЫ.
//3. struct - это value type, как и (Int, String, array, dict, etc)
//4. class - это reference type
//5. struct - нельзя наследовать
//6. обьекты struct - храняться в Stackе, обьекты класса хранятся в heap(куче)

//MARK - Принципы ООП програмирования
//1.
//2.
//3.

struct Person { //Структура формирует сама инициализатор
    let name: String //Свойство имени
    let age: Int //Свойство возраста
    
    func getNameWithAgeString() -> String {
        return "Меня зовут \(self.name) и мне \(self.age) лет." // self. -обращение к свойству обьекта структуры или класса.
    }
}

let denis = Person(name: "Денис", age: 25)
let vlad = Person(name: "Vladislav", age: 25)
let andrei = Person(name: "Andrei", age: 26)

let academyTeam: [Person] = [denis, vlad, andrei]


academyTeam.forEach { (xuy) in
    print(xuy.getNameWithAgeString())
}

struct Table {
    let material: String
    let cost: Int
    let color: String
    let legsCount: Int
    
    var isSomethingOnThisTable: Bool = false
    
    mutating func putSomethingOnThisTable() { // Если вы хотите в структуре поменять self.свойство из функции, вы должны дописать к функции mutating
        self.isSomethingOnThisTable = true
    }
    
    mutating func clearTable() {
        self.isSomethingOnThisTable = false
    }
    
    func tableDescription() {
        isSomethingOnThisTable ? print("На столе чтото есть") : print("Стол пуст")
//        if isSomethingOnThisTable {
//            print("На столе чтото есть")
//        } else {
//            print("Стол пуст")
//        }
    }
}

var firstTable = Table(material: "Деревянный", cost: 17000, color: "Деревянного цвета", legsCount: 5)
var secondTable = Table(material: "Пластиковый", cost: 10000, color: "Белый", legsCount: 4)

var thirdTable = firstTable
thirdTable.putSomethingOnThisTable()
thirdTable.tableDescription()
firstTable.tableDescription() // Так как struct обьекты являются value type то при присвоении thirdTable firstTable, значение firstTable просто скопировалось в переменную thirdTable и теперь мы имеем два одинаковых обьекта в памяти копмуктера



//print(firstTable.isSomethingOnThisTable)
//firstTable.putSomethingOnThisTable()
//print(firstTable.isSomethingOnThisTable)
//firstTable.clearTable()
//print(firstTable.isSomethingOnThisTable)


firstTable.tableDescription()
firstTable.putSomethingOnThisTable()
firstTable.tableDescription()
firstTable.clearTable()
firstTable.tableDescription()

//MARK: - enum

enum Transmission {
    case automatic
    case mechanic
    case robot
    case variator
}

class Car {
    var brandName: String
    let color: String
    let power: Int
    let transmission: Transmission
    
    private var engineStart: Bool = false
    
    init(brandName: String, color: String, power: Int, xuy: Transmission) {
        self.brandName = brandName
        self.color = color
        self.power = power
        self.transmission = xuy
    }
    
    func startEngine() {
        engineStart = true
    }
    
    func finishEngine() {
        engineStart = false
    }
    
    func canGo() -> Bool {
      return engineStart
    }
}


var hyundai = Car(brandName: "Hyundai", color: "gray", power: 123, xuy: .automatic)
var bmw = Car(brandName: "BMW", color: "black", power: 200, xuy: .robot)

print(hyundai.canGo())
hyundai.startEngine()
print(hyundai.canGo())


//Refetence Type
var anotherBMW = bmw
anotherBMW.brandName = "mercedez"
print(bmw.brandName)

// ДЗ: - Почитать про стуктуры и классы, выучить все что я записал с верху
// Повторить enum

//1.Создать структуру Rectangle с 2 свойствами - длина и ширина. Написать методы вычисления периметра и площади
//2.Создать структуру Circle с 1 свойством - радиус. Написать функцию, принимающую на вход объект Circle и вычисляющую площадь окружности.
//3.Создать структуру Human с 2 свойствами - имя и возраст. Создать массив из 20 людей. Написать функцию, принимающую на вход этот массив и печатающую имена людей.

//4.Написать функцию, печатающую имя самого старшего человека из п.3
//5. Решить задачу из предыдущей домашки с помощью структур. Вот эту задачу:
// На вход функции 2 массива. Первый - имена [“Петя”, “Гриша”, “Никола”]. Второй - соответствующие времена пробежки дистанции. [10, 6, 25] (Петя - за 10 минут, Гриша - 6 минут, Никола - 25 минут) . Написать функцию, возвращающую самого медленного и самого быстрого.
//6. Никто ее в прошлой домашке правильно не решил

