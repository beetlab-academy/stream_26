class Master: Equatable {
    static func == (lhs: Master, rhs: Master) -> Bool {
        return lhs.name == rhs.name && lhs.proffesion == rhs.proffesion
    }
    
    let proffesion: String
    let name: String
    
    init(proffesion: String, name: String) {
        self.name = name
        self.proffesion = proffesion
    }
}

class Client {
    let nameClient: String
    let telephone: Int?
    
    init(nameClient: String, telephone: Int?) {
        self.nameClient = nameClient
        self.telephone = telephone
    }
}

class Service {
    let nameofService: String
    let price: Int?
    let date: Int
    
    init(nameofService: String, price: Int?, date: Int) {
        self.nameofService = nameofService
        self.price = price
        self.date = date
    }
}

class Appointment: Equatable {
    static func == (lhs: Appointment, rhs: Appointment) -> Bool {
        
        return lhs.client.nameClient == rhs.client.nameClient && lhs.master.name == rhs.master.name && lhs.service.nameofService == rhs.service.nameofService
        
    }
    
    let master: Master
    let client: Client
    let service: Service
    
    init(master: Master, client: Client, service: Service) {
        self.master = master
        self.client = client
        self.service = service
    }
}

class Calendar {
    private var dict: [Int: [Appointment]] = [:] // ключ - дата записей value - это массив записей
    //    Добавить запись
    //    Удалить запись
    //    Получить запись по числу
    //
    
    func addAppointment(appointment: Appointment) {
        let date1: Int = appointment.service.date
        if dict[date1] == nil {
            //            создаем массив и добавляем запись и кладем этоти массив по ключу дикшинари дата
            var array = [Appointment]()
            array.append(appointment)
            dict[date1] = array
        } else {
            //            добавить эппойтнпмент
            dict[date1]?.append(appointment)
        }
    }
    
    func getAppointments(with date: Int) -> [Appointment] {
        return dict[date] ?? []
    }
        
    func getAppointments(with master: Master) -> [Appointment] {
        var appointmetsArray = [Appointment]()
        
        for (_, appointments) in dict {  //appointments - массив [Appointment]
            for element in appointments {
                if element.master == master {
                    appointmetsArray.append(element)
                }
            }
        }
        
        return appointmetsArray
    }
    
    
    func deleteAppointment(appointment: Appointment) { // Узкий момент почему я не могу просто взять и удалить newGet
        let date1: Int = appointment.service.date
        if dict[date1] == nil {
            return
        } else {
            var newGet = getAppointments(with: 15)
            for (index, value) in newGet.enumerated() {
                if value == appointment {
                    newGet.remove(at: index)
                }
            }
            dict[date1] = newGet
        }
    }
    
    
    //1. Изучить map и с помощью него написать функцию которая возвращает имена мастеров по дате.
    //2. Вернуть все записи которые соответствуют клиенту
    //3. Вернуть даты по Записям(Передаете в функцию Массив записей и возвращаете массив дат[Int]), (Даты брать только из dict, а не из свойств appointment)
    //4. С помощью функции map вернуть все имена телефонов в crm
    //5. Вернуть все записи передавая в функцию обьект сервиса
    //6. Написать функцию очищающую все записи по дате
    //7. Написать функцию которая удаляет все записи из crm
    
    //К тесту: -
    //Массивы
    //Словари
    //Полиморфизм
    //Наследование
    //Инкапсуляция
    //Статические переменные
    //Классы и структуры
    //Value и Reference Types
}





let client1 = Client(nameClient: "Sveta", telephone: 777)
let client2 = Client(nameClient: "Roman", telephone: 555)

let master1 = Master(proffesion: "colorHair", name: "Gena")
let master2 = Master(proffesion: "manicure", name: "Anna")

let service1 = Service(nameofService: "manicure", price: 700, date: 17)
let service2 = Service(nameofService: "colorHair", price: 5000, date: 15)

let appointment1 = Appointment(master: master1, client: client1, service: service1)
let appointment2 = Appointment(master: master2, client: client2, service: service2)


// Работа с CRM
let crm = Calendar()
crm.addAppointment(appointment: appointment2)
crm.addAppointment(appointment: appointment1)
let appointements1 = crm.getAppointments(with: 15)
print(appointements1[0].client.nameClient)
let appoin = crm.getAppointments(with: master1)
print(appoin)
for appo in appoin {
    print(appo.master.name)
}
